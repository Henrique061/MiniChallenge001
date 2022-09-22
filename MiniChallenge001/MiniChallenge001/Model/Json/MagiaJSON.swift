//
//  MagiaJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

enum EscolaMagia: String, Codable {
    case abjuracao = "Abjuração"
    case adivinhacao = "Adivinhação"
    case conjuracao = "Conjuração"
    case encantamento = "Encantamento"
    case evocacao = "Evocação"
    case ilusao = "Ilusão"
    case necromancia = "Necromancia"
    case transmutacao = "Transmutação"
}

struct MagiaJSON: Json {
    var id: Int
    var nome: String
    var nivel: Int
    var classes: [ClassePersonagem]
    var escola: EscolaMagia
    var ritual: Bool
    var tempoConjuracao: String
    var alcance: String
    var componentes: String
    var duracao: String
    var descricao: String
}
