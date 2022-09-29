//
//  RacaFinal.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 26/09/22.
//

import Foundation

public struct RacaFinal : Codable {
    var racaPersonagem: TipoRaca = .none
    var subracaPersonagem: TipoSubRaca = .none
    var tracos: [TraitJSON] = []
    var tracosSubraca: [TraitJSON] = []
}

public class RacaFinalFactory {
    
    public static func create(raca: TipoRaca, subraca: TipoSubRaca, tracosRaca: [TraitJSON], tracosSubraca: [TraitJSON]) -> RacaFinal {
        return RacaFinal(racaPersonagem: raca, subracaPersonagem: subraca, tracos: tracosRaca, tracosSubraca: tracosSubraca)
    }
    
}
