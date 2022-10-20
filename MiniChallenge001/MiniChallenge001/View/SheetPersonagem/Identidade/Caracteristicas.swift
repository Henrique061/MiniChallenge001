//
//  Caracteristicas.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 13/10/22.
//

import Foundation
import SwiftUI

struct Caracteristicas: View {
    @Binding private var ficha: PersonagemFicha
    
    public init (ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View {
        TemplateTelaPadrao(withPaddings: false) {
            ScrollView {
                VStack(spacing: 10) {
                    MostrarTracos(ficha: $ficha, title: "Raça", lista: ficha.racaFinal.tracos)
                        
                    MostrarCaracteristicas(ficha: $ficha, title: "Característica", lista: ficha.classeFinal.caracteristicasPersonagem)
                        
                    MostrarSubclasseEscolha(ficha: $ficha, title: "Sub-Classe")
                }.padding(.horizontal, 10)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("Características")
                }
            }
        }
    }
}

struct MostrarTracos: View{
    @Binding private var ficha: PersonagemFicha
    @State private var selectedTrait: TraitJSON?
    private var title: String
    private var lista: [TraitJSON]
    
    public init(ficha: Binding<PersonagemFicha>, title: String, lista: [TraitJSON]) {
        self._ficha = ficha
        self.title = title
        self.lista = lista
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup2(showDivider: false) {
            ForEach(lista.sorted(by: {$0.nome < $1.nome}), id: \.id) { item in
                VStack(spacing: 0) {
                    Divider()
                    Button {
                        self.selectedTrait = item
                    } label: {
                        DisplayTextoBotao(titulo: item.nome, descricao: "Toque para detalhes...")
                    }
                    .buttonStyle(CustomButtonStyle2())
                }
            }
            .sheet(item: $selectedTrait) { trait in
                DetalhesTracoFicha(traco: trait)
            }
        } header: {
            SingleLineDisclosureTitle(title: "Raça")
        }.buttonStyle(CustomButtonStyle2())
    }
}

struct DetalhesTracoFicha: View {
    
    private var traco: TraitJSON
    
    public init(traco: TraitJSON) {
        self.traco = traco
    }
    
    var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("IdentidadeIconOff"), title: "Descrição de Traço", subtitle: traco.nome)) {
            ScrollView {
                TemplateContentBackground {
                    DisplayTextoBotao(titulo: "Descrição", descricao: traco.descricao)
                        .padding(10)
                }.padding(.horizontal, 10)
            }
        }
    }
}

struct MostrarCaracteristicas: View{
    @Binding private var ficha: PersonagemFicha
    @State private var selectedCaracteristica: CaracteristicaJSON?
    private var title: String
    private var lista: [CaracteristicaJSON]
    
    public init(ficha: Binding<PersonagemFicha>, title: String, lista: [CaracteristicaJSON]) {
        self._ficha = ficha
        self.title = title
        self.lista = lista
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup2(showDivider: false) {
            ForEach(lista.sorted(by: {$0.nome < $1.nome}), id: \.id) { item in
                VStack(spacing: 0) {
                    Divider()
                    Button {
                        self.selectedCaracteristica = item
                    } label: {
                        DisplayTextoBotao(titulo: item.nome, descricao: "Toque para detalhes...")
                    }
                    .buttonStyle(CustomButtonStyle2())
                }
            }
            .sheet(item: $selectedCaracteristica) { caracteristica in
                DetalhesCaracteristicaFicha(caracteristica: caracteristica)
            }
        } header: {
            SingleLineDisclosureTitle(title: "Classe")
        }.buttonStyle(CustomButtonStyle2())
    }
}

struct DetalhesCaracteristicaFicha: View {
    
    private var caracteristica: CaracteristicaJSON
    
    public init(caracteristica: CaracteristicaJSON) {
        self.caracteristica = caracteristica
    }
    
    var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("IdentidadeIconOff"), title: "Descrição de Característica", subtitle: caracteristica.nome)) {
            ScrollView {
                TemplateContentBackground {
                    DisplayTextoBotao(titulo: "Descrição", descricao: caracteristica.descricao)
                        .padding(10)
                }.padding(.horizontal, 10)
            }
        }
    }
}

struct MostrarSubclasseEscolha: View{
    @Binding private var ficha: PersonagemFicha
    @State private var showDetalhes: Bool = false
    private var title: String
    
    public init(ficha: Binding<PersonagemFicha>, title: String) {
        self._ficha = ficha
        self.title = title
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup2(showDivider: false) {
            LazyVStack {
                ForEach(ficha.classeFinal.subclassesPersonagem, id: \.self) { subclasse in
                    TemplateRadioButtonWithIdentifier(selectedID: $ficha.subclasse, id: subclasse) {
                        
                    } content: {
                        DisplayTextoBotao(titulo: subclasse.subclasseNome, descricao: "Passiva")
                    }
                }
            }
        } header: {
            SingleLineDisclosureTitle(title: "Sub-Classe")
        }.buttonStyle(CustomButtonStyle2())
        
        if ficha.subclasse.subclasse != .none {
                Button {
                    showDetalhes.toggle()
                } label: {
                    DisplayTextoBotao(titulo: ficha.subclasse.subclasseNome, descricao: "Toque para detalhes...")
                }.buttonStyle(CustomButtonStyle())
            .sheet(isPresented: $showDetalhes) {
                TemplateSheetView(header: DefaultSheetHeader(image: Image("IdentidadeIconOff"), title: "Descrição de Características", subtitle: ficha.subclasse.subclasseNome)) {
                    ScrollView {
                        ForEach(ficha.subclasse.caracteristicasSubClasse, id: \.id) { caracteristica in
                            TemplateDetalheCaracteristica(title: caracteristica.nome, subtitle: ArrayUtils.formatarParaString(arr: caracteristica.nivel), description: caracteristica.descricao)
                        }
                        .padding(.horizontal, 10)
                    }
                }
            }
        }
    }
}
