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
                VStack(alignment: .leading, spacing: 0) {
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
                Text(equipamento.nome)
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
        ForEach(escolha.opcoesEquipamento, id: \.self) { i in
            DisclosureGroup("Escolha #n") {
                ForEach(i.escolhas, id: \.self) { j in
                    ForEach(j.itens, id: \.self) { k in
                        Text(k.nomeItem)
                    }
                }
            }
        }
        
//            .onAppear {
//                for i in escolha.opcoesEquipamento {
//                    for j in i.escolhas {
//                        for k in j.itens {
//                            print(k.nomeItem)
//                        }
//                    }
//                }
//            }
    }
}
