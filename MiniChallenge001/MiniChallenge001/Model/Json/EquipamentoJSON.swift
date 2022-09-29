//
//  EquipamentoJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

public enum CategoriaEquipamento: String, Codable {
    case focoArcano = "Foco Arcano"
    case focoDruidico = "Foco Druídico"
    case municao = "Munição"
    case simboloSagrado = "Símbolo Sagrado"
    case none = "Sem Categoria"
}

public struct EquipamentoJSON: Json {
    public var id: Int
    public var nome: String
    public var categoria: CategoriaEquipamento
    public var preco: Moeda
    public var peso: Float
    public var quantidade: Int
    public var descricao: String
}
