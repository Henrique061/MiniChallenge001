//
//  CDStatus+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDStatus {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDStatus> {
        return NSFetchRequest<CDStatus>(entityName: "CDStatus")
    }

    @NSManaged public var classeArmadura: Int64
    @NSManaged public var dadosVida: Int64
    @NSManaged public var deslocamento: Float
    @NSManaged public var id: Int64
    @NSManaged public var iniciativa: Int64
    @NSManaged public var nivel: Int64
    @NSManaged public var ptsVida: Int64
    @NSManaged public var ptsVidaTemporaria: Int64
    @NSManaged public var personagem: CDPersonagem?

}

extension CDStatus : Identifiable {

}
