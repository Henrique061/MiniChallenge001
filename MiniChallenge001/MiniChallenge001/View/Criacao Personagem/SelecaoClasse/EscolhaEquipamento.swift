//
//  EscolhaEquipamento.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 07/10/22.
//

import SwiftUI

struct EscolhaEquipamento: View {
    
    @ObservedObject private var vmclasse: CriacaoClasseViewModel
    @Environment(\.dismiss) private var dismiss
    
    public init(classe: CriacaoClasseViewModel) {
        self.vmclasse = classe
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    MostrarItensJson(title: "Equipamentos Iniciais", lista: vmclasse.escolha.armasIniciais)
                    PacotesIniciais(classe: $vmclasse.escolha)
                    OpcoesEquipamento(escolha: $vmclasse.escolha)
                    Spacer()
                }
                
                Button {
                    
                    dismiss()
                } label: {
                    Text("Salvar Alterações")
                }
                .buttonStyle(CustomButtonStyle5())
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
    
    @Binding private var escolha: ClasseEscolha
    @State private var isExpanded: Bool = false
    @State private var selectedID: [String] = []
    
    public init(escolha: Binding<ClasseEscolha>) {
        self._escolha = escolha
    }
    
    var body: some View {
        
        ForEach(Array(escolha.opcoesEquipamento.enumerated()), id: \.element) { (i, selecao) in
            
            TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
                
                ForEach(Array(selecao.escolhas.enumerated()), id: \.element) { (j, unica) in
                    Text("Opção \(String(UnicodeScalar(65 + j)!))")
                        .font(.system(size: 13, weight: .bold, design: .default))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                    
                    ForEach(unica.escolhasUnicas, id: \.self) { opcao in
                        TemplateRadioButtonWithContent(isMarked: false) {
                            
                            ForEach(opcao.itens, id: \.self) { item in
                                DisplayTextoBotao(titulo: item.nomeItem, descricao: "Quantidade: \(item.quantia)")
                            }
                            
                        } completion: {
                            
                        }
                    }
                }
                
            } header: {
                Text("Escolha \(i + 1)")
            }
        }
        
        
//        ForEach(Array(escolha.opcoesEquipamento.enumerated()), id: \.element) { (i, selecao) in
//
//            TemplateCustomDisclosureGroup2 {
//                ForEach(Array(selecao.escolhas.enumerated()), id: \.element) { (j, opcao) in
//                    Text("Opção \(String(UnicodeScalar(65 + j)!))")
//                        .font(.system(size: 13, weight: .bold, design: .default))
//                        .padding(.horizontal, 10)
//                        .padding(.vertical, 4)
//
//                    ForEach(opcao.itens, id: \.self) { item in
//                        TemplateRadioButtonMultipleIdentifier(selectedID: $selectedID, id: item.nomeItem) {
//
//                        } content: {
//                            VStack(alignment: .leading, spacing: 0) {
//                                Text(item.nomeItem)
//                                    .font(.system(size: 13, weight: .regular, design: .default))
//                                Text("Quantidade: \(item.quantia)")
//                                    .font(.system(size: 10, weight: .regular, design: .default))
//                            }.padding(.vertical, 3)
//                        }
//                    }
//                }
//            } header: {
//                Text("Escolha \(i + 1)")
//                    .font(.system(size: 15, weight: .bold, design: .default))
//            }
//        }
    }
}

