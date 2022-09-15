//
//  ArmaduraJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

enum TipoArmadura: String, Codable {
    case leve = "Leve"
    case media = "Média"
    case pesada = "Pesada"
    case escudo = "Escudo"
}

struct ArmaduraJSON: Item {
    var id: Int
    var nome: String
    var tipo: TipoArmadura
    var preco: Moeda
    var valorCA: Int
    var modCA: Int
    var forca: Int
    var desv_furtividade: Bool
    var peso: Float
    var descricao: String
}
