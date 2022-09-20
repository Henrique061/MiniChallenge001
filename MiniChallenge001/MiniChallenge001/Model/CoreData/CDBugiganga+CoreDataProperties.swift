//
//  CDBugiganga+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDBugiganga {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDBugiganga> {
        return NSFetchRequest<CDBugiganga>(entityName: "CDBugiganga")
    }

    @NSManaged public var id: Int64
    @NSManaged public var nome: String?
    @NSManaged public var valor: Int64
    @NSManaged public var inventario: CDInventario?

}

extension CDBugiganga : Identifiable {

}
