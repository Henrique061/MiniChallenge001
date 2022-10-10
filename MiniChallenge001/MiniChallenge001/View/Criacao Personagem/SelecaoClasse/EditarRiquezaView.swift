//
//  EditarRiquezaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 01/10/22.
//

import SwiftUI

struct EditarRiquezaView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var vmclasse: CriacaoClasseViewModel
    
    @State private var quantidade: Int = 0
    
    var body: some View {
        TemplateSheetView(
            header: DefaultSheetHeader(image: Image("Saco Detalhado"), title: "Riqueza da Classe", subtitle: "Nome da Classe")) {
                VStack(alignment: .leading, spacing: 10) {
                    TemplateContentBackground {
                        DisplayTextoBotao(titulo: "Riqueza", descricao: vmclasse.escolha.riquezaInicial)
                            .padding(10)
                    }
                    
                    TemplateContentBackground {
                        VStack(alignment: .leading, spacing: 10) {
                            DisplayTextoBotao(titulo: "Peças de Ouro", descricao: "\(quantidade)")
                            Divider()
                            HStack(alignment: .center, spacing: 10) {
                                EditButtonRiqueza(valorBotao: 1, quantidade: $quantidade)
                                EditButtonRiqueza(valorBotao: 10, quantidade: $quantidade)
                                EditButtonRiqueza(valorBotao: 50, quantidade: $quantidade)
                                EditButtonRiqueza(valorBotao: 100, quantidade: $quantidade)
                            }
                            HStack(alignment: .center, spacing: 10) {
                                EditButtonRiqueza(valorBotao: -1, quantidade: $quantidade)
                                EditButtonRiqueza(valorBotao: -10, quantidade: $quantidade)
                                EditButtonRiqueza(valorBotao: -50, quantidade: $quantidade)
                                EditButtonRiqueza(valorBotao: -100, quantidade: $quantidade)
                            }
                        }
                        .padding(10)
                    }
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Salvar Alteração")
                    }.buttonStyle(CustomButtonStyle5())
                }.padding(.horizontal, 10)
            }
    }
}

struct EditarRiquezaView_Previews: PreviewProvider {
    static var previews: some View {
        EditarRiquezaView()
    }
}

struct EditButtonRiqueza: View {
    
    let valorBotao: Int
    @Binding var quantidade: Int
    
    var body: some View {
        Button(valorBotao > 0 ? "+\(valorBotao)" : "\(valorBotao)") {
            self.quantidade = quantidade + valorBotao
        }
        .buttonStyle(CustomButtonStyle4())
        .frame(height: 40)
    }
}
