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
                VStack(spacing: 10) {
                    CapacidadeDeCarga(vmficha: sheet)
                    SacoDeMoedas(vmficha: sheet)
                    Spacer()
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
    
    public init(vmficha: SheetsViewModel) {
        self.vmficha = vmficha
    }
    
    var body: some View {
        TemplateContentBackground {
            DisplayTextoBotao(titulo: "Capacidade de Carga", descricao: "* calcular carga / * calcular total")
                .padding(10)
        }
    }
}

private struct SacoDeMoedas: View {
    
    @ObservedObject private var vmficha: SheetsViewModel
    
    public init(vmficha: SheetsViewModel) {
        self.vmficha = vmficha
    }
    
    var body: some View {
        
        TemplateCustomDisclosureGroup2 {
            ForEach(vmficha.fichaSelecionada.carteira, id: \.tipo) { moeda in
                DisplayTextoBotao(titulo: moeda.tipo.rawValue, descricao: "Quantidade: \(moeda.quantidade)")
            }
        } header: {
            DisplayTextoBotao(titulo: "Saco de Moedas", descricao: "Toque para abrir...")
                .padding(10)
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
