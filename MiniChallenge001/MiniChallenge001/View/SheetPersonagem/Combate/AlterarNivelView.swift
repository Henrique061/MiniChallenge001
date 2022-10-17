//
//  AlterarNivelView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 17/10/22.
//

import SwiftUI

struct AlterarNivelView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var sheet: SheetsViewModel
    @State private var tempNivel: Int
    @State private var tempVidaMaxima: Int
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
        self._tempNivel = State(initialValue: sheet.fichaSelecionada.nivel)
        self._tempVidaMaxima = State(initialValue: sheet.fichaSelecionada.pontosVidaMaximo)
    }
    
    var body: some View {
        
        TemplateSheetView(header: DefaultSheetHeader(image: Image("Aprimoramento"), title: "Alteração de Nível", subtitle: "Edição")) {
            
            VStack(spacing: 10) {
                
                TemplateContentBackground {
                    VStack(alignment: .leading, spacing: 10) {
                        DisplayTextoBotao(titulo: "Nível", descricao: "\(self.tempNivel)")
                        Divider()
                        HStack(alignment: .center) {
                            Button("-1") {
                                self.setNivel(value: -1)
                            }.buttonStyle(CustomButtonStyle4())
                            
                            Text("\(self.tempNivel)")
                                .font(.system(size: 25, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity)
                            
                            Button("+1") {
                                self.setNivel(value: 1)
                            }.buttonStyle(CustomButtonStyle4())
                        }
                    }
                    .padding(10)
                }
                
                TemplateContentBackground {
                    VStack(alignment: .leading, spacing: 10) {
                        DisplayTextoBotao(titulo: "Vida Máxima", descricao: "\(self.tempVidaMaxima)")
                        Divider()
                        HStack(alignment: .center) {
                            Button("-1") {
                                self.setVidaMaxima(value: -1)
                            }.buttonStyle(CustomButtonStyle4())
                            
                            Text("\(self.tempVidaMaxima)")
                                .font(.system(size: 25, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity)
                            
                            Button("+1") {
                                self.setVidaMaxima(value: +1)
                            }.buttonStyle(CustomButtonStyle4())
                        }
                    }
                    .padding(10)
                }
                
                Spacer()
                
                Button("Salvar Alterações") {
                    DispatchQueue.main.async {
                        self.sheet.fichaSelecionada.nivel = self.tempNivel
                        self.sheet.fichaSelecionada.pontosVidaMaximo = self.tempVidaMaxima
                        let _ = sheet.saveFicha()
                    }
                    self.dismiss()
                }
                .buttonStyle(CustomButtonStyle5())
            }
            .padding(.horizontal, 10)
            
        }
        
    }
    
    private func setNivel(value: Int) {
        DispatchQueue.main.async {
            if (self.tempNivel + value) > 20 || (self.tempNivel + value) < 0 {
                return
            }
            self.tempNivel += value
        }
    }
    
    private func setVidaMaxima(value: Int) {
        DispatchQueue.main.async {
            if (self.tempVidaMaxima + value) < 0 {
                return
            }
            self.tempVidaMaxima += value
        }
    }
}
