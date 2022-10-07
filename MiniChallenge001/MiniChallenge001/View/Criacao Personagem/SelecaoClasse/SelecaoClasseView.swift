//
//  SelecaoClasseView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 30/09/22.
//

import SwiftUI

class CriacaoClasseViewModel: ObservableObject {
    @Published var escolha: ClasseEscolha
    
    public init() {
        self.escolha = ClasseClient.orderClasse(classePersonagem: .none)
    }
    
    public init(ficha: PersonagemFicha) {
        self.escolha = ClasseClient.orderClasse(classePersonagem: ficha.classeFinal.classePersonagem)
    }
    
    public func setClasse(classe: ClassePersonagem) {
        self.escolha = ClasseClient.orderClasse(classePersonagem: classe)
    }
}

struct SelecaoClasseView: View {
    
    @Binding private var ficha: PersonagemFicha
    @ObservedObject private var vmclasse: CriacaoClasseViewModel
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
        self.vmclasse = CriacaoClasseViewModel(ficha: ficha.wrappedValue)
    }
    
    var body: some View {
        TemplateTelaPadrao {
            ScrollView {
                MenuSelecaoClasse().environmentObject(vmclasse)
                PontosDeVidaInfo().environmentObject(vmclasse)
                BotaoEscolherRiqueza().environmentObject(vmclasse)
                BotaoEscolherProficiencia(escolha: $vmclasse.escolha)
                BotaoEscolherEquipamento(escolha: $vmclasse.escolha)
            }
            .padding(.horizontal, 10)
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("Classe do Personagem")
                }
            }
        }
    }
}

struct MenuSelecaoClasse: View {
    
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
                                withAnimation(.easeOut) {
                                    vmclasse.setClasse(classe: classe)
                                    self.showContent.toggle()
                                }
                            }
                        }
                    }
                }
            } label: {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Classe do personagem")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                    Text(vmclasse.escolha.classePersonagem == .none ? "Toque para selecionar..." : vmclasse.escolha.classePersonagem.rawValue)
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }.buttonStyle(CustomButtonStyle2())
        }
    }
}

struct PontosDeVidaInfo: View {
    
    @EnvironmentObject var vmclasse: CriacaoClasseViewModel
    
    var body: some View {
        if vmclasse.escolha.classePersonagem != .none {
            TemplateContentBackground {
                DisplayTextoBotao(titulo: "Pontos de Vida Inicial", descricao: "\(vmclasse.escolha.vidaInicial) + Modificador de Constituição")
                    .padding(10)
            }
        }
    }
}

struct BotaoEscolherRiqueza: View {
    
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

struct BotaoEscolherProficiencia: View {
    
    @Binding private var escolha: ClasseEscolha
    
    public init(escolha: Binding<ClasseEscolha>) {
        self._escolha = escolha
    }
    
    var body: some View {
        if escolha.classePersonagem != .none {
            CustomNavigationLink {
                EscolhaProficienciaView(escolha: $escolha)
            } label: {
                DisplayTextoBotao(titulo: "Proficiências", descricao: "Toque para selecionar...")
            }.buttonStyle(CustomButtonStyle2())
        }
    }
}

struct BotaoEscolherEquipamento: View {
    
    @Binding private var escolha: ClasseEscolha
    
    public init(escolha: Binding<ClasseEscolha>) {
        self._escolha = escolha
    }
    
    var body: some View {
        if escolha.classePersonagem != .none {
            CustomNavigationLink {
                EscolhaEquipamento(escolha: $escolha)
            } label: {
                DisplayTextoBotao(titulo: "Equipamentos", descricao: "Toque para selecionar...")
            }.buttonStyle(CustomButtonStyle2())
        }
    }
}
