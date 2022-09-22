//
//  TestView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 21/09/22.
//

import Foundation
import SwiftUI

struct TesteView: View {
    
    var body: some View {
        Button {
            let teste = FactoryMagiasConhecidas.criarMagiasComTudo(classe: .clerigo, limiteTruePorNivel: [3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5])
            for i in teste {
                print("Nível: \(i.nivel)", terminator: "\t")
                print("Limite truque: \(i.quantiaTruques)", terminator: "\t")
                print("Limite magias: \(i.quantiaMagias)")
            }
        } label: {
            Text("Botãozim do capeta")
        }
    }
}
