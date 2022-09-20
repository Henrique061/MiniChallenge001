//
//  CDMagia+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDMagia {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMagia> {
        return NSFetchRequest<CDMagia>(entityName: "CDMagia")
    }

    @NSManaged public var alcance: String?
    @NSManaged public var classes: String?
    @NSManaged public var componentes: String?
    @NSManaged public var descricao: String?
    @NSManaged public var duracao: String?
    @NSManaged public var escola: String?
    @NSManaged public var id: Int64
    @NSManaged public var nivel: Int64
    @NSManaged public var nome: String?
    @NSManaged public var ritual: Bool
    @NSManaged public var tempoConj: String?
    @NSManaged public var personagem: CDPersonagem?

}

extension CDMagia : Identifiable {

}
