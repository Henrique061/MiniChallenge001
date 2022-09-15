//
//  MagiaJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

enum ClassePersonagem: String, Codable {
    case bardo = "Bardo"
    case bruxo = "Bruxo"
    case clerigo = "Clérigo"
    case druida = "Druida"
    case feiticeiro = "Feiticeiro"
    case mago = "Mago"
    case paladino = "Paladino"
    case patrulheiro = "Patrulheiro"
}

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

struct MagiaJSON: Item {
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
