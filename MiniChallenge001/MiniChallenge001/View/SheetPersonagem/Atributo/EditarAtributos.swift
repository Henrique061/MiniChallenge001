//
//  EditarAtributos.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 19/10/22.
//

import Foundation
import SwiftUI

struct EditarAtributos: View {
    @Binding private var ficha: PersonagemFicha
    @StateObject private var vmatributo: ViewModelAtributo
    @State private var selectedAtributo: Atributo
//    @Environment(\.dismiss) private var dismiss
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._vmatributo = StateObject(wrappedValue: ViewModelAtributo(ficha: ficha.wrappedValue))
        self.selectedAtributo = Atributo(nome: .none, valor: 0)
        self._ficha = ficha
    }
    
    var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("Aprimoramento"), title: "UP de Atributos", subtitle: "Edição")) {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    ListaSelecaoLivreAtributos(selectedAtributo: $selectedAtributo, atributos: $vmatributo.atributos)
                    
                    if selectedAtributo.nome != .none {
                        LivreEditAtributo(atributo: $selectedAtributo) { value in
                            vmatributo.updateAtributoValor(value: value, name: selectedAtributo.nome)
                            DispatchQueue.main.async {
                                self.selectedAtributo.valor = self.vmatributo.atributos.filter({$0.nome == self.selectedAtributo.nome}).first?.valor ?? 0
                            }
                        }
                    }
                    
                    Spacer()
                }
                
                Button("Salvar Alterações") {
                    DispatchQueue.main.async {
                        self.ficha.pontosAtributos = ValoresAtributos(self.vmatributo.atributos)
                    }
//                    dismiss()
                }
                .buttonStyle(CustomButtonStyle5())
                
            }
            .padding(.horizontal, 10)
        }
    }
}
