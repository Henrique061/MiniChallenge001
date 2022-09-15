//
//  Moeda.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

enum TipoMoeda: String, Codable {
    case cobre = "Cobre"
    case prata = "Prata"
    case electro = "Electro"
    case ouro = "Ouro"
    case platina = "Platina"
}

struct Moeda: Codable {
    var quantidade: Int
    var tipo: TipoMoeda
}
