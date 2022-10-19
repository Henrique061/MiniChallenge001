//
//  EquipamentoMontariaJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

public struct EquipamentoMontariaJSON: Json {
    public var id: Int
    public var nome: String
    public var preco: Moeda
    public var peso: Float
}
