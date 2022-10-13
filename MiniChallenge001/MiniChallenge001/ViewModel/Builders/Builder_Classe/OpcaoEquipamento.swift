//
//  OpcaoEquipamento.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 23/09/22.
//

import Foundation

// Isso daqui poderia ser uma variável
public struct OpcaoEquipamento : Codable, Hashable {
    var escolhas: [EscolhaOpcao] = []
}

public struct EscolhaOpcao : Codable, Hashable {
    var escolhasUnicas: [EscolhaUnica]
}

public struct EscolhaUnica : Codable, Hashable {
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
        var opcao = OpcaoEquipamento()
        opcao.escolhas = escolhas
        return opcao
    }
    
    // crias as subopcoes dentro de uma opcao
    public static func criaEscolha(escolhasUnicas: [[EscolhaUnica]]) -> [EscolhaOpcao] {
        var escolhas: [EscolhaOpcao] = []
        for escolhaUnica in escolhasUnicas {
            escolhas.append(EscolhaOpcao(escolhasUnicas: escolhaUnica))
        }
        
        return escolhas
    }
    
    // cria as escolhas DENTRO de uma opcao
    public static func criaEscolhasUnicas(itensEscolha: [[ItemEscolha]]) -> [EscolhaUnica] {
        var escolhas: [EscolhaUnica] = []
        for item in itensEscolha {
            escolhas.append(EscolhaUnica(itens: item))
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
