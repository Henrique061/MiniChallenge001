//
//  ArmaJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

public enum TipoDano: String, Codable, Hashable {
    case perfurante = "Perfurante"
    case cortante = "Cortante"
    case concussao = "Concussão"
    case none = "Nenhum"
}

public enum EstiloArma: String, Codable, Hashable {
    case distancia = "Distância"
    case cac = "Corpo a Corpo"
}

public enum TipoArma: String, Codable, Hashable {
    case simples = "Simples"
    case marcial = "Marcial"
}

public struct Dano: Codable, Hashable {
    var dano: String
    var tipo: TipoDano
}

public struct ArmaJSON: Json {
   public var id: Int
   public var nome: String
   public var tipo: TipoArma
   public var estilo: EstiloArma
   public var preco: Moeda
   public var dano: Dano
   public var peso: Float
   public var propriedades: String
}
