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
    
    public static func orderAntecedenteFinal(_ antecedenteEscolha: AntecedenteEscolha, _ escolhas: AntecedenteEscolhasDefinidas) -> AntecedenteFinal {
        let director = AntecedenteFinalDirector()
        let builder = AntecedenteFinalConcreteBuilder()
        
        director.newBuilder(antecedenteFinalBuilder: builder)
        director.makeAntecedenteFinal(antecedenteEscolha, escolhas)
        
        return builder.getAntecedenteFinal()
    }
}
