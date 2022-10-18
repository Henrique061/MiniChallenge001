//
//  Moeda.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

public enum TipoMoeda: String, Codable {
    case cobre = "Peça de Cobre"
    case prata = "Peça de Prata"
    case electro = "Peça de Electro"
    case ouro = "Peça de Ouro"
    case platina = "Peça de Platina"
    
    case none = "Nenhum"
}

public struct Moeda: Codable, Hashable {
    var quantidade: Int = 0
    var tipo: TipoMoeda = .none
}
