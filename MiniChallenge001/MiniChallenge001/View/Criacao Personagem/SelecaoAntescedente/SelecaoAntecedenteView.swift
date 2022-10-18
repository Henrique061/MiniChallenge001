//
//  SelecaoAntescedenteView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 07/10/22.
//

import SwiftUI

class ViewModelEscolhaAntecedente: ObservableObject {
    
    @Published public var escolha: AntecedenteEscolha
    @Published public var definidas: AntecedenteEscolhasDefinidas
    @Published public var escolhaIdiomas: [Idioma]
    @Published public var escolhaEquipamento: String
    @Published public var escolhaProfFerramenta: String
    @Published public var escolhaFerramenta: String
    
    public var buttonIsDisabled: Bool {
        self.escolha.tipoAntecedente == .none ||
        self.escolha.possuiEscolhaIdioma && self.escolhaIdiomas.isEmpty ||
        self.escolha.possuiEscolhaEquipamentoInicial && self.escolhaEquipamento.isEmpty ||
        self.escolha.possuiEscolhaProfFerramentas && self.escolhaProfFerramenta.isEmpty ||
        self.escolha.possuiEscolhaFerramentaInicial && self.escolhaFerramenta.isEmpty
    }
    
    public init(antecedente: AntecedentePersonagem) {
        self.escolha = AntecedenteClient.orderAntecedente(antecedente)
        self.definidas = AntecedenteEscolhasDefinidas()
        self.escolhaIdiomas = []
        self.escolhaEquipamento = ""
        self.escolhaProfFerramenta = ""
        self.escolhaFerramenta = ""
    }
    
    public func setAntecedente(_ antecedente: AntecedentePersonagem) {
        DispatchQueue.main.async {
            self.escolha = AntecedenteClient.orderAntecedente(antecedente)
            self.definidas = AntecedenteEscolhasDefinidas()
            self.escolhaIdiomas = []
            self.escolhaEquipamento = ""
            self.escolhaProfFerramenta = ""
            self.escolhaFerramenta = ""
        }
    }
    
    public func setEscolhaProfFerramenta() {
        DispatchQueue.main.async {
            self.definidas.escolhaProfFerramenta.append(BuscaJson.buscaFerramentaPorNome(nome: self.escolhaProfFerramenta))
        }
    }
    
    public func setEscolhaEquipamento() {
        DispatchQueue.main.async {
            self.definidas.escolhaEquipamentosIniciais.append(BuscaJson.buscaEquipamentoPorNome(nome: self.escolhaEquipamento))
        }
    }
    
    public func setEscolhaFerramenta() {
        DispatchQueue.main.async {
            self.definidas.escolhaFerramentasIniciais.append(BuscaJson.buscaFerramentaPorNome(nome: self.escolhaFerramenta))
        }
    }
    
    public func setIdiomas() {
        DispatchQueue.main.async {
            self.escolhaIdiomas.forEach({self.definidas.escolhaIdiomas.append(IdiomaAlfabeto(idioma: $0, alfabeto: .none, isPadrao: false))})
        }
    }
    
    public func buildAntecedenteFinal() -> AntecedenteFinal {
        setEscolhaProfFerramenta()
        setEscolhaEquipamento()
        setEscolhaFerramenta()
        setIdiomas()
        
        return AntecedenteClient.orderAntecedenteFinal(self.escolha, self.definidas)
    }
}

struct SelecaoAntecedenteView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var vmficha: NovaFichaViewModel
    @StateObject private var vmantecedente: ViewModelEscolhaAntecedente
    @State private var showContent: Bool
    
    public init(vmficha: NovaFichaViewModel) {
        self.vmficha = vmficha
        self._vmantecedente = StateObject(wrappedValue: ViewModelEscolhaAntecedente(antecedente: vmficha.antecedenteFinal.tipoAntecedente))
        self._showContent = State(initialValue: vmficha.antecedenteFinal.tipoAntecedente != .none)
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    ScreenContent(vmantecedente: vmantecedente)
                    RiquezaAntecedenteView(antecedente: $vmantecedente.escolha)
                }
                
                Button {
                    vmficha.setAntecedente(antecedente: self.vmantecedente.buildAntecedenteFinal())
                    dismiss()
                } label: {
                    Text("Salvar Alteração")
                }
                .buttonStyle(CustomButtonStyle5())
                .disabled(vmantecedente.escolha.tipoAntecedente == .none)
            }
            .padding(.horizontal, 10)
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("Antecedente do Personagem")
                }
            }
        }
    }
}

private struct ScreenContent: View {
    @ObservedObject private var vmantecedente: ViewModelEscolhaAntecedente
    
    public init(vmantecedente: ViewModelEscolhaAntecedente) {
        self.vmantecedente = vmantecedente
    }
    
    var body: some View {
        AntecedentePickerView(vmantecedente: vmantecedente)
        ProfPericiaAntecedente(vmantecedente: vmantecedente)
        ProfFerramentaAntecedente(vmantecedente: vmantecedente)
        EscolhaProfFerramentaAntecedente(vmantecedente: vmantecedente)
        EscolhaIdiomaAntecedente(vmantecedente: vmantecedente)
        EquipamentoAntecedente(vmantecedente: vmantecedente)
        EscolhaEquipamentoAntecedente(vmantecedente: vmantecedente)
        FerramentaAntecedente(vmantecedente: vmantecedente)
        EscolhaFerramentaAntecedente(vmantecedente: vmantecedente)
        ArmaAntecedente(vmantecedente: vmantecedente)
    }
}

private struct AntecedentePickerView: View {
    
    @ObservedObject private var vmantecedente: ViewModelEscolhaAntecedente
    @State private var isExpanded: Bool
    
    public init(vmantecedente: ViewModelEscolhaAntecedente) {
        self.vmantecedente = vmantecedente
        self.isExpanded = false
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(AntecedentePersonagem.allCases, id: \.self) { antecedente in
                if antecedente != .none {
                    TemplateRadioButtonWithIdentifier(selectedID: $vmantecedente.escolha.tipoAntecedente, id: antecedente) {
                        withAnimation {
                            self.vmantecedente.setAntecedente(antecedente)
                            self.isExpanded.toggle()
                        }
                    } content: {
                        Text("\(antecedente.rawValue)")
                    }
                    .frame(height: 40)
                }
            }
        } header: {
            DisplayTextoBotaoCondicao(titulo: "Antecedente", descricaoTrue: "Toque para selecionar...", descricaoFalse: vmantecedente.escolha.tipoAntecedente.rawValue, condicao: vmantecedente.escolha.tipoAntecedente == .none)
        }
    }
}

private struct ProfFerramentaAntecedente: View {
    @ObservedObject private var vmantecedente: ViewModelEscolhaAntecedente
    
    public init(vmantecedente: ViewModelEscolhaAntecedente) {
        self.vmantecedente = vmantecedente
    }
    
    var body: some View {
        if !vmantecedente.escolha.profFerramentas.isEmpty {
            MostrarItensJson(title: "Proficiências em Ferramenta", lista: vmantecedente.escolha.profFerramentas)
        }
    }
}

private struct EscolhaProfFerramentaAntecedente: View {
    
    @ObservedObject private var vmantecedente: ViewModelEscolhaAntecedente
    @State private var isExpanded: Bool
    
    public init(vmantecedente: ViewModelEscolhaAntecedente) {
        self.vmantecedente = vmantecedente
        self.isExpanded = false
    }
    
    var body: some View {
        if self.vmantecedente.escolha.possuiEscolhaProfFerramentas {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(self.vmantecedente.escolha.escolhaProfFerramentas, id: \.self) { ferramenta in
                    TemplateRadioButtonWithIdentifier(selectedID: $vmantecedente.escolhaProfFerramenta, id: ferramenta) {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    } content: {
                        Text(ferramenta)
                    }
                    .frame(height: 40)
                }
            } header: {
                DisplayTextoBotaoCondicao(titulo: "Proficiência em Ferramenta Selecionável", descricaoTrue: "Toque para selecionar...", descricaoFalse: "Proficiência em Ferramenta selecionada", condicao: vmantecedente.escolhaProfFerramenta.isEmpty)
            }
        }
    }
}

private struct ProfPericiaAntecedente: View {
    @State private var vmantecedente: ViewModelEscolhaAntecedente
    
    public init(vmantecedente: ViewModelEscolhaAntecedente) {
        self.vmantecedente = vmantecedente
    }
    
    var body: some View {
        if !vmantecedente.escolha.profPericias.isEmpty {
            TemplateCustomDisclosureGroup2 {
                ForEach(vmantecedente.escolha.profPericias, id: \.self) { pericia in
                    TemplateDisclosureGroupContent(title: pericia.rawValue)
                }
            } header: {
                DisplayTextoBotao(titulo: "Proficiência em Perícias", descricao: "Toque para detalhes...")
            }
            
        }
    }
}

private struct EscolhaIdiomaAntecedente: View {
    @ObservedObject private var vmantecedente: ViewModelEscolhaAntecedente
    @State private var isExpanded: Bool = false
    
    
    public init(vmantecedente: ViewModelEscolhaAntecedente) {
        self.vmantecedente = vmantecedente
    }
    
    var body: some View {
        if vmantecedente.escolha.possuiEscolhaIdioma {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(Idioma.allCases, id: \.self) { idioma in
                    TemplateRadioButtonMultipleIdentifier(selectedID: $vmantecedente.escolhaIdiomas, id: idioma, maxSelection: vmantecedente.escolha.quantiaEscolhaIdioma) {
                        
                    } content: {
                        Text(idioma.rawValue)
                    }
                    .frame(height: 40)
                }
            } header: {
                DisplayTextoBotaoCondicao(titulo: "Idiomas Selecionáveis", descricaoTrue: "Selecione \(vmantecedente.escolha.quantiaEscolhaIdioma - vmantecedente.escolhaIdiomas.count) idiomas", descricaoFalse: "Idiomas selecionados", condicao: vmantecedente.escolhaIdiomas.count < vmantecedente.escolha.quantiaEscolhaIdioma)
            }
        }
    }
}

private struct EquipamentoAntecedente: View {
    @ObservedObject private var vmantecedente: ViewModelEscolhaAntecedente
    
    public init(vmantecedente: ViewModelEscolhaAntecedente) {
        self.vmantecedente = vmantecedente
    }
    
    var body: some View {
        if !vmantecedente.escolha.equipamentosIniciais.isEmpty {
            MostrarItensJson(title: "Equipamentos Iniciais", lista: vmantecedente.escolha.equipamentosIniciais)
        }
    }
}

private struct EscolhaEquipamentoAntecedente: View {
    @ObservedObject private var vmantecedente: ViewModelEscolhaAntecedente
    @State private var isExpanded: Bool = false
    
    public init(vmantecedente: ViewModelEscolhaAntecedente) {
        self.vmantecedente = vmantecedente
    }
    
    var body: some View {
        if vmantecedente.escolha.possuiEscolhaEquipamentoInicial {
            TemplateCustomDisclosureGroup2 {
                ForEach(vmantecedente.escolha.escolhaEquipamentoInicial, id: \.self) { equipamento in
                    TemplateRadioButtonWithIdentifier(selectedID: $vmantecedente.escolhaEquipamento, id: equipamento) {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    } content: {
                        Text(equipamento)
                    }
                    .frame(height: 40)
                }
            } header: {
                DisplayTextoBotaoCondicao(titulo: "Equipamento Inicial Selecionável", descricaoTrue: "Toque para selecionar...", descricaoFalse: "Equipamento selecionado", condicao: vmantecedente.escolhaEquipamento.isEmpty)
            }
            
        }
    }
}

private struct FerramentaAntecedente: View {
    @ObservedObject private var vmantecedente: ViewModelEscolhaAntecedente
    
    public init(vmantecedente: ViewModelEscolhaAntecedente) {
        self.vmantecedente = vmantecedente
    }
    
    var body: some View {
        if !vmantecedente.escolha.ferramentasIniciais.isEmpty {
            MostrarItensJson(title: "Ferramentas Iniciais", lista: vmantecedente.escolha.ferramentasIniciais)
        }
    }
}

private struct EscolhaFerramentaAntecedente: View {
    @ObservedObject private var vmantecedente: ViewModelEscolhaAntecedente
    @State private var isExpanded: Bool = false
    
    public init(vmantecedente: ViewModelEscolhaAntecedente) {
        self.vmantecedente = vmantecedente
        
    }
    
    var body: some View {
        if vmantecedente.escolha.possuiEscolhaFerramentaInicial {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(vmantecedente.escolha.escolhaFerramentaInicial, id: \.self) { ferramenta in
                    TemplateRadioButtonWithIdentifier(selectedID: $vmantecedente.escolhaFerramenta, id: ferramenta) {
                        withAnimation {
                            self.isExpanded.toggle()
                        }
                    } content: {
                        Text(ferramenta)
                    }
                    .frame(height: 40)
                }
            } header: {
                DisplayTextoBotaoCondicao(titulo: "Ferramenta Inicial Selecionável", descricaoTrue: "Toque para selecionar...", descricaoFalse: "Ferramenta selecionada", condicao: vmantecedente.escolhaFerramenta.isEmpty)
            }
        }
    }
}

private struct ArmaAntecedente: View {
    @ObservedObject private var vmantecedente: ViewModelEscolhaAntecedente
    
    public init(vmantecedente: ViewModelEscolhaAntecedente) {
        self.vmantecedente = vmantecedente
    }
    
    var body: some View {
        if !vmantecedente.escolha.armasIniciais.isEmpty {
            MostrarItensJson(title: "Armas Iniciais", lista: vmantecedente.escolha.armasIniciais)
        }
    }
}

private struct RiquezaAntecedenteView: View {
    
    @Binding private var antecedente: AntecedenteEscolha
    
    public init(antecedente: Binding<AntecedenteEscolha>) {
        self._antecedente = antecedente
    }
    
    var body: some View {
        if antecedente.dinheiroInicial.tipo != .none {
            TemplateContentBackground {
                DisplayTextoBotao(titulo: "Riqueza", descricao: "\(antecedente.dinheiroInicial.quantidade) \(antecedente.dinheiroInicial.tipo.rawValue)")
                    .padding(10)
            }
        }
    }
}
