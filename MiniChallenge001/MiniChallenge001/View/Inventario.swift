//
//  Inventario.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 15/09/22.
//

import Foundation
import SwiftUI



struct Inventario: View {
    @State var arr: [String] = Array.init(repeating: "Alguma coisa", count: 15)
    var body: some View {
        NavigationView{
            VStack{
                List {
                    
                    Section{
                        VStack(alignment: .leading){
                            
                            Text("Capacidade de carga")
                                .bold()
                            Text("teste")
                            
                        }
                        VStack(alignment: .leading){
                            Text("Saco de Moedas")
                                .bold()
                            HStack{
                                Text("PC: \(1000)\tPP: \(1000)\tPE: \(1000)\tPO: \(1000)\tPL: \(1000)")
                                    .lineLimit(1)
                                    .scaledToFill()
                                //.padding()
                                
                            }
                        }
                        
                    }
                header: {
                    Text("Mochila")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }
                    
                    Section{
                        VStack(alignment: .leading){
                            
                            Text("2X Adaga")
                                .bold()
                            
                            
                            
                            
                            HStack{
                                Text("Arma simples de Corpo-a-Corpo")
                                
                                Text("1,0 Kg")
                                    .frame( alignment: .trailing)
                            }
                        }
                    }
                    
                    
                    Section {
                        ForEach(arr, id: \.self) { item in
                            Text(item)
                        }
                    } header: {
                        Text("Montaria")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                    }
                }
                .listStyle(.insetGrouped)
                
                .navigationTitle("Inventário")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

struct InfoMoeda: View {
    
    @State var tipoMoeda: String
    @State var quantidade: Int
    
    var body: some View {
        Text("\(tipoMoeda): \(quantidade)")
            .lineLimit(1)
            .scaledToFill()
    }
    
}
