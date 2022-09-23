//
//  ArmaduraJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

public enum TipoArmadura: String, Codable {
    case leve = "Leve"
    case media = "Média"
    case pesada = "Pesada"
    case escudo = "Escudo"
}

public struct ArmaduraJSON: Json {
    public var id: Int
    public var nome: String
    public var tipo: TipoArmadura
    public var preco: Moeda
    public var valorCA: Int
    public var modCA: Int
    public var forca: Int
    public var desv_furtividade: Bool
    public var peso: Float
    public var descricao: String
}
