//
//  MontariaJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

public struct MontariaJSON: Json {
    public var id: Int
    public var nome: String
    public var preco: Moeda
    public var delocamento: Float
    public var capacidadeCarga: Float
}
