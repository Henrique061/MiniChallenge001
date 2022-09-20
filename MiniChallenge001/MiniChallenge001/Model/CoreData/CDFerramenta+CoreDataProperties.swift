//
//  CDFerramenta+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDFerramenta {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFerramenta> {
        return NSFetchRequest<CDFerramenta>(entityName: "CDFerramenta")
    }

    @NSManaged public var descricao: String?
    @NSManaged public var id: Int64
    @NSManaged public var nome: String?
    @NSManaged public var peso: Float
    @NSManaged public var precoQtd: Int64
    @NSManaged public var precoTipo: String?
    @NSManaged public var quantidade: Int64
    @NSManaged public var tipo: String?
    @NSManaged public var proficiencia: Bool
    @NSManaged public var inventario: CDInventario?

}

extension CDFerramenta : Identifiable {

}
