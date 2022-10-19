//
//  VeiculoAquaticoJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

public struct VeiculoAquaticoJSON: Json {
    public var id: Int
    public var nome: String
    public var preco: Moeda
    public var velocidade: Float
}
