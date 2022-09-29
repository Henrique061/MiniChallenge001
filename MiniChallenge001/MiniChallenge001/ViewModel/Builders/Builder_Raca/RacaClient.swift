//
//  RacaClient.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 25/09/22.
//

import Foundation

public class RacaClient : Codable {
    public static func orderRaca(_ tipoRaca: TipoRaca) -> RacaEscolha {
        let director = RacaDirector()
        let builder = RacaConcreteBuilder()
        
        director.newBuilder(racaBuilder: builder)
        director.makeRaca(tipoRaca)
        
        return builder.getRacaFinal()
    }
    
    public static func orderPersonagemRaca(_ racaEscolha: RacaEscolha, escolhas: RacaEscolhasDefinidas) {
        
    }
}
