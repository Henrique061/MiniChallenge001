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
        NavigationView {
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
                .navigationTitle("Inventário")
                .toolbar{
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
    
    private var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.alwaysShowsDecimalSeparator = true
        numberFormatter.decimalSeparator = ","
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.minimumFractionDigits = 1
        return numberFormatter
    }
    
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
                VStack(alignment: .leading, spacing: 3) {
                    Text("x\(equipamento.quantidade) \(equipamento.nome)")
                    HStack {
                        Text("\(equipamento.categoria.rawValue)")
                        Spacer()
                        Text("\(self.numberFormatter.string(from: NSNumber(value: equipamento.peso)) ?? "0,0") kg")
                    }
                }.padding(10)
            }
        } header: {
            Text("Equipamentos")
        }
        
        TemplateCustomDisclosureGroup2(showDivider: false) {
            ForEach(armas, id: \.item.id) { item in
                Divider()
                VStack(alignment: .leading, spacing: 3) {
                    Text("x\(item.quantidade) \(item.item.nome)")
                    HStack {
                        Text("\(item.item.tipo.rawValue) \(item.item.estilo.rawValue)")
                        Spacer()
                        Text("\(self.numberFormatter.string(from: NSNumber(value: item.item.peso)) ?? "0,0") kg")
                    }
                }.padding(10)
            }
        } header: {
            Text("Armas")
        }
        
        TemplateCustomDisclosureGroup2(showDivider: false) {
            ForEach(armaduras, id: \.item.id) { item in
                Divider()
                VStack(alignment: .leading, spacing: 3) {
                    Text("x\(item.quantidade) \(item.item.nome)")
                    HStack {
                        Text("\(item.item.tipo.rawValue)")
                        Spacer()
                        Text("\(self.numberFormatter.string(from: NSNumber(value: item.item.peso)) ?? "0,0") kg")
                    }
                }.padding(10)
            }
        } header: {
            Text("Armaduras")
        }
        
        TemplateCustomDisclosureGroup2(showDivider: false) {
            if sheet.fichaSelecionada.ferramentas.isEmpty {
                Divider()
                Text("Não há ferramentas em seu inventário.")
                    .padding(10)
            } else {
                ForEach(ferramentas, id: \.item.id) { item in
                    Divider()
                    VStack(alignment: .leading, spacing: 3) {
                        Text("x\(item.quantidade) \(item.item.nome)")
                        HStack {
                            Text("\(item.item.tipo.rawValue)")
                            Spacer()
                            Text("\(self.numberFormatter.string(from: NSNumber(value: item.item.peso)) ?? "0,0") kg")
                        }
                    }.padding(10)
                }
            }
        } header: {
            Text("Ferramentas")
        }
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
