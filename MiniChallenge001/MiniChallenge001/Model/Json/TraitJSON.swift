//
//  TraitJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 26/09/22.
//

import Foundation

public struct TraitJSON: Json, Hashable, Equatable {
    var id: Int
    var nome: String
    var raca: TipoRaca
    var subraca: TipoSubRaca?
    var descricao: String
}
