//
//  CDPericia+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDPericia {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPericia> {
        return NSFetchRequest<CDPericia>(entityName: "CDPericia")
    }

    @NSManaged public var id: Int64
    @NSManaged public var nome: String?
    @NSManaged public var proficiencia: Bool
    @NSManaged public var personagem: CDPersonagem?

}

extension CDPericia : Identifiable {

}
