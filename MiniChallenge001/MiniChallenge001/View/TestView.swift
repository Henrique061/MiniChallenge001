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
                let armasEscolha2: [String] = BuscaArma.buscaArmaTipoEstilo(tipo: .marcial, estilo: .cac, nomeExcluso: "")
                
                for arma in armasEscolha2 {
                    itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1)]))
                }
                
                return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
            }
            
            var opcao2: OpcaoEquipamento {
                var itensEscolha: [[ItemEscolha]] = []
                let armasEscolha2: [String] = BuscaArma.buscaArmaTipo(tipo: .simples, nomeExcluso: "Machadinha")
                
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Machadinha", quantia: 2)]))
                
                for arma in armasEscolha2 {
                    itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1)]))
                }
                
                return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
            }
            
            var opcoes: [OpcaoEquipamento] = [opcao1, opcao2]
            
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
