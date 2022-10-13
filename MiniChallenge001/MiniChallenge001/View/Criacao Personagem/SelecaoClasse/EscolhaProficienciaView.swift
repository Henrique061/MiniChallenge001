//
//  EscolhaProficienciaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 05/10/22.
//

import SwiftUI

struct EscolhaProficienciaView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var vmclasse: CriacaoClasseViewModel
    @State private var selectedPericias: [Pericia] = []
    
    var body: some View {
        
        TemplateTelaPadrao {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    if !vmclasse.escolha.profArmaduras.isEmpty {
                        MostrarItensJson(title: "Armadura", lista: vmclasse.escolha.profArmaduras)
                    }
                    
                    if !vmclasse.escolha.profArmas.isEmpty {
                        MostrarItensJson(title: "Arma", lista: vmclasse.escolha.profArmas)
                    }
                    
                    MostrarSalvaguardas(title: "Teste de Resistência", lista: vmclasse.escolha.profSalvaguardas)
                    
                    SelecionarFerramentas()
                        .environmentObject(vmclasse)
                    
                    SelecionarPericias(selectedID: $selectedPericias)
                        .environmentObject(vmclasse)
                    
                    Spacer()
                }
                Button {
                    
                    dismiss()
                } label: {
                    Text("Salvar Alterações")
                }
                .buttonStyle(CustomButtonStyle5())
            }
            .padding(.horizontal, 10)
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("Proficiências de \(vmclasse.escolha.classePersonagem.rawValue)")
                }
            }
        }
    }
}

struct MostrarItensJson<Item>: View where Item: Json {
    
    @State private var showContent: Bool = false
    private var title: String
    private var lista: [Item]
    
    public init(title: String, lista: [Item]) {
        self.title = title
        self.lista = lista
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $showContent) {
            ForEach(lista, id: \.id) { item in
                TemplateDisclosureGroupContent(title: item.nome)
            }
        } header: {
            Text(title)
                .font(.system(size: 15, weight: .bold, design: .default))
        }
    }
}

private struct MostrarSalvaguardas: View {
    
    @State private var showContent: Bool = false
    private var title: String
    private var lista: [AtributosSalvaguarda]
    
    public init(title: String, lista: [AtributosSalvaguarda]) {
        self.title = title
        self.lista = lista
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $showContent) {
            ForEach(lista, id: \.self) { item in
                TemplateDisclosureGroupContent(title: item.rawValue)
            }
        } header: {
            Text(title)
                .font(.system(size: 15, weight: .bold, design: .default))
        }
    }
}

struct SelecionarFerramentas: View {
    
    @EnvironmentObject private var vmclasse: CriacaoClasseViewModel
    @State private var isExpanded: Bool = false
    @State private var selectionId: [String] = []
    
    var body: some View {
        if !vmclasse.escolha.escolhasProficienciaFerramenta.isEmpty {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(vmclasse.escolha.escolhasProficienciaFerramenta, id: \.self) { opcao in
                    ForEach(opcao.itens, id: \.self) { item in
                        TemplateRadioButtonMultipleIdentifier(selectedID: $selectionId, id: item.nomeItem) {
                            
                        } content: {
                            Text(item.nomeItem)
                        }.frame(height: 40)
                    }
                }
            } header: {
                DisplayTextoBotao(titulo: "Ferramentas", descricao: "Toque para selecionar...")
            }
        }
    }
}

struct SelecionarPericias: View {
    
    @EnvironmentObject private var vmclasse: CriacaoClasseViewModel
    @State private var isExpanded: Bool = false
    @Binding var selectedID: [Pericia]
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(vmclasse.escolha.profPericias, id: \.self) { pericia in
                TemplateRadioButtonMultipleIdentifier(selectedID: $selectedID, id: pericia, maxSelection: vmclasse.escolha.quantiaProfPericias) {
                    
                } content: {
                    Text(pericia.rawValue)
                }.frame(height: 40)
            }
        } header: {
            DisplayTextoBotaoCondicao(titulo: "Perícias", descricaoTrue: "Selecione \(vmclasse.escolha.quantiaProfPericias - selectedID.count) perícias...", descricaoFalse: "Perícias selecionadas", condicao: selectedID.count < vmclasse.escolha.quantiaProfPericias)
        }
    }
}
