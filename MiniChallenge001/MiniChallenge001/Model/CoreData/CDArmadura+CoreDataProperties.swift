//
//  CDArmadura+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDArmadura {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDArmadura> {
        return NSFetchRequest<CDArmadura>(entityName: "CDArmadura")
    }

    @NSManaged public var descricao: String?
    @NSManaged public var forca: Int64
    @NSManaged public var furtividade: Bool
    @NSManaged public var id: Int64
    @NSManaged public var modCA: Int64
    @NSManaged public var nome: String?
    @NSManaged public var peso: Int64
    @NSManaged public var precoQtd: Int64
    @NSManaged public var precoTipo: String?
    @NSManaged public var quantidade: Int64
    @NSManaged public var tipo: String?
    @NSManaged public var valorCA: Int64
    @NSManaged public var proficiencia: Bool
    @NSManaged public var inventario: CDInventario?

}

extension CDArmadura : Identifiable {

}
