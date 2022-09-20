//
//  CDMontaria+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDMontaria {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMontaria> {
        return NSFetchRequest<CDMontaria>(entityName: "CDMontaria")
    }

    @NSManaged public var capCarga: Float
    @NSManaged public var deslocamento: Float
    @NSManaged public var id: Int64
    @NSManaged public var nome: String?
    @NSManaged public var precoQtd: Int64
    @NSManaged public var precoTipo: String?
    @NSManaged public var quantidade: Int64
    @NSManaged public var personagem: CDPersonagem?
    @NSManaged public var inventario: CDInventario?

}

extension CDMontaria : Identifiable {

}
