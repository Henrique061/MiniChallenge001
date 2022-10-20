//
//  Inventario.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 15/09/22.
//

import Foundation
import SwiftUI

// Só para atualizar

struct Atributos: View {
    
    @State private var toggleIsOn: Bool = false
    @State private var showProficiencias: Bool = false
    
    @State var teste = true
    
    @ObservedObject private var sheet: SheetsViewModel
    
    
    public init(ficha: SheetsViewModel) {
        self._sheet = ObservedObject(initialValue: ficha)
    }
    
    var body: some View {
        CustomNavigationView {
            TemplateTelaPadrao(withPaddings: false) {
                ToggleVista(toggleIsOn: $toggleIsOn, ficha: self.$sheet.fichaSelecionada).padding(.horizontal, 10)
                ScrollView{
                    VStack{
                        AtributosVista(toggleIsOn: $toggleIsOn,   ficha: self.$sheet.fichaSelecionada)
                        SalvaguardaVista(toggleIsOn: $toggleIsOn, ficha: self.$sheet.fichaSelecionada)
                        PericiasVista(toggleIsOn: $toggleIsOn,    ficha: self.$sheet.fichaSelecionada)
                    }
                    .padding(.horizontal, 10)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            NavigationBarTitle("Atributos")
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink {
                                condicoes(ficha: $sheet.fichaSelecionada)
                            } label: {
                                Image("Penalidade")
                            }
                        }
                    }
                }
            }
        }
    }
}




struct TemplateAtributos: View{
    private var toggleIsOn: Binding<Bool>
    private var titulo1: String
    private var descricao1: String
    private var hasProficiencia: Bool
    
    public init(titulo1: String, descricao1: String, hasProficiencia: Bool, toggleIsOn: Binding<Bool>) {
        self.titulo1 = titulo1
        self.descricao1 = descricao1
        self.toggleIsOn = toggleIsOn
        self.hasProficiencia = hasProficiencia
        
    }
    
    var body: some View {
        HStack{
            if toggleIsOn.wrappedValue {
                Circle()
                    .foregroundColor(hasProficiencia ? Color("RedTheme") : Color(uiColor: .systemGray3))
                    .frame(width: 15, height: 15, alignment: .leading)
            }
            
            VStack(alignment: .leading, spacing: 3) {
                DisplayTextoBotao(titulo: titulo1, descricao: descricao1)
                    .padding(.vertical, 5)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct TemplateAtributosSemToggle: View {
    private var titulo: String
    private var descricao: String
    
    public init(titulo: String, descricao: String) {
        self.titulo = titulo
        self.descricao = descricao
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            DisplayTextoBotao(titulo: titulo, descricao: descricao)
                .padding(.vertical, 5)
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TemplateTabelaAtributo<Content>: View where Content: View {
    
    @ViewBuilder private var content: () -> Content
    private var title: String
    
    public init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
            TemplateContentBackground {
                VStack(spacing: 0) {
                    content()
                }
            }.padding(.vertical, 5)
        }
    }
}

struct AtributosVista: View{
    @State private var mostrarEditarAtt: Bool = false
    
    @Binding private var toggleIsOn: Bool
    @Binding private var ficha: PersonagemFicha
    
    public init(toggleIsOn: Binding<Bool>, ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
        self._toggleIsOn = toggleIsOn
    }
    
    var body: some View{
        TemplateTabelaAtributo(title: "Atributos") {
            HStack{
                TemplateAtributosSemToggle(titulo: ficha.pontosAtributos.forca.modificador >= 0 ? "Força +\(ficha.pontosAtributos.forca.modificador)" : "Força \(ficha.pontosAtributos.forca.modificador)", descricao: "\(ficha.pontosAtributos.forca.valor)")
                TemplateAtributosSemToggle(titulo: ficha.pontosAtributos.inteligencia.modificador >= 0 ? "Inteligência +\(ficha.pontosAtributos.inteligencia.modificador)" : "Inteligência \(ficha.pontosAtributos.inteligencia.modificador)", descricao: "\(ficha.pontosAtributos.inteligencia.valor)")
            }
            Divider()
            
            HStack{
                TemplateAtributosSemToggle(titulo: ficha.pontosAtributos.destreza.modificador >= 0 ? "Destreza +\(ficha.pontosAtributos.destreza.modificador)" : "Destreza \(ficha.pontosAtributos.destreza.modificador)", descricao: "\(ficha.pontosAtributos.destreza.valor)")
                TemplateAtributosSemToggle(titulo: ficha.pontosAtributos.sabedoria.modificador >= 0 ? "Sabedoria +\(ficha.pontosAtributos.sabedoria.modificador)" : "Sabedoria \(ficha.pontosAtributos.sabedoria.modificador)", descricao: "\(ficha.pontosAtributos.sabedoria.valor)")
            }
            Divider()
            HStack{
                TemplateAtributosSemToggle(titulo: ficha.pontosAtributos.constituicao.modificador >= 0 ? "Constituição +\(ficha.pontosAtributos.constituicao.modificador)" : "Constituição \(ficha.pontosAtributos.constituicao.modificador)", descricao: "\(ficha.pontosAtributos.constituicao.valor)")
                TemplateAtributosSemToggle(titulo: ficha.pontosAtributos.carisma.modificador >= 0 ? "Carisma +\(ficha.pontosAtributos.carisma.modificador)" : "Carisma \(ficha.pontosAtributos.carisma.modificador)", descricao: "\(ficha.pontosAtributos.carisma.valor)")
            }
        }
        
        Button {
            mostrarEditarAtt.toggle()
        } label: {
            Text("Editar Atributos")
        }
        .buttonStyle(CustomButtonStyle5())
        .sheet(isPresented: $mostrarEditarAtt) {
            EditarAtributos(ficha: $ficha)
        }
    }
}

struct SalvaguardaVista: View{
    @Binding private var toggleIsOn: Bool
    @Binding private var ficha: PersonagemFicha
    
    private var atributos: [AtributosSalvaguarda] {
        return AtributosSalvaguarda.allCases
    }
    
    public init(toggleIsOn: Binding<Bool>, ficha: Binding<PersonagemFicha>) {
        self._toggleIsOn = toggleIsOn
        self._ficha = ficha
    }
    
    var body: some View{
        let ptsAtt = ficha.pontosAtributos
        
        TemplateTabelaAtributo(title: "Salva-Guarda"){
            VStack(spacing: 0) {
                HStack{
                    TemplateAtributos(titulo1: "Força", descricao1: !toggleIsOn ? AtributosUtils.adicaoSinalTexto(valor: ptsAtt.forca.modificador) : AtributosUtils.adicaoSinalTexto(valor: AtributosUtils.adicaoBonusProficiencia(ficha: ficha, atributo: ficha.pontosAtributos.forca, hasProf: ficha.profSalvaguardas.contains(.forca))), hasProficiencia: AtributosUtils.possuiProficiencia(atributosProficientes: ficha.profSalvaguardas, atributoAvaliado: .forca), toggleIsOn: $toggleIsOn)
                    TemplateAtributos(titulo1: "Inteligência", descricao1: !toggleIsOn ? AtributosUtils.adicaoSinalTexto(valor: ptsAtt.inteligencia.modificador) : AtributosUtils.adicaoSinalTexto(valor: AtributosUtils.adicaoBonusProficiencia(ficha: ficha, atributo: ficha.pontosAtributos.inteligencia, hasProf: ficha.profSalvaguardas.contains(.inteligencia))), hasProficiencia:  AtributosUtils.possuiProficiencia(atributosProficientes: ficha.profSalvaguardas, atributoAvaliado: .inteligencia), toggleIsOn: $toggleIsOn )
                }
                Divider().padding(.horizontal, -10)
                HStack{
                    TemplateAtributos(titulo1: "Destreza", descricao1: !toggleIsOn ? AtributosUtils.adicaoSinalTexto(valor: ptsAtt.destreza.modificador) : AtributosUtils.adicaoSinalTexto(valor: AtributosUtils.adicaoBonusProficiencia(ficha: ficha, atributo: ficha.pontosAtributos.destreza, hasProf: ficha.profSalvaguardas.contains(.destreza))), hasProficiencia:  AtributosUtils.possuiProficiencia(atributosProficientes: ficha.profSalvaguardas, atributoAvaliado: .destreza), toggleIsOn: $toggleIsOn)
                    TemplateAtributos(titulo1: "Sabedoria", descricao1: !toggleIsOn ? AtributosUtils.adicaoSinalTexto(valor: ptsAtt.sabedoria.modificador) : AtributosUtils.adicaoSinalTexto(valor: AtributosUtils.adicaoBonusProficiencia(ficha: ficha, atributo: ficha.pontosAtributos.sabedoria, hasProf: ficha.profSalvaguardas.contains(.sabedoria))), hasProficiencia:  AtributosUtils.possuiProficiencia(atributosProficientes: ficha.profSalvaguardas, atributoAvaliado: .sabedoria), toggleIsOn: $toggleIsOn )
                }
                Divider().padding(.horizontal, -10)
                HStack{
                    TemplateAtributos(titulo1: "Constituição", descricao1: !toggleIsOn ? AtributosUtils.adicaoSinalTexto(valor: ptsAtt.constituicao.modificador) : AtributosUtils.adicaoSinalTexto(valor: AtributosUtils.adicaoBonusProficiencia(ficha: ficha, atributo: ficha.pontosAtributos.constituicao, hasProf: ficha.profSalvaguardas.contains(.constituicao))), hasProficiencia:  AtributosUtils.possuiProficiencia(atributosProficientes: ficha.profSalvaguardas, atributoAvaliado: .constituicao), toggleIsOn: $toggleIsOn)
                    TemplateAtributos(titulo1: "Carisma", descricao1: !toggleIsOn ? AtributosUtils.adicaoSinalTexto(valor: ptsAtt.carisma.modificador) : AtributosUtils.adicaoSinalTexto(valor: AtributosUtils.adicaoBonusProficiencia(ficha: ficha, atributo: ficha.pontosAtributos.carisma, hasProf: ficha.profSalvaguardas.contains(.carisma))), hasProficiencia:  AtributosUtils.possuiProficiencia(atributosProficientes: ficha.profSalvaguardas, atributoAvaliado: .carisma), toggleIsOn: $toggleIsOn )
                }
            }
            .padding(.horizontal, 10)
        }
        .padding(.vertical, 5)
    }
}


struct PericiasVista: View{
    @Binding private var toggleIsOn: Bool
    @Binding private var ficha: PersonagemFicha
    public init(toggleIsOn: Binding<Bool>, ficha: Binding<PersonagemFicha>) {
        self._toggleIsOn = toggleIsOn
        self._ficha = ficha
    }
    
    private var pericia: [Pericia] {
        return Pericia.allCases
    }
    
    var body: some View{
        TemplateTabelaAtributo(title: "Perícias") {
            ForEach(0..<pericia.count/2, id: \.self) { index in
                VStack(spacing: 0) {
                    if index > 0 {
                        Divider()
                    }
                    HStack(spacing: 10) {
                        TemplateAtributos(titulo1: pericia[index].rawValue, descricao1: !toggleIsOn ? AtributosUtils.valorPericia(ficha: ficha, pericia: pericia[index]) : AtributosUtils.valorProfPericia(pericia: pericia[index], hasProf: ficha.profPericias.contains(pericia[index]), ficha: ficha), hasProficiencia: ficha.profPericias.contains(pericia[index]), toggleIsOn: $toggleIsOn)
                        
                        TemplateAtributos(titulo1: pericia[index + pericia.count/2].rawValue, descricao1: !toggleIsOn ? AtributosUtils.valorPericia(ficha: ficha, pericia: pericia[index + pericia.count/2]) : AtributosUtils.valorProfPericia(pericia: pericia[index + pericia.count/2], hasProf: ficha.profPericias.contains(pericia[index + pericia.count/2]), ficha: ficha), hasProficiencia: ficha.profPericias.contains(pericia[index + pericia.count/2]), toggleIsOn: $toggleIsOn)
                    }.padding(.horizontal, 10)
                }
            }
        }
    }
}

struct ToggleVista: View{
    @Binding private var toggleIsOn: Bool
    @Binding private var ficha: PersonagemFicha
    @State private var showProficiencias: Bool = false
    
    public init(toggleIsOn: Binding<Bool>, ficha: Binding<PersonagemFicha>) {
        self._toggleIsOn = toggleIsOn
        self._ficha = ficha
    }
    
    var body: some View{
        VStack{
            TemplateTabelaAtributo(title: "Bônus de Proeficiência"){
                
                
                HStack{
                    DisplayTextoBotao(titulo: "Pontos Adicionais", descricao: "\(AtributosUtils.pontosProficiencia(ficha: ficha))").padding(.vertical,5)
                        .padding(.horizontal,10)
                    Spacer()
                    Toggle("", isOn: $showProficiencias)
                        .padding(.vertical,5)
                        .padding(.horizontal,5)
                        .labelsHidden()
                        .tint(Color("RedTheme"))
                        .onChange(of: showProficiencias, perform: { newValue in
                            withAnimation {
                                toggleIsOn = showProficiencias
                            }
                        })
                }
            }.padding(.vertical, 10)
        }
    }
}
