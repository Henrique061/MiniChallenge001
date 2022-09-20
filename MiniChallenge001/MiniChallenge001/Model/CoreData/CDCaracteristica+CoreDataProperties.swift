//
//  CDCaracteristica+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDCaracteristica {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCaracteristica> {
        return NSFetchRequest<CDCaracteristica>(entityName: "CDCaracteristica")
    }

    @NSManaged public var id: Int64
    @NSManaged public var nome: String?
    @NSManaged public var descricao: String?
    @NSManaged public var personagem: CDPersonagem?

}

extension CDCaracteristica : Identifiable {

}
