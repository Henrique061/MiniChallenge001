//
//  CondicoesUtils.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 19/10/22.
//

import Foundation

public enum Condicao : String, Codable, Hashable, CaseIterable {
    case agarrado = "Agarrado"
    case amedrontado = "Amedrontado"
    case atordoado = "Atordoado"
    case caido = "Caído"
    case cego = "Cego"
    case enfeiticado = "Enfeitiçado"
    case envenenado = "Envenenado"
    case impedido = "Impedido"
    case incapacitado = "Incapacitado"
    case inconsciente = "Inconsciente"
    case invisivel = "Invisível"
    case paralisado = "Paralisado"
    case petrificado = "Petrificado"
    case surdo = "Surdo"
}

public enum Exaustao : String, Codable, Hashable, CaseIterable {
    case none = "Nenhum"
    case ex1 = "Exaustão nível 1"
    case ex2 = "Exaustão nível 2"
    case ex3 = "Exaustão nível 3"
    case ex4 = "Exaustão nível 4"
    case ex5 = "Exaustão nível 5"
    case ex6 = "Exaustão nível 6"
}
