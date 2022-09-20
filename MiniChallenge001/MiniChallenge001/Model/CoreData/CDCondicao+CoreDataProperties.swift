//
//  CDCondicao+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDCondicao {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCondicao> {
        return NSFetchRequest<CDCondicao>(entityName: "CDCondicao")
    }

    @NSManaged public var id: Int64
    @NSManaged public var nome: String?
    @NSManaged public var isAtivo: Bool
    @NSManaged public var personagem: CDPersonagem?

}

extension CDCondicao : Identifiable {

}
