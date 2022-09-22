//
//  Inventario.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 15/09/22.
//

import Foundation
import SwiftUI

// Só para atualizar

struct Atributos: View {
    @State var teste = true
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section{
                        HStack{
                        VStack(alignment: .leading){
                            Text("Pontos adicionais")
                                .bold()
                            Text("02")
                        }
                            Toggle(isOn: $teste){
                            
                            }
                            
                            
                            
                        }
                        
                    }header: {
                        Text("Bônus de Proeficiência")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                    }
                    Section{
                        VStack(alignment: .leading){
                            HStack{
                                VStack{
                            Text("Forc")
                                .bold()
                                .font(.system(size: 15))
                        
                                Text("Arma simples de Corpo-a-Corpo")
                                    .font(.system(size: 13))
                                    
                            }
                                VStack{
                                    
                                
                                
                                Text("inteligencia")
                                        .bold()
                                    .frame( alignment: .trailing)
                                    .font(.system(size: 15))
                                    
                                    Text("18 ")
                                }
                                    
                            }
                        }
                    }header: {
                        Text("Atributos")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                    }
                    
                }
                .listStyle(.insetGrouped)
                
                .navigationTitle("Atributos")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button() {
                            print("Pressed")
                        } label: {
                            Image("Penalidade").accentColor(.black)
                        }
                    }
                }
            }
            
        }
    }
}

