//
//  SelecaoClasseView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 30/09/22.
//

import SwiftUI

class CriacaoClasseViewModel: ObservableObject {
    @Published var escolha: ClasseEscolha
    @Published var definidas: ClasseEscolhasDefinidas
    
    public init() {
        self.escolha = ClasseClient.orderClasse(classePersonagem: .none)
        self.definidas = ClasseEscolhasDefinidas()
    }
    
    public init(ficha: PersonagemFicha) {
        self.escolha = ClasseClient.orderClasse(classePersonagem: ficha.classeFinal.classePersonagem)
        self.definidas = ClasseEscolhasDefinidas()
    }
    
    public func setClasse(classe: ClassePersonagem) {
        DispatchQueue.main.async {
            self.escolha = ClasseClient.orderClasse(classePersonagem: classe)
            self.definidas = ClasseEscolhasDefinidas()
        }
    }
    
    public func getCaracteristicas() -> [String] {
        var nomes: [String] = []
        for i in self.escolha.caracteristicasClasse {
            nomes.append(i.nome)
        }
        return nomes
    }
    
    public func buildClasseFicha() -> ClasseFicha {
        return ClasseFicha(classePersonagem: self.escolha.classePersonagem, caracteristicasPersonagem: getCaracteristicas(), subclassesPersonagem: self.escolha.subClasses, espacosDeMagia: self.escolha.espacosDeMagia, pontosEspecificosNumerico: self.escolha.pontosEspecificosNumerico, pontosEspecificosTexto: self.escolha.pontosEspecificosTexto)
    }
    
    public func setProficienciaPericias(pericias: [Pericia]) {
        DispatchQueue.main.async {
            self.definidas.escolhaProfPericias = pericias
        }
    }
    
    public func setProficientaFerramentas(ferramentas: [FerramentaJSON]) {
        DispatchQueue.main.async {
            self.definidas.escolhaProfFerramentas = ferramentas
        }
    }
    
    public func setRiqueza(moeda: Moeda) {
        DispatchQueue.main.async {
            self.definidas.escolhaRiqueza = moeda
        }
    }
    
    public func setEscolhaEquipamentos(escolhas: [EscolhaUnica]) {
        DispatchQueue.main.async {
            self.definidas.escolhasOpcoesEquip = escolhas
        }
    }
}

struct SelecaoClasseView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var vmficha: NovaFichaViewModel
    @StateObject private var vmclasse: CriacaoClasseViewModel
    
    private var periciasAreMissing: Bool {
        return vmclasse.definidas.escolhaProfFerramentas.count < vmclasse.escolha.quantiaEscolhaProfFerramentas || vmclasse.definidas.escolhaProfPericias.count < vmclasse.escolha.quantiaProfPericias
    }
    
    private var equipamentosAreMissing: Bool {
        return vmclasse.definidas.escolhasOpcoesEquip.isEmpty
    }
    
    public init(ficha: PersonagemFicha) {
        self._vmclasse = StateObject(wrappedValue: CriacaoClasseViewModel(ficha: ficha))
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack {
                ScrollView {
                    MenuSelecaoClasse().environmentObject(vmclasse)
                    PontosDeVidaInfo(classe: $vmclasse.escolha)
                    BotaoEscolherRiqueza(vmclasse: vmclasse)
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
                          equipamentosAreMissing)
                
            }.padding(.horizontal, 10)
            
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        NavigationBarTitle("Classe do Personagem")
                    }
                }
        }
    }
}

private struct MenuSelecaoClasse: View {
    
    @EnvironmentObject var vmclasse: CriacaoClasseViewModel
    @State private var showContent: Bool = false
    
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
    
    @ObservedObject var vmclasse: CriacaoClasseViewModel
    @State private var showSheet: Bool = false
    
    public init(vmclasse: CriacaoClasseViewModel) {
        self.vmclasse = vmclasse
    }
    
    var body: some View {
        if vmclasse.escolha.classePersonagem != .none {
            Button {
                showSheet.toggle()
            } label: {
                DisplayTextoBotao(titulo: "Riqueza", descricao: "Riqueza atual: \(vmclasse.definidas.escolhaRiqueza.quantidade) \(vmclasse.definidas.escolhaRiqueza.quantidade == 1 ? "Peça de Ouro" : "Peças de Ouro")")
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
