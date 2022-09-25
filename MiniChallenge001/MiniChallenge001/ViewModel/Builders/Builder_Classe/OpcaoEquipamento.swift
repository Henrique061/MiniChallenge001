//
//  OpcaoEquipamento.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 23/09/22.
//

import Foundation

public enum PacoteEquipamento : String, Codable {
    case pacoteArtista = "Pacote de Artista"
    case pacoteAssaltante = "Pacote de Assaltante"
    case pacoteAventureiro = "Pacote de Aventureiro"
    case pacoteDiplomata = "Pacote de Diplomata"
    case pacoteEstudioso = "Pacote de Estudioso"
    case pacoteExplorador = "Pacote de Explorador"
    case pacoteSacerdote = "Pacote de Sacerdote"
}

public enum TipoJSON : String, Codable {
    case arma = "arma"
    case armadura = "armaduras"
    case equipamento = "equipamento"
    case ferramenta = "ferramenta"
}

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

public struct ItemEscolha : Codable {
    var nomeItem: String
    var quantia: Int
    var tipoJson: TipoJSON
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
    public static func criaItemEscolha(tuplaItens: [(item: String, quantia: Int, tipo: TipoJSON)]) -> [ItemEscolha] {
        var itensEscolha: [ItemEscolha] = []
        for tuplaItem in tuplaItens {
            itensEscolha.append(ItemEscolha(nomeItem: tuplaItem.item, quantia: tuplaItem.quantia, tipoJson: tuplaItem.tipo))
        }
        
        return itensEscolha
    }
}
