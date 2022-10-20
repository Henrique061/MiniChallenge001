//
//  EscolhaEquipamento.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 07/10/22.
//

import SwiftUI

struct EscolhaEquipamento: View {
    
    @StateObject private var vmclasse: CriacaoClasseViewModel
    @State private var escolhasEquipamento: [EscolhaUnica]
    @Environment(\.dismiss) private var dismiss
    
    private var buttonIsDisabled: Bool {
        var isAllSelected = true
        for i in self.escolhasEquipamento {
            if i.itens.isEmpty {
                isAllSelected = false
            }
        }
        return !isAllSelected
    }
    
    public init(classe: CriacaoClasseViewModel) {
        self._vmclasse = StateObject(wrappedValue: classe)
        
        if classe.definidas.escolhasOpcoesEquip.count < classe.escolha.opcoesEquipamento.count {
            self._escolhasEquipamento = State(initialValue: Array<EscolhaUnica>(repeating: EscolhaUnica(itens: []), count: classe.escolha.opcoesEquipamento.count))
        } else {
            self._escolhasEquipamento = State(initialValue: classe.definidas.escolhasOpcoesEquip)
        }
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    ItensIniciais(vmclasse: self.vmclasse)
                    OpcoesEquipamento(classe: vmclasse, selections: $escolhasEquipamento)
                    Spacer()
                }
                
                Button {
                    self.vmclasse.setEscolhaEquipamentos(escolhas: self.escolhasEquipamento)
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
                    NavigationBarTitle("Equipamentos para \(vmclasse.escolha.classePersonagem.rawValue)")
                }
            }
        }
    }
}

private struct ItensIniciais: View {
    
    @ObservedObject private var vmclasse: CriacaoClasseViewModel
    
    public init(vmclasse: CriacaoClasseViewModel) {
        self.vmclasse = vmclasse
    }
    
    var body: some View {
        if !self.vmclasse.escolha.equipamentosIniciais.isEmpty {
            MostrarItensJson(title: "Equipamentos Iniciais", lista: vmclasse.escolha.equipamentosIniciais)
        }
        PacotesIniciais(classe: $vmclasse.escolha)
        if !self.vmclasse.escolha.armasIniciais.isEmpty {
            MostrarItensJson(title: "Armas Iniciais", lista: vmclasse.escolha.armasIniciais)
        }
        if !self.vmclasse.escolha.armadurasIniciais.isEmpty {
            MostrarItensJson(title: "Armaduras Iniciais", lista: vmclasse.escolha.armadurasIniciais)
        }
        if !self.vmclasse.escolha.ferramentasIniciais.isEmpty {
            MostrarItensJson(title: "Ferramentas Iniciais", lista: vmclasse.escolha.ferramentasIniciais)
        }
    }
}

private struct PacotesIniciais: View {
    
    @Binding private var classe: ClasseEscolha
    @State private var isExpanded: Bool = false
    
    public init(classe: Binding<ClasseEscolha>) {
        self._classe = classe
    }
    
    var body: some View {
        if !classe.pacotesIniciais.isEmpty {
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                ForEach(classe.pacotesIniciais, id: \.self) { pacote in
                    TemplateDisclosureGroupContent(title: pacote.rawValue)
                }
            } header: {
                Text("Pacotes Iniciais")
                    .font(.system(size: 15, weight: .bold, design: .default))
            }
        }
    }
}

private struct OpcoesEquipamento: View {
    
    @ObservedObject private var classe: CriacaoClasseViewModel
    @Binding private var selections: [EscolhaUnica]
    
    public init(classe: CriacaoClasseViewModel, selections: Binding<[EscolhaUnica]>) {
        self.classe = classe
        self._selections = selections
    }
    
    var body: some View {
        
        ForEach(Array(classe.escolha.opcoesEquipamento.enumerated()), id: \.element) { (i, selecao) in
            OpcaoEsquipamentoDisclosure(num: i, escolhas: selecao.escolhas, selections: $selections)
        }
    }
}

private struct OpcaoEsquipamentoDisclosure: View {
    
    @Binding private var selections: [EscolhaUnica]
    @State private var isExpanded: Bool = false
    private var num: Int
    private var escolhas: [EscolhaOpcao]
    
    public init(num: Int, escolhas: [EscolhaOpcao], selections: Binding<[EscolhaUnica]>) {
        self.num = num
        self.escolhas = escolhas
        self._selections = selections
    }
    
    var body: some View {
        
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(Array(escolhas.enumerated()), id: \.element) { (j, unica) in
                if escolhas.count > 1 {
                    Text("Opção \(String(UnicodeScalar(65 + j)!))")
                        .font(.system(size: 13, weight: .bold, design: .default))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                }

                ForEach(Array(unica.escolhasUnicas.enumerated()), id: \.element) { (k, opcao) in

                    TemplateRadioButtonWithIdentifier(selectedID: $selections[num], id: opcao) {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    } content: {
                        ForEach(opcao.itens, id: \.self) { item in
                            DisplayTextoBotao(titulo: item.nomeItem, descricao: "Quantidade: \(item.quantia)")
                        }
                    }
                }
            }
        } header: {
            DisplayTextoBotaoCondicao(titulo: "Escolha \(num + 1)", descricaoTrue: "Escolha uma opção...", descricaoFalse: "Opção selecionada", condicao: self.selections[num].itens.isEmpty )
        }
        
    }
    
}
