//
//  CDItemMontaria+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDItemMontaria {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDItemMontaria> {
        return NSFetchRequest<CDItemMontaria>(entityName: "CDItemMontaria")
    }

    @NSManaged public var id: Int64
    @NSManaged public var nome: String?
    @NSManaged public var peso: Float
    @NSManaged public var precoQtd: Int64
    @NSManaged public var precoTipo: String?
    @NSManaged public var quantidade: Int64
    @NSManaged public var inventario: CDInventario?

}

extension CDItemMontaria : Identifiable {

}
