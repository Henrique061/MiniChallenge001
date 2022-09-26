//
//  AntecedenteClient.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 25/09/22.
//

import Foundation

public class AntecedenteClient : Codable {
    public static func orderAntecedente(_ tipoAntecedente: AntecedentePersonagem) -> AntecedenteEscolha {
        let director = AntecedenteDirector()
        let builder = AntecedenteConcreteBuilder()
        
        director.newBuilder(antBuilder: builder)
        director.makeAntecedente(tipoAntecedente)
        
        return builder.getAntecedenteFinal()
    }
}
