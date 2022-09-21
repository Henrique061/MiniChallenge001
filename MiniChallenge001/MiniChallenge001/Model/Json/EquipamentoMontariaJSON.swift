//
//  EquipamentoMontariaJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

struct EquipamentoMontariaJSON: Json {
    var id: Int
    var nome: String
    var preco: Moeda
    var peso: Float
}