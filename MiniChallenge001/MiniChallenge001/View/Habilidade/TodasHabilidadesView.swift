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
            VStack(alignment: .leading) {
                ScrollView {
                    ForEach(0..<10) {nivel in
                        HStack() {
                            SecaoNivelMagia {
                                ForEach(Array(vmmagias.filterMagiasByLevel(nivel: nivel).enumerated()), id: \.offset) { index, magia in
                                    MagiaDetailCellWithButton(magia: magia)
                                }
                            } label: {
                                HeaderMagiaSection(nivel)
                            }
                        }
                        .padding(.vertical, 2)
                        .padding(.horizontal, 10)
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
        VStack {
            HStack {
                MagiaDetailCell(magia: magia)
                Button {
                    print("Magia \(magia.nome) aprendida")
                } label: {
                    Text("Aprender")
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                }
                .buttonStyle(.borderless)
            }
            Divider()
        }
    }
}
