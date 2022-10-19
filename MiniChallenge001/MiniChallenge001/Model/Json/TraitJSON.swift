//
//  TraitJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 26/09/22.
//

import Foundation

public struct TraitJSON: Json, Hashable, Equatable {
    public var id: Int
    public var nome: String
    public var raca: TipoRaca
    public var subraca: TipoSubRaca?
    public var descricao: String
}
