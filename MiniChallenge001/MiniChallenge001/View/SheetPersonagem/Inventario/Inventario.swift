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
                List {
                    Section {
                        CapacidadeCarga(cargaUtilizada: .constant(10.0), cargaTotal: .constant(20.1))
                        MostrarItensJson(title: "Equipamentos", lista: sheet.fichaSelecionada.equipamentos)
                    } header: {
                        Text("Mochila")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                    }
                }
            }
            
            .toolbar{
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("Inventário")
                }
            }
        }
    }
    
    func testeDelete(index: IndexSet) { }
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

struct CapacidadeCarga: View {
    
    @Binding var cargaUtilizada: Float
    @Binding var cargaTotal: Float
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        return formatter
    }
    
    private var cargaFormatada: String {
        let cargaAtual = numberFormatter.string(from: NSNumber(value: cargaUtilizada))
        let cargaMaxima = numberFormatter.string(from: NSNumber(value: cargaTotal))
        return "\(cargaAtual ?? "0,0")kg / \(cargaMaxima ?? "0,0")kg"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Capacidade de Carga")
                .font(.system(size: 15, weight: .bold, design: .rounded))
            Text(cargaFormatada)
        }
    }
}

struct Mochila {
    var itens: [String]
}

struct Montaria {
    var nome: String
    var mochila: Mochila
}
