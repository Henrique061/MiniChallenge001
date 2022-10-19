//
//  EditarMoedas.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 18/10/22.
//

import SwiftUI

struct EditarMoedas: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var sheet: SheetsViewModel
    @State private var tipoMoedaSelecionado: Moeda
    @State private var tempSacoMoedas: [Moeda]
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
        self._tempSacoMoedas = State(initialValue: sheet.fichaSelecionada.carteira)
        self._tipoMoedaSelecionado = State(initialValue: sheet.fichaSelecionada.carteira.first ?? Moeda())
    }
    
    var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("Saco Detalhado"), title: "Saco de Moedas", subtitle: "Edição")) {
            VStack(alignment: .leading, spacing: 10) {
                
                VStack(spacing: 0) {
                    ForEach(tempSacoMoedas, id: \.tipo) { moeda in
                        TemplateRadioButtonWithIdentifier(selectedID: $tipoMoedaSelecionado, id: moeda) {
                            
                        } content: {
                            DisplayTextoBotao(titulo: "Peças de \(moeda.tipo.rawValue)", descricao: "Quantidade: \(moeda.quantidade)")
                        }
                        .frame(height: 50)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                TemplateContentBackground {
                    VStack(alignment: .leading, spacing: 10) {
                        DisplayTextoBotao(titulo: "Peças \(tipoMoedaSelecionado.tipo.rawValue)", descricao: "\(tipoMoedaSelecionado.quantidade)")
                        Divider()
                        HStack(alignment: .center, spacing: 10) {
                            EditButtonRiqueza(valorBotao: 1, quantidade: $tipoMoedaSelecionado.quantidade)
                            EditButtonRiqueza(valorBotao: 10, quantidade: $tipoMoedaSelecionado.quantidade)
                            EditButtonRiqueza(valorBotao: 50, quantidade: $tipoMoedaSelecionado.quantidade)
                            EditButtonRiqueza(valorBotao: 100, quantidade: $tipoMoedaSelecionado.quantidade)
                        }
                        HStack(alignment: .center, spacing: 10) {
                            EditButtonRiqueza(valorBotao: -1, quantidade: $tipoMoedaSelecionado.quantidade)
                            EditButtonRiqueza(valorBotao: -10, quantidade: $tipoMoedaSelecionado.quantidade)
                            EditButtonRiqueza(valorBotao: -50, quantidade: $tipoMoedaSelecionado.quantidade)
                            EditButtonRiqueza(valorBotao: -100, quantidade: $tipoMoedaSelecionado.quantidade)
                        }
                    }
                    .padding(10)
                }
                
                Spacer()
                
                Button("Salvar Alterações") {
                    DispatchQueue.main.async {
                        sheet.fichaSelecionada.carteira = tempSacoMoedas
                    }
                    dismiss()
                }
                .buttonStyle(CustomButtonStyle5())
            }
            .padding(.horizontal, 10)
        }
        
        .onChange(of: tipoMoedaSelecionado) { _ in
            DispatchQueue.main.async {
                for i in 0..<self.tempSacoMoedas.count {
                    if self.tempSacoMoedas[i].tipo == self.tipoMoedaSelecionado.tipo {
                        self.tempSacoMoedas[i].quantidade = self.tipoMoedaSelecionado.quantidade
                    }
                }
            }
        }
    }
}
