//
//  TodasHabilidadesView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 22/09/22.
//

import SwiftUI

struct TodasHabilidadesView: View {
    @ObservedObject private var vmmagias = JsonViewModel()
    @State private var textoBusca: String = ""
    
    var body: some View {
        List {
            ForEach(0..<10) {nivel in
                Section {
                    ForEach(vmmagias.filterMagiasByLevel(nivel: nivel), id: \.id) { magia in
                        NomeEscolaBotaoHabilidade(magia: magia)
                    }
                } header: {
                    Text(nivel > 0 ? "\(nivel)º Círculo" : "Truques")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }
            }
        }
        .listStyle(.sidebar)
        
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                NavigationBarTitle("Lista de Habilidades")
            }
        }
        .searchable(text: $textoBusca)
    }
}

struct NomeEscolaBotaoHabilidade: View {
    
    private let magia: MagiaJSON
    
    init(magia: MagiaJSON) {
        self.magia = magia
    }
    
    var body: some View {
        HStack {
            NomeEscolaHabilidade(magia: magia)
            Spacer()
            Button {
                print("Magia \(magia.nome) aprendida")
            } label: {
                Text("Aprender")
                    .font(.system(size: 14, weight: .regular, design: .rounded))
            }
            .buttonStyle(.borderless)
        }
    }
}
