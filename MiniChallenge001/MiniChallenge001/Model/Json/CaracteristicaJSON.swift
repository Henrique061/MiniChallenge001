//
//  CaracteristicaJSON.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 26/09/22.
//

import Foundation

public struct CaracteristicaJSON: Json {
    public var id: Int
    public var nome: String
    public var classe: ClassePersonagem
    public var subclasse: SubclassePersonagem?
    public var nivel: [Int]
    public var descricao: String
}
