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
    
    @ObservedObject private var sheet: SheetsViewModel
    @State private var textoBusca: String = ""
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
    }
    
    let customGesture = DragGesture(minimumDistance: 100, coordinateSpace: CoordinateSpace.local)
    
    var body: some View {
        NavigationView {
            TemplateTelaPadrao(withPaddings: false) {
                if self.sheet.fichaSelecionada.magias.isEmpty {
                    Text("Nenhuma habilidade aprendida")
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(0..<10) { nivel in
                                let magias = sheet.filterMagiasByLevel(nivel: nivel)
                                if !magias.isEmpty {
                                    TemplateContentBackground {
                                        SecaoNivelMagia {
                                            LazyVStack(spacing: 0) {
                                                Divider()
                                                ForEach(Array(magias.enumerated()), id: \.offset) { index, magia in
                                                    MagiaDetailCell(magia: magia, title: "Esquecer Habilidade") {
                                                        sheet.removeMagia(magia: magia)
                                                    }
                                                    if (index < magias.count - 1) {
                                                        Divider()
                                                    }
                                                }
                                            }
                                        } label: {
                                            HeaderMagiaSection(nivel)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 10)
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
                        TodasHabilidadesView(sheet: self.sheet)
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
        }.buttonStyle(CustomButtonStyle2())
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
            .padding(.vertical, 5)
    }
}

struct MagiaDetailCell: View {
    
    @State private var mostrarDetalhes: Bool = false
    private let magia: MagiaJSON
    private let title: String
    private var completion: () -> Void
    
    public init(magia: MagiaJSON, title: String, completion: @escaping () -> Void) {
        self.magia = magia
        self.title = title
        self.completion = completion
    }
    
    var body: some View {
        Button {
            mostrarDetalhes.toggle()
        } label: {
            DisplayTextoBotao(titulo: magia.nome, descricao: magia.escola.rawValue)
                .padding(.vertical, 5)
        }.buttonStyle(CustomButtonStyle2())
        
        
        .sheet(isPresented: $mostrarDetalhes) {
            DetalhesMagia(magia: self.magia, title: self.title, completion: completion)
        }
    }
}
