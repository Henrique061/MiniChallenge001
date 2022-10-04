//
//  ClasseClient.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 22/09/22.
//

import Foundation

public class ClasseClient : Codable {
    public static func orderClasse(classePersonagem: ClassePersonagem) -> ClasseEscolha {
        let director = ClasseDirector()
        let builder = ClasseConcreteBuilder()
        
        director.newBuilder(classeBuilder: builder)
        director.makeClasse(classe: classePersonagem)
        
        return builder.getClasseFinal()
    }
    
    public static func orderClasseFinal(_ classeEscolha: ClasseEscolha, _ escolhas: ClasseEscolhasDefinidas) {
        let director = ClasseFinalDirector()
        let builder = ClasseFinalConcreteBuilder()
        
        //director.newBuilder(classeBuilder: builder)
        //director.makeClasse(classe: classePersonagem)
        
        //return builder.getClasseFinal()
    }
}
