//
//  ClasseClient.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 22/09/22.
//

import Foundation

public class ClasseClient {
    static func orderClasse(classePersonagem: ClassePersonagem) {
        let director = ClasseDirector()
        let builder = ClasseConcreteBuilder()
        
        director.newBuilder(classeBuilder: builder)
        director.makeClasse(classe: classePersonagem)
        
        let classe = builder.getClasseFinal()
    }
}
