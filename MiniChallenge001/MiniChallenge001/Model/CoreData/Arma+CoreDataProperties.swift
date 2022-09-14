//
//  Arma+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 13/09/22.
//
//

import Foundation
import CoreData


extension Arma {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Arma> {
        return NSFetchRequest<Arma>(entityName: "Arma")
    }

    @NSManaged public var id: Int64
    @NSManaged public var nome: String?
    @NSManaged public var tipo: String?
    @NSManaged public var estilo: String?
    @NSManaged public var precoQtd: Int64
    @NSManaged public var precoTipo: String?
    @NSManaged public var danoDado: String?
    @NSManaged public var peso: Float
    @NSManaged public var propriedades: String?
    @NSManaged public var danoTipo: String?

}

extension Arma : Identifiable {

}
