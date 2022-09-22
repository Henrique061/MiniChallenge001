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
    
    @ObservedObject private var vmmagias = JsonViewModel()
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            List {
                ForEach(0..<10) {nivel in
                    Section {
                        ForEach(vmmagias.filterMagiasByLevel(nivel: nivel), id: \.id) { magia in
                            TodasHabilidadeCell(nome: magia.nome, escola: magia.escola.rawValue)
                        }
                    } header: {
                        Text(nivel > 0 ? "\(nivel)º Círculo" : "Truques")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                    }
                }
            }
            
            .navigationBarTitle("Habilidades")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image("Habilidade Livro")
                    }

                }
            }
        }
    }
}

struct HabilidadeCell: View {
    private var nome: String
    private var escola: String
    
    public init(nome: String, escola: String) {
        self.nome = nome
        self.escola = escola
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(nome)
                .font(.system(size: 15, weight: .bold, design: .default))
            Text(escola)
                .font(.system(size: 13, weight: .regular, design: .default))
        }
    }
}

struct TodasHabilidadeCell: View {
    private var nome: String
    private var escola: String
    
    public init(nome: String, escola: String) {
        self.nome = nome
        self.escola = escola
    }
    
    var body: some View {
        
        HStack{
            Button{
                print("ele printa mes222mo")
            } label: {
                HabilidadeCell(nome: nome, escola: escola)
            }
            
            Spacer()
            
            Button {
                print("ele printa mesmo")
            } label: {
                Text("Aprender")
                    .padding()
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .foregroundColor(.init(red: 0.675, green: 0.115, blue: 0.115))
            }
            .buttonStyle(.borderless)
        }
    }
}
