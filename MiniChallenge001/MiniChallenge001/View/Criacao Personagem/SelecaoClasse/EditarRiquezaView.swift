//
//  EditarRiquezaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 01/10/22.
//

import SwiftUI

struct EditarRiquezaView: View {
    @EnvironmentObject private var vmclasse: CriacaoClasseViewModel
    
    var body: some View {
        TemplateSheetView(
            header: DefaultSheetHeader(image: Image("Saco Detalhado"), title: "Riqueza da Classe", subtitle: "Nome da Classe")) {
                VStack(alignment: .leading, spacing: 0) {
                    TemplateContentBackground {
                        DisplayTextoBotao(titulo: "Riqueza", descricao: vmclasse.escolha.riquezaInicial)
                            .padding(.horizontal, 10)
                    }
                    
                    TemplateContentBackground {
                        
                    }
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
    
    var body: some View {
        Button {
            
        } label: {
            
        }
        .buttonStyle(CustomButtonStyle2())
    }
}
