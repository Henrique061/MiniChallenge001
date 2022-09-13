//
//  JSONObject.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 12/09/22.
//

import Foundation

protocol CustomItem: Codable {
    var id: Int { get }
    var nome: String { get }
}

// MARK: Struct Moeda
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

// MARK: Struct Arma
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

struct Arma: CustomItem {
    static func == (lhs: Arma, rhs: Arma) -> Bool {
        return lhs.nome == rhs.nome
    }
    
   var id: Int
   var nome: String
   var tipo: TipoArma
   var estilo: EstiloArma
   var preco: Moeda
   var dano: Dano
   var peso: Float
   var propriedades: String
}
