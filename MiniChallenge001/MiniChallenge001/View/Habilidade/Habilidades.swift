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
    @State private var textoBusca: String = ""
    
    var body: some View {
        NavigationView {
            TemplateTelaPadrao {
                List {
                    ForEach(0..<10) {nivel in
                        Section {
                            ForEach(vmmagias.filterMagiasByLevel(nivel: nivel), id: \.id) { magia in
                                NomeEscolaHabilidade(magia: magia)
                            }
                        } header: {
                            Text(nivel > 0 ? "\(nivel)º Círculo" : "Truques")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        }
                    }
                }
                .listStyle(.sidebar)
            }
            
            .searchable(text: $textoBusca)
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("Habilidades")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        TodasHabilidadesView()
                    } label: {
                        Image("Habilidade Livro")
                    }
                }
            }  
        }
    }
}

struct NomeEscolaHabilidade: View {
    
    @State private var mostrarDetalhes: Bool = false
    private let magia: MagiaJSON
    
    init(magia: MagiaJSON) {
        self.magia = magia
    }
    
    var body: some View {
        Button {
            mostrarDetalhes.toggle()
        } label: {
            VStack(alignment: .leading) {
                Text(magia.nome)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                Text(magia.escola.rawValue)
                    .font(.system(size: 13, weight: .regular, design: .rounded))
            }
        }
        
        .sheet(isPresented: $mostrarDetalhes) {
            DetalhesMagia(magia: magia)
        }
    }
}
