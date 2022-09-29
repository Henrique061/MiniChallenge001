//
//  Moeda.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

public enum TipoMoeda: String, Codable {
    case cobre = "Cobre"
    case prata = "Prata"
    case electro = "Electro"
    case ouro = "Ouro"
    case platina = "Platina"
    
    case none = "Nenhum"
}

public struct Moeda: Codable {
    var quantidade: Int = 0
    var tipo: TipoMoeda = .none
}
