//
//  MontariaJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

public struct MontariaJSON: Json {
    var id: Int
    var nome: String
    var preco: Moeda
    var delocamento: Float
    var capacidadeCarga: Float
}
