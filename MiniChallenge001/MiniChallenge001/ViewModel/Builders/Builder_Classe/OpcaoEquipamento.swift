//
//  OpcaoEquipamento.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 23/09/22.
//

import Foundation

public class OpcaoEquipamento : Codable {
    var escolhas: [EscolhaOpcao] = []

}

public struct EscolhaOpcao : Codable, Hashable {
    var itens: [ItemEscolha]
}

public struct ItemEscolha : Codable, Hashable {
    var nomeItem: String
    var quantia: Int
    var tipoJson: BundleFolderName
}

//MARK: Factory
public class FactoryOpcaoEquipamento : Codable {
    // cria uma opcao
    public static func criaOpcao(escolhas: [EscolhaOpcao]) -> OpcaoEquipamento {
        let opcao = OpcaoEquipamento()
        opcao.escolhas = escolhas
        return opcao
    }
    
    // cria as escolhas de uma opcao
    public static func criaEscolha(itensEscolha: [[ItemEscolha]]) -> [EscolhaOpcao] {
        var escolhas: [EscolhaOpcao] = []
        for item in itensEscolha {
            escolhas.append(EscolhaOpcao(itens: item))
        }
        
        return escolhas
    }
    
    // cria o item(s) de uma escolha
    public static func criaItemEscolha(tuplaItens: [(item: String, quantia: Int, tipo: BundleFolderName)]) -> [ItemEscolha] {
        var itensEscolha: [ItemEscolha] = []
        for tuplaItem in tuplaItens {
            itensEscolha.append(ItemEscolha(nomeItem: tuplaItem.item, quantia: tuplaItem.quantia, tipoJson: tuplaItem.tipo))
        }
        
        return itensEscolha
    }
}
