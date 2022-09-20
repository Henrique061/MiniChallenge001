//
//  CDAtributo+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDAtributo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDAtributo> {
        return NSFetchRequest<CDAtributo>(entityName: "CDAtributo")
    }

    @NSManaged public var nome: String?
    @NSManaged public var id: Int64
    @NSManaged public var valor: Int64
    @NSManaged public var proficiencia: Bool
    @NSManaged public var personagem: CDPersonagem?

}

extension CDAtributo : Identifiable {

}
