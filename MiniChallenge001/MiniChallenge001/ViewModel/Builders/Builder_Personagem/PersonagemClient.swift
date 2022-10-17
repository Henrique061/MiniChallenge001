//
//  PersonagemClient.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 17/10/22.
//

import Foundation

public class PersonagemClient {
    public static func orderPersonagem(raca: RacaFinal, classe: ClasseFinal, antecedente: AntecedenteFinal, valoresAtributos: ValoresAtributos) -> PersonagemFicha {
        let director = PersonagemDirector()
        let builder = PersonagemConcreteBuilder()
        
        director.newBuilder(builder)
        director.makePersonagem(raca: raca, classe: classe, antecedente: antecedente, valoresAtributos: valoresAtributos)
        
        return builder.getPersonagemFicha()
    }
}
