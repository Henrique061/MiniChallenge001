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
        self.escolha = ClasseClient.orderClasse(classePersonagem: classe)
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
}

struct SelecaoClasseView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var vmficha: NovaFichaViewModel
    @StateObject private var vmclasse: CriacaoClasseViewModel
    
    public init(ficha: PersonagemFicha) {
        self._vmclasse = StateObject(wrappedValue: CriacaoClasseViewModel(ficha: ficha))
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack {
                ScrollView {
                    MenuSelecaoClasse().environmentObject(vmclasse)
                    PontosDeVidaInfo(classe: $vmclasse.escolha)
                    BotaoEscolherRiqueza().environmentObject(vmclasse)
                    BotaoEscolherProficiencia().environmentObject(vmclasse)
                    BotaoEscolherEquipamento(classe: vmclasse)//.environmentObject(vmclasse)
                    BotaDetalhesCaracteristicaClasse(escolha: $vmclasse.escolha)
                }
                
                Button {
                    self.vmficha.setClasse(classe: vmclasse.buildClasseFicha())
                    dismiss()
                } label: {
                    Text("Salvar Alterações")
                }
                .buttonStyle(CustomButtonStyle5())
                .disabled(vmclasse.escolha.classePersonagem == .none)
                
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
            }.buttonStyle(CustomButtonStyle2())
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
    
    @EnvironmentObject var vmclasse: CriacaoClasseViewModel
    @State private var showSheet: Bool = false
    
    var body: some View {
        if vmclasse.escolha.classePersonagem != .none {
            Button {
                showSheet.toggle()
            } label: {
                DisplayTextoBotao(titulo: "Riqueza", descricao: "Toque para selecionar...")
            }.buttonStyle(CustomButtonStyle())
            
            .sheet(isPresented: $showSheet) {
                EditarRiquezaView()
            }
        }
    }
}

private struct BotaoEscolherProficiencia: View {
    
    @EnvironmentObject private var vmclasse: CriacaoClasseViewModel
    
    var body: some View {
        if vmclasse.escolha.classePersonagem != .none {
            CustomNavigationLink {
                EscolhaProficienciaView().environmentObject(vmclasse)
            } label: {
                DisplayTextoBotao(titulo: "Proficiências", descricao: "Toque para selecionar...")
            }.buttonStyle(CustomButtonStyle2())
        }
    }
}

private struct BotaoEscolherEquipamento: View {
    
    @ObservedObject private var vmclasse: CriacaoClasseViewModel
    
    public init(classe: CriacaoClasseViewModel) {
        self.vmclasse = classe
    }
    
    var body: some View {
        if vmclasse.escolha.classePersonagem != .none {
            CustomNavigationLink {
                EscolhaEquipamento(classe: vmclasse)
            } label: {
                DisplayTextoBotao(titulo: "Equipamentos", descricao: "Toque para selecionar...")
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
