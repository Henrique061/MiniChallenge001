//
//  Identidade.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 15/09/22.
//

// Só para atualizar

import Foundation
import SwiftUI

struct Identidade: View {
    
    var body: some View {
        VStack{
            List{
                Section{
                    Text("Nome")
                    Text("Nome")
                }
                Section{  Text("Nome")
                    Text("Nome")
                }
            }.listStyle(.insetGrouped)
        }
        
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal) {
                NavigationBarTitle("Identidade")
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button() {
                    print("Pressed")
                } label: {
                    Image("Aprimoramento").accentColor(.black)
                    
                }
            }
        }
    }
}
