//
//  FerramentaJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

enum TipoFerramenta: String, Codable {
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

struct FerramentaJSON: Json {
    var id: Int
    var nome: String
    var tipo: TipoFerramenta
    var preco: Moeda
    var peso: Float
    var descricao: String
}
