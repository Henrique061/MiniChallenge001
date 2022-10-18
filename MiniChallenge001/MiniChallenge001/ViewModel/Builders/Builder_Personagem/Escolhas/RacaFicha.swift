//
//  RacaFinal.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 26/09/22.
//

import Foundation

public struct RacaFicha : Codable {
    var racaPersonagem: TipoRaca = .none
    var subracaPersonagem: TipoSubRaca = .none
    var tracos: [TraitJSON] = []
}
