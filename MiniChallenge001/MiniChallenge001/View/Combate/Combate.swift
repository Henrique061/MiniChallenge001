//
//  Combate.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 15/09/22.
//

// Só para atualizar

import Foundation
import SwiftUI

struct Combate: View {
    var body: some View {
        NavigationView{
            Text("Combate")
                
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        NavigationBarTitle("Nome da Ficha")
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button() {
                            print("Pressed")
                        } label: {
                            Image("Temporizador").accentColor(.black)
                            
                        }
                    }
                }
        }
    }
}
