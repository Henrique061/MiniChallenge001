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
                        Text("Mochilha")
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
                            Image(systemName: "cart.fill")
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
    
    private var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.alwaysShowsDecimalSeparator = true
        numberFormatter.decimalSeparator = ","
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.minimumFractionDigits = 1
        return numberFormatter
    }
    
    private var cargaAtual: String {
        var temp: Float = 0
        vmficha.fichaSelecionada.equipamentos.forEach({ temp += $0.peso * Float($0.quantidade) })
        vmficha.fichaSelecionada.armas.forEach({ temp += $0.peso })
        vmficha.fichaSelecionada.armaduras.forEach({ temp += $0.peso })
        vmficha.fichaSelecionada.ferramentas.forEach({ temp += $0.peso })
        
        return numberFormatter.string(from: NSNumber(value: temp)) ?? "-"
    }
    
    private var capacidadeCarga: String {
        let capacidade = Float(vmficha.fichaSelecionada.pontosAtributos.forca.valor) * 7.5
        return numberFormatter.string(from: NSNumber(value: capacidade)) ?? "-"
    }
    
    public init(vmficha: SheetsViewModel) {
        self.vmficha = vmficha
    }
    
    var body: some View {
        TemplateContentBackground {
            DisplayTextoBotao(titulo: "Capacidade de Carga", descricao: "\(cargaAtual) kg / \(capacidadeCarga) kg")
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
            ForEach(equipamentos, id: \.id) { equipamento in
                Divider()
                ItemCell(nome: equipamento.nome, quantidade: equipamento.quantidade, tipo: equipamento.categoria.rawValue, peso: equipamento.peso)
            }
        } header: {
            SingleLineDisclosureTitle(title: "Equipamentos")
        }
        
        TemplateCustomDisclosureGroup2(showDivider: false) {
            ForEach(armas, id: \.item.id) { item in
                Divider()
                ItemCell(nome: item.item.nome, quantidade: item.quantidade, tipo: "\(item.item.tipo.rawValue) \(item.item.estilo.rawValue)", peso: item.item.peso)
            }
        } header: {
            SingleLineDisclosureTitle(title: "Armas")
        }
        
        TemplateCustomDisclosureGroup2(showDivider: false) {
            ForEach(armaduras, id: \.item.id) { item in
                Divider()
                ItemCell(nome: item.item.nome, quantidade: item.quantidade, tipo: "\(item.item.tipo.rawValue)", peso: item.item.peso)
                    .swipeActions {
                        Button("Alguma coisa") {}
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
                    ItemCell(nome: item.item.nome, quantidade: item.quantidade, tipo: item.item.tipo.rawValue, peso: item.item.peso)
                        .swipeActions {
                            Button("Alguma coisa") {}
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
    
    private var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.alwaysShowsDecimalSeparator = true
        numberFormatter.decimalSeparator = ","
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.minimumFractionDigits = 1
        return numberFormatter
    }
    
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
                if let peso = numberFormatter.string(from: NSNumber(value: peso)) {
                    Text("\(peso) kg")
                        .font(.system(size: 13, weight: .regular, design: .default))
                } else {
                    Text("-")
                        .font(.system(size: 13, weight: .regular, design: .default))
                }
            }
        }
        .padding(10)
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

struct InfoMoeda: View {
    @State var tipoMoeda: String
    @State var quantidade: Int
    
    var body: some View {
        Text("\(tipoMoeda): \(quantidade)")
            .lineLimit(1)
            .scaledToFill()
    }
}
