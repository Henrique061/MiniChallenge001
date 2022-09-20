//
//  CDArma+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDArma {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDArma> {
        return NSFetchRequest<CDArma>(entityName: "CDArma")
    }

    @NSManaged public var danoDado: String?
    @NSManaged public var danoTipo: String?
    @NSManaged public var estilo: String?
    @NSManaged public var id: Int64
    @NSManaged public var nome: String?
    @NSManaged public var peso: Float
    @NSManaged public var precoQtd: Int64
    @NSManaged public var precoTipo: String?
    @NSManaged public var propriedades: String?
    @NSManaged public var quantidade: Int64
    @NSManaged public var tipo: String?
    @NSManaged public var proficiencia: Bool
    @NSManaged public var inventario: CDInventario?

}

extension CDArma : Identifiable {

}
