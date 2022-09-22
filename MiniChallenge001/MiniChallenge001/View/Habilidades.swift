//
//  Habilidades.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 15/09/22.
//

// Só para atualizar

import Foundation
import SwiftUI

struct Habilidades: View {
    
    @ObservedObject private var vmmagias = JsonViewModel()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(0..<10) {nivel in
                    Section {
                        ForEach(vmmagias.filterMagiasByLevel(nivel: nivel), id: \.id) { magia in
                            VStack {
                                Text(magia.nome)
                                Text(magia.escola.rawValue)
                            }
                        }
                    } header: {
                        Text(nivel > 0 ? "\(nivel)º Círculo" : "Truques")
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                    }
                }
            }
        }
    }
}
