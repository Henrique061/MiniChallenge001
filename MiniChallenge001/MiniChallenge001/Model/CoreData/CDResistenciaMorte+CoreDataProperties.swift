//
//  CDResistenciaMorte+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDResistenciaMorte {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDResistenciaMorte> {
        return NSFetchRequest<CDResistenciaMorte>(entityName: "CDResistenciaMorte")
    }

    @NSManaged public var acerto: Int64
    @NSManaged public var erro: Int64
    @NSManaged public var id: Int64
    @NSManaged public var personagem: CDPersonagem?

}

extension CDResistenciaMorte : Identifiable {

}
