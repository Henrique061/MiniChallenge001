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
    
    public func setAntecedente(_ antecedente: AntecedentePersonagem) {
        self.escolha = AntecedenteClient.orderAntecedente(antecedente)
    }
}

struct SelecaoAntecedenteView: View {
    
    @ObservedObject private var vmantecedente: ViewModelEscolhaAntecedente
    @Binding private var ficha: PersonagemFicha
    @State private var showContent: Bool
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
        self.vmantecedente = ViewModelEscolhaAntecedente()
        self.showContent = ficha.wrappedValue.antecedenteFinal != .none
        print("showContent: \(showContent)")
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    AntecedentePickerView { antecedente in
                        withAnimation {
                            showContent = antecedente != .none
                        }
                        print(showContent)
                        self.vmantecedente.setAntecedente(antecedente)
                    }
                    
                    if showContent {
                        ProficienciasAntecedenteView(antecedente: $vmantecedente.escolha)
                        ProficienciaFerramentaAntecedenteView(antecedente: $vmantecedente.escolha)
                        EscolhaProficienciaFerramentaAntecedenteView(antecedente: $vmantecedente.escolha)
                        EquipamentoAntecedenteView(antecedente: $vmantecedente.escolha)
                        EscolhaEquipamentoAntecedenteView(antecedente: $vmantecedente.escolha)
                        RiquezaAntecedenteView(antecedente: $vmantecedente.escolha)
                    }
                    
                }
                
                Button {
                    
                } label: {
                    Text("Salvar Alteração")
                }.buttonStyle(CustomButtonStyle5())
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
    
    @State private var isExpanded: Bool
    @State private var selectedAntecedente: AntecedentePersonagem
    private var completion: (_ antecedente: AntecedentePersonagem) -> Void
    
    public init(completion: @escaping (_ antecedente: AntecedentePersonagem) -> Void) {
        self.isExpanded = false
        self.selectedAntecedente = .none
        self.completion = completion
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(AntecedentePersonagem.allCases, id: \.self) { antecedente in
                if antecedente != .none {
                    TemplateRadioButton(isMarked: selectedAntecedente == antecedente, title: antecedente.rawValue) {
                        completion(antecedente)
                        withAnimation {
                            self.selectedAntecedente = antecedente
                            self.isExpanded.toggle()
                        }
                    }
                }
            }
        } header: {
            DisplayTextoBotao(titulo: "Antecedente do Personagem", descricao: selectedAntecedente == .none ? "Toque para selecionar..." : selectedAntecedente.rawValue)
        }
    }
}

private struct ProficienciasAntecedenteView: View {
    
    @Binding private var antecedente: AntecedenteEscolha
    @State private var isExpanded: Bool
    
    public init(antecedente: Binding<AntecedenteEscolha>) {
        self._antecedente = antecedente
        self.isExpanded = false
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(antecedente.profPericias, id: \.self) { pericia in
                TemplateDisclosureGroupContent(title: pericia.rawValue)
            }
        } header: {
            DisplayTextoBotao(titulo: "Proficiência em Perícias", descricao: "Toque para detalhes...")
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
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(antecedente.profFerramentas, id: \.id) { ferramenta in
                TemplateDisclosureGroupContent(title: ferramenta.nome)
            }
        } header: {
            DisplayTextoBotao(titulo: "Proficiência em Ferramenta Padrão", descricao: "Toque para detalhes...")
        }
    }
}

private struct EscolhaProficienciaFerramentaAntecedenteView: View {
    
    @Binding private var antecedente: AntecedenteEscolha
    @State private var isExpanded: Bool
    
    public init(antecedente: Binding<AntecedenteEscolha>) {
        self._antecedente = antecedente
        self.isExpanded = false
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(antecedente.escolhaProfFerramentas, id: \.self) { ferramenta in
                TemplateRadioButton(isMarked: false, title: ferramenta) {
                    
                }
            }
        } header: {
            DisplayTextoBotao(titulo: "Proficiência em Ferramenta Selecionável", descricao: "Toque para selecionar...")
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
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(antecedente.equipamentosIniciais, id: \.id) { equipamento in
                TemplateDisclosureGroupContent(title: equipamento.nome)
            }
        } header: {
            DisplayTextoBotao(titulo: "Equioamento Padrão", descricao: "Toque para detalhes...")
        }
    }
}

private struct EscolhaEquipamentoAntecedenteView: View {
    
    @Binding private var antecedente: AntecedenteEscolha
    @State private var isExpanded: Bool
    
    public init(antecedente: Binding<AntecedenteEscolha>) {
        self._antecedente = antecedente
        self.isExpanded = false
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(antecedente.escolhaEquipamentoInicial, id: \.self) { equipamento in
                TemplateRadioButton(isMarked: false, title: equipamento) {
                    
                }
            }
        } header: {
            DisplayTextoBotao(titulo: "Equipamento Selecionável", descricao: "Toque para selecionar...")
        }
    }
}

private struct RiquezaAntecedenteView: View {
    
    @Binding private var antecedente: AntecedenteEscolha
    
    public init(antecedente: Binding<AntecedenteEscolha>) {
        self._antecedente = antecedente
    }
    
    var body: some View {
        TemplateContentBackground {
            DisplayTextoBotao(titulo: "Riqueza", descricao: "\(antecedente.dinheiroInicial.quantidade) \(antecedente.dinheiroInicial.tipo.rawValue)")
                .padding(10)
        }
    }
}
