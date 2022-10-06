//
//  EscolhaProficienciaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 05/10/22.
//

import SwiftUI

struct EscolhaProficienciaView: View {
    
    @Binding var escolha: ClasseEscolha
    
    var body: some View {
        
        TemplateTelaPadrao {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    if !escolha.profArmaduras.isEmpty {
                        MostrarProficiencias(title: "Armadura", lista: escolha.profArmaduras)
                    }
                    
                    if !escolha.profArmas.isEmpty {
                        MostrarProficiencias(title: "Arma", lista: escolha.profArmas)
                    }
                    
                    MostrarSalvaguardas(title: "Teste de Resistência", lista: escolha.profSalvaguardas)
                    
                    Spacer()
                }.padding(.horizontal, 10)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("Proficiências de \(escolha.classePersonagem.rawValue)")
                }
            }
        }
    }
}

struct MostrarProficiencias<Item>: View where Item: Json {
    
    @State private var showContent: Bool = true
    var title: String
    var lista: [Item]
    
    var body: some View {
        TemplateContentBackground {
            DisclosureGroup(isExpanded: $showContent) {
                VStack(spacing: 0) {
                    Divider()
                    ForEach(lista, id: \.id) { item in
                        Text(item.nome)
                            .font(.system(size: 13, weight: .regular, design: .default))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            } label: {
                Text(title)
                    .font(.system(size: 15, weight: .bold, design: .default))
            }.buttonStyle(CustomButtonStyle2())
        }
    }
}

struct MostrarSalvaguardas: View {
    
    @State private var showContent: Bool = true
    var title: String
    var lista: [AtributosSalvaguarda]
    
    var body: some View {
        TemplateContentBackground {
            DisclosureGroup(isExpanded: $showContent) {
                VStack(spacing: 0) {
                    Divider()
                    ForEach(lista, id: \.self) { item in
                        Text(item.rawValue)
                            .font(.system(size: 13, weight: .regular, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                    }
                }
            } label: {
                Text(title)
                    .font(.system(size: 15, weight: .bold, design: .default))
            }.buttonStyle(CustomButtonStyle2())
        }
    }
}


