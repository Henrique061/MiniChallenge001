//
//  EscolhaProficienciaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 05/10/22.
//

import SwiftUI

struct EscolhaProficienciaView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vmclasse: CriacaoClasseViewModel
    @State private var escolhasFerramentas: [FerramentaJSON]
    @State private var escolhasPericias: [Pericia]
    
    private var buttonIsDisabled: Bool {
        return escolhasFerramentas.count < vmclasse.escolha.quantiaEscolhaProfFerramentas || escolhasPericias.count < vmclasse.escolha.quantiaProfPericias
    }
    
    public init(vmclasse: CriacaoClasseViewModel) {
        self._vmclasse = StateObject(wrappedValue: vmclasse)
        self._escolhasFerramentas = State(initialValue: vmclasse.definidas.escolhaProfFerramentas)
        self._escolhasPericias = State(initialValue: vmclasse.definidas.escolhaProfPericias)
    }
    
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
                    SelecionarFerramentas(vmclasse: vmclasse, escolhasFerramentas: $escolhasFerramentas)
                    SelecionarPericias(vmclasse: vmclasse, escolhasPericias: $escolhasPericias)
                    
                    Spacer()
                }
                Button {
                    self.vmclasse.setProficienciaPericias(pericias: self.escolhasPericias)
                    self.vmclasse.setProficientaFerramentas(ferramentas: self.escolhasFerramentas)
                    dismiss()
                } label: {
                    Text("Salvar Alterações")
                }
                .buttonStyle(CustomButtonStyle5())
                .disabled(buttonIsDisabled)
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
    
    @ObservedObject private var vmclasse: CriacaoClasseViewModel
    @Binding private var escolhasFerramentas: [FerramentaJSON]
    @State private var isExpanded: Bool = false
    
    
    public init(vmclasse: CriacaoClasseViewModel, escolhasFerramentas: Binding<[FerramentaJSON]>) {
        self.vmclasse = vmclasse
        self._escolhasFerramentas = escolhasFerramentas
    }
    
    var body: some View {
        if !vmclasse.escolha.escolhasProficienciaFerramenta.isEmpty {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(vmclasse.escolha.escolhasProficienciaFerramenta, id: \.id) { ferramenta in
                    TemplateRadioButtonMultipleIdentifier(selectedID: $escolhasFerramentas, id: ferramenta, maxSelection: vmclasse.escolha.quantiaEscolhaProfFerramentas) {
                        
                    } content: {
                        Text("\(ferramenta.nome)")
                    }
                }.frame(height: 40)
            } header: {
<<<<<<< Updated upstream
                DisplayTextoBotaoCondicao(titulo: "Ferramentas", descricaoTrue: "Selecione \(vmclasse.escolha.quantiaEscolhaProfFerramentas - escolhasFerramentas.count) \(vmclasse.escolha.quantiaEscolhaProfFerramentas - escolhasFerramentas.count > 1 ? "ferramentas" : "ferramenta")...", descricaoFalse: "Ferramentas selecionadas", condicao: escolhasFerramentas.count < vmclasse.escolha.quantiaEscolhaProfFerramentas)
=======
                DisplayTexto(titulo: "Ferramentas", descricao: "Toque para selecionar...")
>>>>>>> Stashed changes
            }
        }
    }
}

struct SelecionarPericias: View {
    
    @ObservedObject private var vmclasse: CriacaoClasseViewModel
    @Binding private var escolhasPericias: [Pericia]
    @State private var isExpanded: Bool = false
    
    public init(vmclasse: CriacaoClasseViewModel, escolhasPericias: Binding<[Pericia]>) {
        self.vmclasse = vmclasse
        self._escolhasPericias = escolhasPericias
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(vmclasse.escolha.profPericias, id: \.self) { pericia in
                TemplateRadioButtonMultipleIdentifier(selectedID: $escolhasPericias, id: pericia, maxSelection: vmclasse.escolha.quantiaProfPericias) {
                    
                } content: {
                    Text(pericia.rawValue)
                }.frame(height: 40)
            }
        } header: {
<<<<<<< Updated upstream
            DisplayTextoBotaoCondicao(titulo: "Perícias", descricaoTrue: "Selecione \(vmclasse.escolha.quantiaProfPericias - escolhasPericias.count) \(vmclasse.escolha.quantiaProfPericias - escolhasPericias.count > 1 ? "perícias" : "perícia")...", descricaoFalse: "Perícias selecionadas", condicao: escolhasPericias.count < vmclasse.escolha.quantiaProfPericias)
=======
            DisplayTexto(titulo: "Perícias", descricao: "Toque para selecionar...")
>>>>>>> Stashed changes
        }
    }
}
