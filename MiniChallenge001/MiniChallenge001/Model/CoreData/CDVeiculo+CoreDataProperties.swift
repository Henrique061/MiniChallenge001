//
//  CDVeiculo+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDVeiculo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDVeiculo> {
        return NSFetchRequest<CDVeiculo>(entityName: "CDVeiculo")
    }

    @NSManaged public var id: Int64
    @NSManaged public var nome: String?
    @NSManaged public var precoQtd: Int64
    @NSManaged public var precoTipo: String?
    @NSManaged public var quantidade: Int64
    @NSManaged public var velocidade: Float
    @NSManaged public var personagem: CDPersonagem?

}

extension CDVeiculo : Identifiable {

}
