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
    var tracosSubraca: [TraitJSON] = []
}

public class RacaFichaFactory {
    public static func create(raca: TipoRaca, subraca: TipoSubRaca, tracosRaca: [TraitJSON], tracosSubraca: [TraitJSON]) -> RacaFicha {
        return RacaFicha(racaPersonagem: raca, subracaPersonagem: subraca, tracos: tracosRaca, tracosSubraca: tracosSubraca)
    }
}
