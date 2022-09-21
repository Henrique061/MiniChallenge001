//
//  ArmaJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

enum TipoDano: String, Codable {
    case perfurante = "Perfurante"
    case cortante = "Cortante"
    case concussao = "Concussão"
    case none = "Nenhum"
}

enum EstiloArma: String, Codable {
    case distancia = "Distância"
    case cac = "Corpo a Corpo"
}

enum TipoArma: String, Codable {
    case simples = "Simples"
    case marcial = "Marcial"
}

struct Dano: Codable {
    var dano: String
    var tipo: TipoDano
}

struct ArmaJSON: Json {
    var id: Int
    var nome: String
    var tipo: TipoArma
    var estilo: EstiloArma
    var preco: Moeda
    var dano: Dano
    var peso: Float
    var propriedades: String
}
