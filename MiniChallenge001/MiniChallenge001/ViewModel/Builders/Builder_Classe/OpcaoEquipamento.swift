//
//  OpcaoEquipamento.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 23/09/22.
//

import Foundation

public class OpcaoEquipamento : Codable {
    var escolhas: [EscolhaOpcao] = []
    
    public func getEscolhaEspecifica(indiceEscolha: Int) -> [EscolhaOpcao] {
        if indiceEscolha > -1 && indiceEscolha <= escolhas.count - 1 {
            return escolhas
        }
        
        else {
            print("Indice fornecido, ou eh negativo, ou eh maior que a quantia que o array de escolhas tem")
        }
        
        return []
    }
}

public struct EscolhaOpcao : Codable {
    var itens: [ItemEscolha]
}

public struct ItemEscolha: Codable {
    var nomeItem: String
    var quantia: Int
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
    public static func criaItemEscolha(tuplaItens: [(item: String, quantia: Int)]) -> [ItemEscolha] {
        var itensEscolha: [ItemEscolha] = []
        for tuplaItem in tuplaItens {
            itensEscolha.append(ItemEscolha(nomeItem: tuplaItem.item, quantia: tuplaItem.quantia))
        }
        
        return itensEscolha
    }
}
