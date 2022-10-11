//
//  Condicoes.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 07/10/22.
//

import Foundation
import SwiftUI



struct condicoes: View{
    var body: some View{
                    TemplateTelaPadrao(withPaddings: false){
                ScrollView{
                    VStack{
                        estruturaCondicoes(titulo: "Condicoes")
                    }
                    .padding(.horizontal, 10)
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        NavigationBarTitle("Condições")
                    }
                }
            }
        }
    }







struct estruturaCondicoes: View{
    var titulo: String
    
    var body: some View{
        TemplateTabelaAtributo(title: "Condicoes"){
            
        }
    }
}



struct buttonCircle : View{
    var body: some View {
            VStack{
                Button(action: {
                    print("Pressed!")
                }){
                   Text("Press me")
                   .frame(width: 100, height: 100)
                   .foregroundColor(Color.black)
                   .background(Color.red)
                   .clipShape(Circle())
                }.buttonStyle(PlainButtonStyle())
            }.frame(width: 10, height: 10)

        }
    }

