//
//  SelecaoClasseView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 30/09/22.
//

import SwiftUI

struct SelecaoClasseView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var vmficha: NovaFichaViewModel
    @StateObject private var vmclasse: CriacaoClasseViewModel
    @State private var notChangedRiqueza: Bool = true
    
    private var periciasAreMissing: Bool {
        return vmclasse.definidas.escolhaProfFerramentas.count < vmclasse.escolha.quantiaEscolhaProfFerramentas || vmclasse.definidas.escolhaProfPericias.count < vmclasse.escolha.quantiaProfPericias
    }
    
    private var equipamentosAreMissing: Bool {
        return vmclasse.definidas.escolhasOpcoesEquip.isEmpty
    }
    
    public init(vmficha: NovaFichaViewModel) {
        self.vmficha = vmficha
        self._vmclasse = StateObject(wrappedValue: CriacaoClasseViewModel(classe: vmficha.classeFinal.tipoClasse))
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack {
                ScrollView {
                    MenuSelecaoClasse(vmclasse: vmclasse)
                    PontosDeVidaInfo(classe: $vmclasse.escolha)
                    BotaoEscolherRiqueza(vmclasse: vmclasse, notChangedRiqueza: $notChangedRiqueza)
                    BotaoEscolherProficiencia(vmclasse: vmclasse, optionsAreMissing: periciasAreMissing)
                    BotaoEscolherEquipamento(classe: vmclasse, optionsAreMissing: equipamentosAreMissing)
                    BotaDetalhesCaracteristicaClasse(escolha: $vmclasse.escolha)
                }
                
                Button {
                    let classeFinal = ClasseClient.orderClasseFinal(vmclasse.escolha, vmclasse.definidas)
                    self.vmficha.setClasse(classe: classeFinal)
                    dismiss()
                } label: {
                    Text("Salvar Alterações")
                }
                .buttonStyle(CustomButtonStyle5())
                .disabled(vmclasse.escolha.classePersonagem == .none ||
                          periciasAreMissing ||
                          equipamentosAreMissing ||
                          notChangedRiqueza)
                
            }.padding(.horizontal, 10)
            
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        NavigationBarTitle("Classe do Personagem")
                    }
                }
            
                .onChange(of: vmclasse.escolha.classePersonagem) { _ in
                    notChangedRiqueza = true
                }
        }
    }
}

private struct MenuSelecaoClasse: View {
    
    @ObservedObject private var vmclasse: CriacaoClasseViewModel
    @State private var showContent: Bool = false
    
    public init(vmclasse: CriacaoClasseViewModel) {
        self.vmclasse = vmclasse
    }
    
    var body: some View {
        TemplateContentBackground {
            DisclosureGroup(isExpanded: $showContent) {
                VStack(spacing: 0) {
                    Divider()
                    ForEach(ClassePersonagem.allCases, id: \.self) { classe in
                        if classe != .none {
                            TemplateRadioButton(isMarked: vmclasse.escolha.classePersonagem == classe, title: classe.rawValue) {
                                vmclasse.setClasse(classe: classe)
                                withAnimation(.easeOut) { self.showContent.toggle() }
                            }
                        }
                    }
                }
            } label: {
                DisplayTextoBotaoCondicao(titulo: "Classe do Personagem", descricaoTrue: "Toque para selecionar...", descricaoFalse: vmclasse.escolha.classePersonagem.rawValue, condicao: vmclasse.escolha.classePersonagem == .none)
            }
            .buttonStyle(CustomButtonStyle2())
        }
    }
}

private struct PontosDeVidaInfo: View {
    
    @Binding private var classe: ClasseEscolha
    
    public init(classe: Binding<ClasseEscolha>) {
        self._classe = classe
    }
    
    var body: some View {
        if classe.classePersonagem != .none {
            TemplateContentBackground {
                DisplayTextoBotao(titulo: "Pontos de Vida Inicial", descricao: "\(classe.vidaInicial) + Modificador de Constituição")
                    .padding(10)
            }
        }
    }
}

private struct BotaoEscolherRiqueza: View {
    
    @ObservedObject private var vmclasse: CriacaoClasseViewModel
    @Binding private var notChangedRiqueza: Bool
    @State private var showSheet: Bool = false
    
    
    public init(vmclasse: CriacaoClasseViewModel, notChangedRiqueza: Binding<Bool>) {
        self.vmclasse = vmclasse
        self._notChangedRiqueza = notChangedRiqueza
    }
    
    var body: some View {
        if vmclasse.escolha.classePersonagem != .none {
            Button {
                showSheet.toggle()
                self.notChangedRiqueza = false
            } label: {
                DisplayTextoBotaoCondicao(titulo: "Riqueza", descricaoTrue: "Toque para editar...", descricaoFalse: "Riqueza atual: \(vmclasse.definidas.escolhaRiqueza.quantidade) \(vmclasse.definidas.escolhaRiqueza.quantidade == 1 ? "Peça de Ouro" : "Peças de Ouro")", condicao: notChangedRiqueza)
            }
            .buttonStyle(CustomButtonStyle())
            
            .sheet(isPresented: $showSheet) {
                EditarRiquezaView(vmclasse: vmclasse)
            }
        }
    }
}

private struct BotaoEscolherProficiencia: View {
    
    @ObservedObject private var vmclasse: CriacaoClasseViewModel
    private var optionsAreMissing: Bool
    
    public init(vmclasse: CriacaoClasseViewModel, optionsAreMissing: Bool) {
        self.vmclasse = vmclasse
        self.optionsAreMissing = optionsAreMissing
    }
    
    var body: some View {
        if vmclasse.escolha.classePersonagem != .none {
            CustomNavigationLink {
                EscolhaProficienciaView(vmclasse: vmclasse)
            } label: {
                DisplayTextoBotaoCondicao(titulo: "Proficiências", descricaoTrue: "Toque para selecionar...", descricaoFalse: "Proficiências selecionadas", condicao: optionsAreMissing)
            }.buttonStyle(CustomButtonStyle2())
        }
    }
}

private struct BotaoEscolherEquipamento: View {
    
    @ObservedObject private var vmclasse: CriacaoClasseViewModel
    private var optionsAreMissing: Bool
    
    public init(classe: CriacaoClasseViewModel, optionsAreMissing: Bool) {
        self.vmclasse = classe
        self.optionsAreMissing = optionsAreMissing
    }
    
    var body: some View {
        if vmclasse.escolha.classePersonagem != .none {
            CustomNavigationLink {
                EscolhaEquipamento(classe: vmclasse)
            } label: {
                DisplayTextoBotaoCondicao(titulo: "Equipamentos", descricaoTrue: "Toque para selecionar...", descricaoFalse: "Equipamentos selecionados", condicao: optionsAreMissing)
            }
            .buttonStyle(CustomButtonStyle2())
        }
    }
}

private struct BotaDetalhesCaracteristicaClasse: View {
    
    @Binding private var escolha: ClasseEscolha
    @State private var showSheet: Bool = false
    
    public init(escolha: Binding<ClasseEscolha>) {
        self._escolha = escolha
    }
    
    var body: some View {
        if escolha.classePersonagem != .none {
            Button {
                showSheet.toggle()
            } label: {
                DisplayTextoBotao(titulo: "Características", descricao: "Toque para mais detalhes...")
            }.buttonStyle(CustomButtonStyle())
            
                .sheet(isPresented: $showSheet) {
                    DetalhesCaracteristicaClasse(escolha: $escolha)
                }
        }
    }
}
