//
//  SelecaoAntescedenteView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 07/10/22.
//

import SwiftUI

class ViewModelEscolhaAntecedente: ObservableObject {
    
    @Published public var escolha: AntecedenteEscolha
    
    public init() {
        escolha = AntecedenteClient.orderAntecedente(.none)
    }
    
    public init(ficha: PersonagemFicha) {
        self.escolha = AntecedenteClient.orderAntecedente(ficha.antecedenteFinal)
    }
    
    public func setAntecedente(_ antecedente: AntecedentePersonagem) {
        self.escolha = AntecedenteClient.orderAntecedente(antecedente)
    }
    
}

struct SelecaoAntecedenteView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var vmficha: NovaFichaViewModel
    @StateObject private var vmantecedente: ViewModelEscolhaAntecedente
    @State private var showContent: Bool
    
    public init(vmficha: NovaFichaViewModel) {
        self.vmficha = vmficha
        self._vmantecedente = StateObject(wrappedValue: ViewModelEscolhaAntecedente(ficha: vmficha.ficha))
        self._showContent = State(initialValue: vmficha.ficha.antecedenteFinal != .none)
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    AntecedentePickerView(vmantecedente: vmantecedente)
                    PericiasAntecedenteView(antecedente: $vmantecedente.escolha)
                    ProficienciaFerramentaAntecedenteView(antecedente: $vmantecedente.escolha)
                    EscolhaProficienciaFerramentaAntecedenteView(antecedente: $vmantecedente.escolha)
                    EquipamentoAntecedenteView(antecedente: $vmantecedente.escolha)
                    EscolhaEquipamentoAntecedenteView(antecedente: $vmantecedente.escolha)
                    RiquezaAntecedenteView(antecedente: $vmantecedente.escolha)
                }
                
                Button {
                    self.vmficha.setAntecedente(antecedente: vmantecedente.escolha.tipoAntecedente)
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

private struct PericiasAntecedenteView: View {
    
    @Binding private var antecedente: AntecedenteEscolha
    @State private var isExpanded: Bool
    
    public init(antecedente: Binding<AntecedenteEscolha>) {
        self._antecedente = antecedente
        self.isExpanded = false
    }
    
    var body: some View {
        if !antecedente.profPericias.isEmpty {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(antecedente.profPericias, id: \.self) { pericia in
                    TemplateDisclosureGroupContent(title: pericia.rawValue)
                }
            } header: {
                DisplayTextoBotao(titulo: "Proficiência em Perícias", descricao: "Toque para detalhes...")
            }
        }
    }
}

private struct ProficienciaFerramentaAntecedenteView: View {
    
    @Binding private var antecedente: AntecedenteEscolha
    @State private var isExpanded: Bool
    
    public init(antecedente: Binding<AntecedenteEscolha>) {
        self._antecedente = antecedente
        self.isExpanded = false
    }
    
    var body: some View {
        if !antecedente.profFerramentas.isEmpty {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(antecedente.profFerramentas, id: \.id) { ferramenta in
                    TemplateDisclosureGroupContent(title: ferramenta.nome)
                }
            } header: {
                DisplayTextoBotao(titulo: "Proficiência em Ferramenta Padrão", descricao: "Toque para detalhes...")
            }
        }
    }
}

private struct EscolhaProficienciaFerramentaAntecedenteView: View {
    
    @Binding private var antecedente: AntecedenteEscolha
    @State private var isExpanded: Bool
    @State private var selectedFerramenta: String = ""
    
    public init(antecedente: Binding<AntecedenteEscolha>) {
        self._antecedente = antecedente
        self.isExpanded = false
    }
    
    var body: some View {
        if !antecedente.escolhaProfFerramentas.isEmpty {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(antecedente.escolhaProfFerramentas, id: \.self) { ferramenta in
                    TemplateRadioButtonWithIdentifier(selectedID: $selectedFerramenta, id: ferramenta) {
                        
                    } content: {
                        Text(ferramenta)
                    }
                    .frame(height: 40)
                }
            } header: {
                DisplayTextoBotao(titulo: "Proficiência em Ferramenta Selecionável", descricao: "Toque para selecionar...")
            }
        }
    }
}

private struct EquipamentoAntecedenteView: View {
    
    @Binding private var antecedente: AntecedenteEscolha
    @State private var isExpanded: Bool
    
    public init(antecedente: Binding<AntecedenteEscolha>) {
        self._antecedente = antecedente
        self.isExpanded = false
    }
    
    var body: some View {
        if !antecedente.equipamentosIniciais.isEmpty {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(antecedente.equipamentosIniciais, id: \.id) { equipamento in
                    TemplateDisclosureGroupContent(title: equipamento.nome)
                }
            } header: {
                DisplayTextoBotao(titulo: "Equipamento Padrão", descricao: "Toque para detalhes...")
            }
        }
    }
}

private struct EscolhaEquipamentoAntecedenteView: View {
    
    @Binding private var antecedente: AntecedenteEscolha
    @State private var isExpanded: Bool
    @State private var selectedEquipamento: String = ""
    
    public init(antecedente: Binding<AntecedenteEscolha>) {
        self._antecedente = antecedente
        self.isExpanded = false
    }
    
    var body: some View {
        if !antecedente.escolhaEquipamentoInicial.isEmpty {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(antecedente.escolhaEquipamentoInicial, id: \.self) { equipamento in
                    TemplateRadioButtonWithIdentifier(selectedID: $selectedEquipamento, id: equipamento) {
                        
                    } content: {
                        Text(equipamento)
                    }
                    .frame(height: 40)
                }
            } header: {
                DisplayTextoBotao(titulo: "Equipamento Selecionável", descricao: "Toque para selecionar...")
            }
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
