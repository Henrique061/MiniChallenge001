//
//  Inventario.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 15/09/22.
//

import Foundation
import SwiftUI

// Só para atualizar

struct Inventario: View {
    @State var arr: [String] = Array.init(repeating: "Alguma coisa", count: 15)
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section{
                        VStack(alignment: .leading){
                            Text("Amizade")
                                .bold()
                            Text("1,5Kg / 20GKg")
                        }
                        VStack(alignment: .leading){
                            Text("Saco de Moedas")
                                .bold()
                            HStack{
                                Text("PC:\(1000)   PP:\(1000)   PE:\(1000)   PO:\(1000)   PL:\(1000)")
                                    .font(.system(size: 13))
                                    .lineLimit(1)
                                    .scaledToFill()
                            }
                        }
                    }header: {
                        Text("Mochila")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                    }
                    Section{
                        VStack(alignment: .leading){
                            
                            Text("2X Adaga")
                                .bold()
                                .font(.system(size: 15))
                            HStack{
                                Text("Arma simples de Corpo-a-Corpo")
                                    .font(.system(size: 13))
                                Spacer()
                                Text("1,0 Kg")
                                    .frame( alignment: .trailing)
                                    .font(.system(size: 13))
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
                
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        NavigationBarTitle("Inventário")
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button() {
                            print("Pressed")
                        } label: {
                            Image(systemName: "cart.fill").accentColor(.black)
                        }
                    }
                }
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
