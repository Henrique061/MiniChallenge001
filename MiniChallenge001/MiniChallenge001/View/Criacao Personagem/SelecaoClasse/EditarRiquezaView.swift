//
//  EditarRiquezaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 01/10/22.
//

import SwiftUI

struct EditarRiquezaView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vmclasse: CriacaoClasseViewModel
    @State private var quantidade: Int
    
    public init(vmclasse: CriacaoClasseViewModel) {
        self._vmclasse = StateObject(wrappedValue: vmclasse)
        self._quantidade = State(initialValue: vmclasse.definidas.escolhaRiqueza.quantidade)
    }
    
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
                        self.vmclasse.setRiqueza(moeda: Moeda(quantidade: self.quantidade, tipo: .ouro))
                        dismiss()
                    } label: {
                        Text("Salvar Alteração")
                    }
                    .buttonStyle(CustomButtonStyle5())
                }
                .padding(.horizontal, 10)
            }
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
