//
//  EquipamentoJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

enum CategoriaEquipamento: String, Codable {
    case focoArcano = "Foco Arcano"
    case focoDruidico = "Foco Druídico"
    case municao = "Munição"
    case simboloSagrado = "Símbolo Sagrado"
    case none = "Sem Categoria"
}

struct Equipamento: Item {
    var id: Int
    var nome: String
    var categoria: CategoriaEquipamento
    var preco: Moeda
    var peso: Float
    var quantidade: Int
    var descricao: String
}
