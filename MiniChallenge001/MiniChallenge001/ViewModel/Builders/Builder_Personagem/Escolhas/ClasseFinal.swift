//
//  ClasseFinal.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 26/09/22.
//

import Foundation

public struct ClasseFinal : Codable {
    var classePersonagem: ClassePersonagem
    var caracteristicasPersonagem: [String]
    var subclassesPersonagem: [SubClasseEscolha]
    
    var espacosDeMagia: [EspacosDeMagias]?
    var pontosEspecificosNumerico: [PontoEspecificoNumerico]?
    var pontosEspecificosTexto: [PontoEspecificoTexto]?
}
