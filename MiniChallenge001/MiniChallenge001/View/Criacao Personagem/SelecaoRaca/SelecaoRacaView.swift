//
//  EscolherRacaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 25/09/22.
//

import SwiftUI

struct SelecaoRacaView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var vmficha: NovaFichaViewModel
    @StateObject private var vmraca: CriacaoRacaViewModel
    private var didDismiss: () -> Void
    
    public init(vmficha: NovaFichaViewModel, didDismiss: @escaping () -> Void) {
        self.vmficha = vmficha
        self._vmraca = StateObject(wrappedValue: CriacaoRacaViewModel(racaFinal: vmficha.racaFinal))
        self.didDismiss = didDismiss
    }
    
    var body: some View {
        TemplateTelaPadrao {
            ScrollView {
                VStack(spacing: 10) {
                    ScreenContent(vmraca: self.vmraca)
                    ScreenContent2(vmraca: self.vmraca)
                    Spacer()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            
            Button {
                self.vmraca.prepareEscolhasDefinidas()
                let racaFinal = RacaClient.orderPersonagemRaca(vmraca.raca, escolhas: vmraca.escolhasDefinidas)
                self.vmficha.setRaca(raca: racaFinal)
                dismiss()
            } label: {
                Text("Salvar")
            }
            .buttonStyle(CustomButtonStyle5())
            .disabled(vmraca.buttonIsDisabled)
            .padding(.horizontal, 10)
        }
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                NavigationBarTitle("Raça do Personagem")
            }
        }
        
        .onDisappear {
            self.didDismiss()
        }
    }
}

private struct ScreenContent: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        RacaPickView(vmraca: self.vmraca)
        SubracaPickView(vmraca: self.vmraca)
        
        DeslocamentoRacaView(vmraca: self.vmraca)
        
        AtributosRacaView(vmraca: self.vmraca)
        RacaEscolhaAtributos(vmraca: self.vmraca)
        
        IdiomaRacaView(vmraca: self.vmraca)
        RacaEscolhaIdioma(vmraca: self.vmraca)
        
        if self.vmraca.raca.tipoRaca != .none && !self.vmraca.proficienciaArmas.isEmpty {
            MostrarItensJson(title: "Proficiência em Armas", lista: vmraca.proficienciaArmas)
        }
        
        if self.vmraca.raca.tipoRaca != .none && !self.vmraca.proficienciaArmaduras.isEmpty {
            MostrarItensJson(title: "Proficiência em Armaduras", lista: vmraca.proficienciaArmaduras)
        }
    }
}

private struct ScreenContent2: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        if vmraca.raca.tipoRaca != .none && !vmraca.proficienciaFerramentas.isEmpty {
            MostrarItensJson(title: "Proficiência em Ferramentas", lista: vmraca.proficienciaFerramentas)
        }
        RacaEscolhaProfFerramenta(vmraca: self.vmraca)
        
        RacaPericiasPadrao(vmraca: self.vmraca)
        RacaEscolhaPericia(vmraca: self.vmraca)
        
        if vmraca.raca.tipoRaca != .none && !vmraca.magias.isEmpty{
            MostrarItensJson(title: "Magias Recebidas", lista: vmraca.magias)
        }
        RacaEscolhaMagia(vmraca: self.vmraca)
        
        BotaoMostrarTracosRaca(vmraca: self.vmraca)
    }
}

private struct RacaPickView: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    @State private var showContent: Bool = false
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $showContent) {
            ForEach(TipoRaca.allCases, id: \.self) { raca in
                if !(raca == .none) {
                    TemplateRadioButton(isMarked: vmraca.raca.tipoRaca == raca, title: raca.rawValue) {
                        withAnimation(.easeOut) {
                            vmraca.setRaca(tipoRaca: raca)
                            self.showContent.toggle()
                        }
                    }
                }
            }
        } header: {
            DisplayTextoBotaoCondicao(titulo: "Raça", descricaoTrue: "Toque para selecionar...", descricaoFalse: vmraca.raca.tipoRaca.rawValue, condicao: vmraca.raca.tipoRaca == .none)
        }
    }
}

private struct SubracaPickView: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    @State private var showContent: Bool = false
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        if vmraca.raca.possuiSubRaca {
            
            TemplateCustomDisclosureGroup(isExpanded: $showContent) {
                ForEach(vmraca.raca.subRacas, id: \.self) { subraca in
                    TemplateRadioButtonWithIdentifier(selectedID: $vmraca.escolhasDefinidas.escolhaSubRaca, id: subraca) {
                        self.vmraca.setSubraca(subraca: subraca)
                        withAnimation {
                            self.showContent.toggle()
                        }
                    } content: {
                        Text("\(subraca.subracaNome)")
                    }
                    .frame(height: 40)
                }
            } header: {
                DisplayTextoBotao(titulo: "Sub-Raça", descricao: vmraca.escolhasDefinidas.escolhaSubRaca.subraca == .none ? "Toque para selecionar..." : vmraca.escolhasDefinidas.escolhaSubRaca.subracaNome)
            }
        }
    }
}

private struct AtributosRacaView: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        if vmraca.raca.tipoRaca != .none  {
            TemplateContentBackground {
                DisplayTextoBotao(titulo: "Bônus de Atributos", descricao: vmraca.atributos)
                    .padding(10)
            }
        }
    }
}

private struct DeslocamentoRacaView: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        if vmraca.raca.tipoRaca != .none {
            TemplateContentBackground {
                DisplayTextoBotao(titulo: "Deslocamento", descricao: vmraca.deslocamento)
                    .padding(10)
            }
        }
    }
}

private struct IdiomaRacaView: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        if vmraca.raca.tipoRaca != .none {
            TemplateContentBackground {
                DisplayTextoBotao(titulo: "Idiomas", descricao: vmraca.idiomas)
                    .padding(10)
            }
        }
    }
}

private struct BotaoMostrarTracosRaca: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    @State private var showSheet: Bool = false
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        if vmraca.raca.tipoRaca != .none {
            Button {
                showSheet.toggle()
            } label: {
                DisplayTextoBotao(titulo: "Traços Raciais", descricao: "Toque para detalhes...")
            }.buttonStyle(CustomButtonStyle())
            
            .sheet(isPresented: $showSheet) {
                DetalhesTracoView(vmraca: self.vmraca)
            }
        }
    }
}

private struct RacaEscolhaAtributos: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    @State private var isExpanded: Bool = false
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        if vmraca.raca.possuiEscolhaAtributo {
         
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                
                ForEach(vmraca.raca.escolhasAtributo, id: \.self) { atributo in
                    
                    TemplateRadioButtonMultipleIdentifier(selectedID: $vmraca.escolhasAtributos, id: atributo, maxSelection: vmraca.raca.numEscolhaDeAtributos) {
                        
                    } content: {
                        Text(atributo.rawValue)
                    }.frame(height: 40)
                }
            } header: {
                DisplayTextoBotaoCondicao(titulo: "Atributos Bônus Selecionáveis", descricaoTrue: "Selecione \(vmraca.raca.numEscolhaDeAtributos - vmraca.escolhasAtributos.count) \(vmraca.escolhasAtributos.count == 1 ? " atributo" : "atributos")...", descricaoFalse: "Atributos selecionados", condicao: vmraca.escolhasAtributos.count < vmraca.raca.numEscolhaDeAtributos)
            }
        }
    }
}

private struct RacaEscolhaIdioma: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    @State private var isExpanded: Bool = false
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        
        if vmraca.raca.possuiEscolhaIdioma || vmraca.escolhasDefinidas.escolhaSubRaca.subraca == .altoElfo {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(Idioma.allCases, id: \.self) { idioma in
                    if idioma != .none && !vmraca.raca.idiomas.contains(where: {$0.idioma == idioma}) {
                        TemplateRadioButtonWithIdentifier(selectedID: $vmraca.escolhasDefinidas.escolhaIdioma.idioma, id: idioma) {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        } content: {
                            Text(idioma.rawValue)
                        }
                        .frame(height: 40)
                    }
                }
            } header: {
                DisplayTextoBotaoCondicao(titulo: "Idioma Adicional", descricaoTrue: "Toque para selecionar...", descricaoFalse: "Idioma selecionado", condicao: vmraca.escolhasDefinidas.escolhaIdioma.idioma == .none)
            }
        }
    }
}

private struct RacaEscolhaProfFerramenta: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    @State private var isExpanded: Bool = false
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        if vmraca.raca.possuiEscolhaProfFerramentas {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(vmraca.raca.escolhasProfFerramentas, id: \.self) { ferramenta in
                    TemplateRadioButtonWithIdentifier(selectedID: $vmraca.escolhaProfFerramenta, id: ferramenta) {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    } content: {
                        Text(ferramenta)
                    }
                    .frame(height: 40)
                }
            } header: {
                DisplayTextoBotaoCondicao(titulo: "Proficiência com Ferramentas", descricaoTrue: "Toque para selecionar...", descricaoFalse: vmraca.escolhaProfFerramenta, condicao: vmraca.escolhaProfFerramenta.isEmpty)
            }
        }
    }
}

private struct RacaEscolhaPericia: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    @State private var isExpanded: Bool = false
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        
        if vmraca.raca.possuiEscolhaProfPericias {
            
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(vmraca.raca.escolhasProfPericias, id: \.self) { pericia in
                    if pericia != .none {
                        TemplateRadioButtonMultipleIdentifier(selectedID: $vmraca.escolhasDefinidas.escolhaProfPericias, id: pericia, maxSelection: vmraca.raca.quantiaEscolhaPericia) {
                            
                        } content: {
                            Text(pericia.rawValue)
                        }
                        .frame(height: 40)
                    }
                }
            } header: {
                DisplayTextoBotaoCondicao(titulo: "Perícia Selecionável", descricaoTrue: "Selecione \(vmraca.raca.quantiaEscolhaPericia - vmraca.escolhasDefinidas.escolhaProfPericias.count)", descricaoFalse: "Perícias selecionadas", condicao: vmraca.escolhasDefinidas.escolhaProfPericias.count < vmraca.raca.quantiaEscolhaPericia)
            }

            
        }
        
    }
}

private struct RacaEscolhaMagia: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    @State private var isExpanded: Bool = false
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        
        if vmraca.raca.subracaEscolhaMagias.subraca == vmraca.escolhasDefinidas.escolhaSubRaca.subraca && vmraca.raca.subracaEscolhaMagias.subraca != .none {
            
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(vmraca.raca.subracaEscolhaMagias.magias, id: \.self) { magia in
                    TemplateRadioButtonWithIdentifier(selectedID: $vmraca.escolhaMagia, id: magia) {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    } content: {
                        Text(magia)
                    }
                    .frame(height: 40)

                }
            } header: {
                DisplayTextoBotaoCondicao(titulo: "Escolha uma magia", descricaoTrue: "Toque para selecionar...", descricaoFalse: "Magia selecionada", condicao: vmraca.escolhaMagia.isEmpty)
            }
        }
    }
}

private struct RacaPericiasPadrao: View {
    
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        if !vmraca.raca.profPericias.isEmpty {
            TemplateCustomDisclosureGroup2 {
                ForEach(vmraca.raca.profPericias, id: \.self) { pericia in
                    TemplateDisclosureGroupContent(title: pericia.rawValue)
                }
            } header: {
                DisplayTextoBotao(titulo: "Perícias", descricao: "Toque para detalhes...")
            }

        }
    }
}
