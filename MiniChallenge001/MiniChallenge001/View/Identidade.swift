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
        NavigationView{
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
                .navigationTitle("Identidade")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
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
}
