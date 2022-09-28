//
//  CaracteristicaJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 26/09/22.
//

import Foundation

public struct CaracteristicaJSON: Json {
    var id: Int
    var nome: String
    var classe: ClassePersonagem
    var subclasse: SubclassePersonagem?
    var nivel: [Int]
    var descricao: String
}
