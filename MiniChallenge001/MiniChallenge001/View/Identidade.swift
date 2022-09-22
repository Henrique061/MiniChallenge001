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
            Form {
                VStack{
                    PrincipalCaracteristica(nome: .constant("Manhattan"), classe: .constant("Papai de todos"), nivel: .constant(1000))
                }
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

struct LayoutInformacao: View {
    
    @Binding var titulo: String
    @Binding var descricao: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(titulo)
                .font(.system(size: 15, weight: .bold, design: .default))
                .bold()
            Text(descricao)
                .font(.system(size: 13, weight: .regular, design: .default))
        }
    }
}

struct PrincipalCaracteristica: View {
    
    @Binding var nome: String
    @Binding var classe: String
    @Binding var nivel: Int
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    LayoutInformacao(titulo: .constant("Nome"), descricao: $nome)
                    Divider()
                    LayoutInformacao(titulo: .constant("Classe e Nível"), descricao: .constant("\(classe) \(nivel)"))
                }
                Spacer()
                ZStack {
                    Triangle()
                    Circle()
                        .frame(width: 80, height: 80, alignment: .center)
                        .foregroundColor(.red)
                        .padding(.horizontal, 15)
                }
            }
            
        }
    }
}

struct Triangle: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.minX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
  return path
  }
}
