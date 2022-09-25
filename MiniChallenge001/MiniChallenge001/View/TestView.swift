//
//  TestView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 21/09/22.
//

import Foundation
import SwiftUI

struct TesteView: View {
    
    var body: some View {
        Button {
//            let teste = FactoryMagiasConhecidas.criarMagiasComTudo(classe: .clerigo, limiteTruePorNivel: [3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5])
            var opcao1: OpcaoEquipamento {
                var itensEscolha: [[ItemEscolha]] = []
                
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Brunea", quantia: 1, tipo: .armadura)]))
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Couro", quantia: 1, tipo: .armadura)]))
                
                return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
            }
            
            var opcao2: OpcaoEquipamento {
                var itensEscolha: [[ItemEscolha]] = []
                let armasEscolha2: [String] = BuscaArma.buscaArmaTipo(tipo: .simples, nomeExcluso: "Espada Curta")
                
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Espada Curta", quantia: 2, tipo: .arma)]))
                
                for arma in armasEscolha2 {
                    itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 2, tipo: .arma)]))
                }
                
                return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
            }
            
            var opcao3: OpcaoEquipamento {
                var itensEscolha: [[ItemEscolha]] = []
                
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteExplorador.rawValue, quantia: 1, tipo: .equipamento)]))
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteAventureiro.rawValue, quantia: 1, tipo: .equipamento)]))
                
                return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
            }
            
            
            let opcoes: [OpcaoEquipamento] = [opcao1, opcao2, opcao3]
            
            for opcao in opcoes {
                print("---- OPCAO \(opcao) ---")
                for escolha in opcao.escolhas {
                    print("- Escolha -> \(escolha.itens)")
                }
                print()
            }
                
        } label: {
            Text("Botãozim do capeta")
        }
    }
}
