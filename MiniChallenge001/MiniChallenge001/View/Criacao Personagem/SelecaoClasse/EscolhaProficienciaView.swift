//
//  EscolhaProficienciaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 05/10/22.
//

import SwiftUI

struct EscolhaProficienciaView: View {
    
    @Binding private var escolha: ClasseEscolha
    
    public init(escolha: Binding<ClasseEscolha>) {
        self._escolha = escolha
    }
    
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
                    SelecionarFerramentas(escolha: $escolha)
                    
                    SelecionarPericias(escolha: $escolha)
                    
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

struct MostrarSalvaguardas: View {
    
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
    
    @Binding private var escolha: ClasseEscolha
    @State private var isExpanded: Bool = false
    
    public init(escolha: Binding<ClasseEscolha>) {
        self._escolha = escolha
    }
    
    var body: some View {
        if !escolha.escolhasProficienciaFerramenta.isEmpty {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(escolha.escolhasProficienciaFerramenta, id: \.self) { opcao in
                    TemplateRadioButton(isMarked: false, title: getItens(opcao: opcao)) {
                        
                    }
                }
            } header: {
                DisplayTextoBotao(titulo: "Ferramentas", descricao: "Toque para selecionar...")
            }
        }
    }
    
    private func getItens(opcao: EscolhaOpcao) -> String {
        var temp = ""
        opcao.itens.forEach({
            temp += " \($0.nomeItem)"
        })
        return temp
    }
}

struct SelecionarPericias: View {
    
    @Binding private var escolha: ClasseEscolha
    @State private var isExpanded: Bool = false
    
    public init(escolha: Binding<ClasseEscolha>) {
        self._escolha = escolha
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(Pericia.allCases, id: \.self) { pericia in
                TemplateRadioButton(isMarked: escolha.profPericias.contains(pericia), title: pericia.rawValue) {
                    if escolha.profPericias.contains(pericia) {
                        escolha.profPericias.removeAll(where: {$0 == pericia})
                    } else {
                        escolha.profPericias.append(pericia)
                    }
                }
            }
        } header: {
            DisplayTextoBotao(titulo: "Perícias", descricao: "Toque para selecionar...")
        }
    }
}
