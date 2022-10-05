//
//  ClasseFinal.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 26/09/22.
//

import Foundation

public struct ClasseFicha : Codable {
    var classePersonagem: ClassePersonagem = .none
    var caracteristicasPersonagem: [String] = []
    var subclassesPersonagem: [SubClasse] = []
    
    var espacosDeMagia: [EspacosDeMagias] = []
    var pontosEspecificosNumerico: [PontoEspecificoNumerico] = []
    var pontosEspecificosTexto: [PontoEspecificoTexto] = []
}
