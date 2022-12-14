//
//  ClasseFinal.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 26/09/22.
//

import Foundation

public struct ClasseFicha : Codable, Hashable {
    var classePersonagem: ClassePersonagem = .none
    var caracteristicasPersonagem: [CaracteristicaJSON] = []
    var subclassesPersonagem: [SubClasse] = []
    
    var magiasConhecidas: [MagiasConhecidas] = []
    var espacosDeMagia: [EspacosDeMagias] = []
    var pontosEspecificosNumerico: [PontoEspecificoNumerico] = []
    var pontosEspecificosTexto: [PontoEspecificoTexto] = []
}
