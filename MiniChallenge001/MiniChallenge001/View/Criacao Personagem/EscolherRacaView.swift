//
//  EscolherRacaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 25/09/22.
//

import SwiftUI

struct EscolherRacaView: View {
    var body: some View {
        VStack {
            Text("Escolher Raça View")
            
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Escolher Raça View")
                    }
                }
        }
    }
}

struct EscolherRacaView_Previews: PreviewProvider {
    static var previews: some View {
        EscolherRacaView()
    }
}
