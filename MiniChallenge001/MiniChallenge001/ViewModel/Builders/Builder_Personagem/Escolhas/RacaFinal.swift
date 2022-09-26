//
//  RacaFinal.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 26/09/22.
//

import Foundation

public struct RacaFinal : Codable {
    var racaPersonagem: TipoRaca
    var subracaPersonagem: TipoSubRaca?
    var tracos: [String]
    var tracosSubraca: [String]?
}
