//
//  MagiaJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

public enum EscolaMagia: String, Codable {
    case abjuracao = "Abjuração"
    case adivinhacao = "Adivinhação"
    case conjuracao = "Conjuração"
    case encantamento = "Encantamento"
    case evocacao = "Evocação"
    case ilusao = "Ilusão"
    case necromancia = "Necromancia"
    case transmutacao = "Transmutação"
}

public struct MagiaJSON: Json, Hashable {
    public var id: Int
    public var nome: String
    public var nivel: Int
    public var classes: [ClassePersonagem]
    public var escola: EscolaMagia
    public var ritual: Bool
    public var tempoConjuracao: String
    public var alcance: String
    public var componentes: String
    public var duracao: String
    public var descricao: String
}
