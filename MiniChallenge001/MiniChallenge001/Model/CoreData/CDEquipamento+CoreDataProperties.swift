//
//  CDEquipamento+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDEquipamento {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEquipamento> {
        return NSFetchRequest<CDEquipamento>(entityName: "CDEquipamento")
    }

    @NSManaged public var capacidade: String?
    @NSManaged public var categoria: String?
    @NSManaged public var descricao: String?
    @NSManaged public var id: Int64
    @NSManaged public var nome: String?
    @NSManaged public var peso: Float
    @NSManaged public var precoQtd: Int64
    @NSManaged public var precoTipo: String?
    @NSManaged public var quantidade: Int64
    @NSManaged public var attribute: NSObject?
    @NSManaged public var attribute1: NSObject?
    @NSManaged public var attribute2: NSObject?
    @NSManaged public var inventario: CDInventario?

}

extension CDEquipamento : Identifiable {

}
