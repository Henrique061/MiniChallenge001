//
//  Classe.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 21/09/22.
//

import Foundation

class Classe {
    var classe: String // COLOCAR O ENUM AQUI
    var caracteristicas: [String] // COLOCAR CARACTERISTICAS AQUI
    
    public init (classe: String, caracteristicas: [String]) {
        self.classe = classe
        self.caracteristicas = caracteristicas
    }
}

class SubClasse : Classe {
    var subCaracteristicas: [String] // COLOCAR CARACTERISTICAS AQUI
}
