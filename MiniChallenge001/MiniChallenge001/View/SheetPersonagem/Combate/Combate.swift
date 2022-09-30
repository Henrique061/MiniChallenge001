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
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            TemplateTelaPadrao {
                Text("Tela principal do personagem")
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("Nome da Ficha")
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Menu Principal")
                    }
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
