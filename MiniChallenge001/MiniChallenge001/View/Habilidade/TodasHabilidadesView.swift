//
//  TodasHabilidadesView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 22/09/22.
//

import SwiftUI

struct TodasHabilidadesView: View {
    @ObservedObject private var vmmagias = MagiasViewModel()
    @State private var textoBusca: String = ""
    
    var body: some View {
        
        TemplateTelaPadrao {
            ScrollView {
                LazyVStack {
                    ForEach(0..<10) { nivel in
                        ZStack {
                            Color("ContentBackground")
                            SecaoNivelMagia {
                                LazyVStack(spacing: 0) {
                                    Divider()
                                    let magias = vmmagias.filterMagiasByLevel(nivel: nivel)
                                    ForEach(Array(magias.enumerated()), id: \.offset) { index, magia in
                                        MagiaDetailCellWithButton(magia: magia)
                                        if (index < magias.count - 1) {
                                            Divider()
                                        }
                                    }
                                }
                            } label: {
                                HeaderMagiaSection(nivel)
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .padding(.horizontal, 20)
                    }
                }
            }
        }
        
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                NavigationBarTitle("Lista de Habilidades")
            }
        }
        .searchable(text: $textoBusca)
    }
}

struct MagiaDetailCellWithButton: View {
    
    private let magia: MagiaJSON
    
    init(magia: MagiaJSON) {
        self.magia = magia
    }
    
    var body: some View {
        HStack(spacing: 0) {
            MagiaDetailCell(magia: magia)
            Button {
                print("Magia \(magia.nome) aprendida")
            } label: {
                Text("Aprender")
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .padding(.horizontal, 10)
            }
            .buttonStyle(.borderless)
        }
    }
}
