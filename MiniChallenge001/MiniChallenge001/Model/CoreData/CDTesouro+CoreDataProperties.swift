//
//  CDTesouro+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDTesouro {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTesouro> {
        return NSFetchRequest<CDTesouro>(entityName: "CDTesouro")
    }

    @NSManaged public var tipoMoeda: String?
    @NSManaged public var quantidade: Int64
    @NSManaged public var id: Int64
    @NSManaged public var personagem: CDPersonagem?

}

extension CDTesouro : Identifiable {

}
