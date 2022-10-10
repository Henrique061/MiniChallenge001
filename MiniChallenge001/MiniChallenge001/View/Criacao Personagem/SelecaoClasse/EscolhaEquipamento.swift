//
//  EscolhaEquipamento.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 07/10/22.
//

import SwiftUI

struct EscolhaEquipamento: View {
    
    @Binding private var escolha: ClasseEscolha
    
    public init(escolha: Binding<ClasseEscolha>) {
        self._escolha = escolha
    }
    
    var body: some View {
        TemplateTelaPadrao {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    EquipamentosPadrao(escolha: $escolha)
                    OpcoesEquipamento(escolha: $escolha)
                    Spacer()
                }.padding(.horizontal, 10)
            }
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("Equipamentos para \(escolha.classePersonagem.rawValue)")
                }
            }
        }
    }
}

private struct EquipamentosPadrao: View {
    
    @Binding private var escolha: ClasseEscolha
    @State private var isExpanded: Bool = false
    
    public init(escolha: Binding<ClasseEscolha>) {
        self._escolha = escolha
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(escolha.equipamentosIniciais, id: \.id) { equipamento in
                TemplateDisclosureGroupContent(title: equipamento.nome)
            }
        } header: {
            Text("Equipamentos Padrão")
                .font(.system(size: 15, weight: .bold, design: .default))
        }
    }
}

private struct OpcoesEquipamento: View {
    
    @Binding private var escolha: ClasseEscolha
    
    public init(escolha: Binding<ClasseEscolha>) {
        self._escolha = escolha
    }
    
    var body: some View {
        ForEach(Array(escolha.opcoesEquipamento.enumerated()), id: \.element) { (i, selecao) in
            
            TemplateCustomDisclosureGroup2 {
                ForEach(Array(selecao.escolhas.enumerated()), id: \.element) { (j, opcao) in
                    Text("Opção \(String(UnicodeScalar(65 + j)!))")
                        .font(.system(size: 13, weight: .bold, design: .default))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                    
                    TemplateRadioButtonWithContent(isMarked: false) {
                        ForEach(opcao.itens, id: \.self) { item in
                            VStack(alignment: .leading, spacing: 0) {
                                Text(item.nomeItem)
                                    .font(.system(size: 13, weight: .regular, design: .default))
                                Text("Quantidade: \(item.quantia)")
                                    .font(.system(size: 10, weight: .regular, design: .default))
                            }.padding(.vertical, 3)
                        }
                    } completion: {
                        
                    }
                }
            } header: {
                Text("Escolha \(i + 1)")
                    .font(.system(size: 15, weight: .bold, design: .default))
            }
        }
    }
}

