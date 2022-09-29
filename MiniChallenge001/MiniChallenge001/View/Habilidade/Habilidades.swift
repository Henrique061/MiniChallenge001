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
    
    @ObservedObject private var vmmagias = MagiasViewModel()
    @State private var textoBusca: String = ""
    
    var body: some View {
        NavigationView {
            TemplateTelaPadrao {
                ScrollView {
                    LazyVStack {
                        ForEach(0..<10) { nivel in
                            SecaoNivelMagia {
                                LazyVStack(spacing: 0) {
                                    let magias = vmmagias.filterMagiasByLevel(nivel: nivel)
                                    ForEach(Array(magias.enumerated()), id: \.offset) { index, magia in
                                        MagiaDetailCell(magia: magia)
                                        if (index < magias.count - 1) {
                                            Divider()
                                        }
                                    }
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                            } label: {
                                HeaderMagiaSection(nivel)
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                }
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

struct SecaoNivelMagia<Label, Content> : View where Label: View, Content: View {
    
    @State private var showContent: Bool = false
    @ViewBuilder private var label: () -> Label
    @ViewBuilder private var content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder label: @escaping () -> Label) {
        self.label = label
        self.content = content
    }
    
    var body: some View {
        DisclosureGroup(isExpanded: $showContent) {
            content()
        } label: {
            label()
                .padding(.bottom, 10)
        }
    }
}

struct HeaderMagiaSection: View {
    
    private var nivel: Int
    
    public init(_ nivel: Int) {
        self.nivel = nivel
    }
    
    var body: some View {
        Text(nivel > 0 ? "\(nivel)º Círculo" : "Truques")
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(Color("BlackAndWhite"))
    }
}

struct MagiaDetailCell: View {
    
    @State private var mostrarDetalhes: Bool = false
    private let magia: MagiaJSON
    
    init(magia: MagiaJSON) {
        self.magia = magia
    }
    
    var body: some View {
        Button {
            mostrarDetalhes.toggle()
        } label: {
            DisplayTextoBotao(titulo: magia.nome, descricao: magia.escola.rawValue)
        }.buttonStyle(MagiaCellStyle())
        
        
        .sheet(isPresented: $mostrarDetalhes) {
            DetalhesMagia(magia: magia)
        }
    }
}

struct MagiaCellStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
            .foregroundColor(Color("BlackAndWhite"))
            .background(configuration.isPressed ? Color(uiColor: .systemGray3) : Color("ContentBackground"))
    }
}
