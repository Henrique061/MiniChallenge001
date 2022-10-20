//
//  Inventario.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 15/09/22.
//

import Foundation
import SwiftUI

// Só para atualizar

struct Inventario: View {
    @ObservedObject private var sheet: SheetsViewModel
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
    }
    
    var body: some View {
        CustomNavigationView {
            TemplateTelaPadrao {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Mochila")
                            .font(.system(size: 30, weight: .bold, design: .default))
                        CapacidadeDeCarga(vmficha: sheet)
                        SacoDeMoedas(vmficha: sheet)
                        ListaEquipamentos(sheet: sheet)
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                }
                
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        NavigationBarTitle("Inventário")
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            LojaItens(sheet: sheet)
                        } label: {
                            Image(systemName: "bag.fill")
                                .renderingMode(.template)
                                .foregroundColor(Color("BlackAndWhite"))
                        }
                    }
                }
            }
        }
    }
    
    func testeDelete(index: IndexSet) { }
}

private struct CapacidadeDeCarga: View {
    
    @ObservedObject private var vmficha: SheetsViewModel
    
    private var cargaAtual: String {
        var temp: Float = 0
        vmficha.fichaSelecionada.equipamentos.forEach({ temp += $0.peso * Float($0.quantidade) })
        vmficha.fichaSelecionada.armas.forEach({ temp += $0.peso })
        vmficha.fichaSelecionada.armaduras.forEach({ temp += $0.peso })
        vmficha.fichaSelecionada.ferramentas.forEach({ temp += $0.peso })
        
        return FormatterUtils.formatarPeso(num: temp)
    }
    
    private var capacidadeCarga: String {
        let capacidade = Float(vmficha.fichaSelecionada.pontosAtributos.forca.valor) * 7.5
        return FormatterUtils.formatarPeso(num: capacidade)
    }
    
    public init(vmficha: SheetsViewModel) {
        self.vmficha = vmficha
    }
    
    var body: some View {
        TemplateContentBackground {
            DisplayTextoBotao(titulo: "Capacidade de Carga", descricao: "\(cargaAtual) / \(capacidadeCarga) ")
                .padding(10)
        }
    }
}

private struct SacoDeMoedas: View {
    
    @ObservedObject private var vmficha: SheetsViewModel
    @State private var showEditMoedas: Bool = false
    
    public init(vmficha: SheetsViewModel) {
        self.vmficha = vmficha
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TemplateCustomDisclosureGroup2(showDivider: false) {
                ForEach(vmficha.fichaSelecionada.carteira, id: \.tipo) { moeda in
                    Divider()
                    DisplayTextoBotao(titulo: "Peças de \(moeda.tipo.rawValue)", descricao: "Quantidade: \(moeda.quantidade)")
                        .padding(.horizontal, 10)
                        .frame(height: 50)
                }
            } header: {
                DisplayTextoBotao(titulo: "Saco de Moedas", descricao: "Toque para abrir...")
            }
            
            Button("Editar Moedas") {
                showEditMoedas.toggle()
            }
            .buttonStyle(CustomButtonStyle5())
            .sheet(isPresented: $showEditMoedas) {
                EditarMoedas(sheet: vmficha)
            }
        }
    }
}

private struct ListaEquipamentos: View {
    
    @ObservedObject private var sheet: SheetsViewModel
    @State private var selectedArma: ArmaJSON?
    @State private var selectedFerramenta: FerramentaJSON?
    @State private var selectedArmadura: ArmaduraJSON?
    @State private var selectedEquipamento: EquipamentoJSON?
    
    private var equipamentos: [EquipamentoJSON] {
        return InventarioUtils<EquipamentoJSON>.formatListEquipamentos(equipamentos: sheet.equipamentos)
    }
    
    private var armas: [ItemTabela<ArmaJSON>] {
        return InventarioUtils<ArmaJSON>.formatListItem(itens: sheet.fichaSelecionada.armas)
    }
    
    private var armaduras: [ItemTabela<ArmaduraJSON>] {
        return InventarioUtils<ArmaduraJSON>.formatListItem(itens: sheet.fichaSelecionada.armaduras)
    }
    
    private var ferramentas: [ItemTabela<FerramentaJSON>] {
        return InventarioUtils<FerramentaJSON>.formatListItem(itens: sheet.fichaSelecionada.ferramentas)
    }
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup2(showDivider: false) {
            if sheet.fichaSelecionada.equipamentos.isEmpty {
                Divider()
                Text("Não há equipamentos em seu inventário.")
                    .padding(10)
            } else {
                ForEach(equipamentos, id: \.id) { equipamento in
                    Divider()
                    Button {
                        selectedEquipamento = equipamento
                    } label: {
                        ItemCell(nome: equipamento.nome, quantidade: equipamento.quantidade, tipo: equipamento.categoria.rawValue, peso: equipamento.peso)
                    }
                }.sheet(item: $selectedEquipamento) { equipamento in
                    SheetDescricaoEquipamento(equipamento: equipamento, buttonTitle: "Remover do Inventário") {
                        DispatchQueue.main.async {
                            for i in 0..<self.sheet.fichaSelecionada.equipamentos.count {
                                if equipamento.id == self.sheet.fichaSelecionada.equipamentos[i].id {
                                    self.sheet.fichaSelecionada.equipamentos.remove(at: i)
                                    return
                                }
                            }
                        }
                    }
                }
                
            }
        } header: {
            SingleLineDisclosureTitle(title: "Equipamentos")
        }
        
        TemplateCustomDisclosureGroup2(showDivider: false) {
            if sheet.fichaSelecionada.armas.isEmpty {
                Divider()
                Text("Não há armas em seu inventário.")
                    .padding(10)
            } else {
                ForEach(armas, id: \.item.id) { item in
                    Divider()
                    Button {
                        self.selectedArma = item.item
                    } label: {
                        ItemCell(nome: item.item.nome, quantidade: item.quantidade, tipo: "\(item.item.tipo.rawValue) \(item.item.estilo.rawValue)", peso: item.item.peso)
                    }
                }
                .sheet(item: $selectedArma) { arma in
                    SheetDescricaoArma(arma: arma, buttonTitle: "Remover do Inventário") {
                        DispatchQueue.main.async {
                            for i in 0..<self.sheet.fichaSelecionada.armas.count {
                                if arma.id == self.sheet.fichaSelecionada.armas[i].id {
                                    self.sheet.fichaSelecionada.armas.remove(at: i)
                                    return
                                }
                            }
                        }
                    }
                }
            }
        } header: {
            SingleLineDisclosureTitle(title: "Armas")
        }
        
        TemplateCustomDisclosureGroup2(showDivider: false) {
            if sheet.fichaSelecionada.armaduras.isEmpty {
                Divider()
                Text("Não há armaduras em seu inventário")
                    .padding(10)
            } else {
                ForEach(armaduras, id: \.item.id) { item in
                    Divider()
                    Button {
                        self.selectedArmadura = item.item
                    } label: {
                        ItemCell(nome: item.item.nome, quantidade: item.quantidade, tipo: "\(item.item.tipo.rawValue)", peso: item.item.peso)
                    }
                }
                .sheet(item: $selectedArmadura) { armadura in
                    SheetDescricaoArmadura(armadura: armadura, buttonTitle: "Remover do Inventário") {
                        DispatchQueue.main.async {
                            for i in 0..<self.sheet.fichaSelecionada.armaduras.count {
                                if armadura.id == self.sheet.fichaSelecionada.armaduras[i].id {
                                    self.sheet.fichaSelecionada.armaduras.remove(at: i)
                                    return
                                }
                            }
                        }
                    }
                }
            }
        } header: {
            SingleLineDisclosureTitle(title: "Armaduras")
        }
        
        TemplateCustomDisclosureGroup2(showDivider: false) {
            if sheet.fichaSelecionada.ferramentas.isEmpty {
                Divider()
                Text("Não há ferramentas em seu inventário.")
                    .padding(10)
            } else {
                ForEach(ferramentas, id: \.item.id) { item in
                    Divider()
                    Button {
                        self.selectedFerramenta = item.item
                    } label: {
                        ItemCell(nome: item.item.nome, quantidade: item.quantidade, tipo: item.item.tipo.rawValue, peso: item.item.peso)
                    }
                }
                .sheet(item: $selectedFerramenta) { ferramenta in
                    SheetDescricaoFerramenta(ferramenta: ferramenta, buttonTitle: "Remover do Inventário") {
                        DispatchQueue.main.async {
                            for i in 0..<sheet.fichaSelecionada.ferramentas.count {
                                if ferramenta.id == sheet.fichaSelecionada.ferramentas[i].id {
                                    sheet.fichaSelecionada.ferramentas.remove(at: i)
                                    return
                                }
                            }
                        }
                    }
                }
            }
        } header: {
            SingleLineDisclosureTitle(title: "Ferramentas")
        }
    }
}

struct ItemCell: View {
    
    private var nome: String
    private var quantidade: Int
    private var tipo: String
    private var peso: Float
    
    public init(nome: String, quantidade: Int, tipo: String, peso: Float) {
        self.nome = nome
        self.quantidade = quantidade
        self.tipo = tipo
        self.peso = peso
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("x\(quantidade) \(nome)")
                .font(.system(size: 15, weight: .bold, design: .default))
            HStack {
                Text("\(tipo)")
                    .font(.system(size: 13, weight: .regular, design: .default))
                Spacer()
                Text(FormatterUtils.formatarPeso(num: peso))
            }
        }
    }
}

struct SingleLineDisclosureTitle: View {
    
    private var title: String
    
    public init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(Color("BlackAndWhite"))
            .padding(.vertical, 5)
    }
}
