//
//  SelecaoClasseView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 30/09/22.
//

import SwiftUI

class CriacaoClasseViewModel: ObservableObject {
    @Published var escolha: ClasseEscolha
    
    init() {
        self.escolha = ClasseClient.orderClasse(classePersonagem: .none)
    }
    
    public func setClasse(classe: ClassePersonagem) {
        self.escolha = ClasseClient.orderClasse(classePersonagem: classe)
    }
}

struct SelecaoClasseView: View {
    
    @Binding var ficha: PersonagemFicha
    @ObservedObject var vmclasse: CriacaoClasseViewModel = CriacaoClasseViewModel()
    
    var body: some View {
        TemplateTelaPadrao {
            ScrollView {
                MenuSelecaoClasse().environmentObject(vmclasse)
                PontosDeVidaInfo().environmentObject(vmclasse)
                BotaoEscolherRiqueza().environmentObject(vmclasse)
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
