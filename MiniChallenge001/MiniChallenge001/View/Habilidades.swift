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
    @State var searchText = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Section{
                    Text(" ")
                        .searchable(text: $searchText)
                        .navigationTitle("Habiliddes")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button() {
                                    print("Pressed")
                                } label: {
                                    Image("Habilidade Livro").accentColor(.black)
                                }
                            }
                        }
                }
                
                    List{
                        Section{
                            Section{
                                VStack(alignment: .leading){
                                    Text("Amizade")
                                    Text("Encantamento")
                                }
                            }
                            Section{
                                VStack(alignment: . leading){
                                    Text("ataque certeiro")
                                    Text("Adivinhação")
                                }
                            }
                            
                        }header: {
                            Text("Truque")
                            .font(.system(size: 20, weight: .bold, design: .rounded))}
                        
                    }.listStyle(.insetGrouped)
                
                
                List{
                    Section{
                        Section{
                            VStack(alignment: .leading){
                                Text("Amizade")
                                Text("Encantamento")
                            }
                        }
                        Section{
                            VStack(alignment: . leading){
                                Text("ataque certeiro")
                                Text("Adivinhação")
                            }
                        }
                        Button("issomesmo"){
                            print("carai ele printa")
                        }
                    }header: {
                        Text("Truque")
                        .font(.system(size: 20, weight: .bold, design: .rounded))}
                    
                }.listStyle(.insetGrouped)
                    Section{
                        List{
                            
                        }
                    }header: {
                        Text("2º Círculo")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                    }
                }
                
            
        }
    }
}

