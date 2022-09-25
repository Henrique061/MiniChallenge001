//
//  CriacaoMain.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 24/09/22.
//

import SwiftUI

struct CriacaoMain: View {
    @State private var nomeFicha: String = ""
    @State private var nomePersonagem: String = ""
    
    var body: some View {
        TelaPadrao {
            VStack {
                Text("Para começarmos, preencha abaixo os dados de seu peronsagem")
                Form {
                    Section {
                        TextField("Nome da ficha", text: $nomeFicha)
                    }
                    Section {
                        TextField("Nome do personagem", text: $nomePersonagem)
                    }
                }
                .textFieldStyle(.roundedBorder)
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Criação de Personagem")
            }
        }
    }
}

struct CriacaoMain_Previews: PreviewProvider {
    static var previews: some View {
        CriacaoMain()
    }
}
