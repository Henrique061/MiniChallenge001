//
//  FerramentaJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

public enum TipoFerramenta: String, Codable, Hashable {
    case artesao = "Ferramenta de artesão"
    case navegacao = "Ferramenta de navegador"
    case ladrao = "Ferramenta de ladrão"
    case musical = "Instrumento musical"
    case disfarce = "Kit de disfarce"
    case falsificacao = "Kit de falsificação"
    case herbalismo = "Kit de herbalismo"
    case jogo = "Kit de jogo"
    case veneno = "Kit de venenos"
}

public struct FerramentaJSON: Json, Hashable {
    public var id: Int
    public var nome: String
    public var tipo: TipoFerramenta
    public var preco: Moeda
    public var peso: Float
    public var descricao: String
}
