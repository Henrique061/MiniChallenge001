//
//  CDPersonagem+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDPersonagem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPersonagem> {
        return NSFetchRequest<CDPersonagem>(entityName: "CDPersonagem")
    }

    @NSManaged public var foto: Data?
    @NSManaged public var id: Int64
    @NSManaged public var nome: String?
    @NSManaged public var classe: String?
    @NSManaged public var subclasse: String?
    @NSManaged public var raca: String?
    @NSManaged public var antecedente: String?
    @NSManaged public var atributos: [CDAtributo]?
    @NSManaged public var magias: [CDMagia]?
    @NSManaged public var montarias: [CDMontaria]?
    @NSManaged public var resistenciaMorte: CDResistenciaMorte?
    @NSManaged public var status: CDStatus?
    @NSManaged public var veiculos: [CDVeiculo]?
    @NSManaged public var inventario: CDInventario?
    @NSManaged public var pericias: [CDPericia]?
    @NSManaged public var condicoes: [CDCondicao]?
    @NSManaged public var caracteristicas: [CDCaracteristica]?
    @NSManaged public var tesouros: [CDTesouro]?

}

// MARK: Generated accessors for atributos
extension CDPersonagem {

    @objc(addAtributosObject:)
    @NSManaged public func addToAtributos(_ value: CDAtributo)

    @objc(removeAtributosObject:)
    @NSManaged public func removeFromAtributos(_ value: CDAtributo)

    @objc(addAtributos:)
    @NSManaged public func addToAtributos(_ values: NSSet)

    @objc(removeAtributos:)
    @NSManaged public func removeFromAtributos(_ values: NSSet)

}

// MARK: Generated accessors for magias
extension CDPersonagem {

    @objc(addMagiasObject:)
    @NSManaged public func addToMagias(_ value: CDMagia)

    @objc(removeMagiasObject:)
    @NSManaged public func removeFromMagias(_ value: CDMagia)

    @objc(addMagias:)
    @NSManaged public func addToMagias(_ values: NSSet)

    @objc(removeMagias:)
    @NSManaged public func removeFromMagias(_ values: NSSet)

}

// MARK: Generated accessors for montarias
extension CDPersonagem {

    @objc(addMontariasObject:)
    @NSManaged public func addToMontarias(_ value: CDMontaria)

    @objc(removeMontariasObject:)
    @NSManaged public func removeFromMontarias(_ value: CDMontaria)

    @objc(addMontarias:)
    @NSManaged public func addToMontarias(_ values: NSSet)

    @objc(removeMontarias:)
    @NSManaged public func removeFromMontarias(_ values: NSSet)

}

// MARK: Generated accessors for veiculos
extension CDPersonagem {

    @objc(addVeiculosObject:)
    @NSManaged public func addToVeiculos(_ value: CDVeiculo)

    @objc(removeVeiculosObject:)
    @NSManaged public func removeFromVeiculos(_ value: CDVeiculo)

    @objc(addVeiculos:)
    @NSManaged public func addToVeiculos(_ values: NSSet)

    @objc(removeVeiculos:)
    @NSManaged public func removeFromVeiculos(_ values: NSSet)

}

// MARK: Generated accessors for pericias
extension CDPersonagem {

    @objc(addPericiasObject:)
    @NSManaged public func addToPericias(_ value: CDPericia)

    @objc(removePericiasObject:)
    @NSManaged public func removeFromPericias(_ value: CDPericia)

    @objc(addPericias:)
    @NSManaged public func addToPericias(_ values: NSSet)

    @objc(removePericias:)
    @NSManaged public func removeFromPericias(_ values: NSSet)

}

// MARK: Generated accessors for condicoes
extension CDPersonagem {

    @objc(addCondicoesObject:)
    @NSManaged public func addToCondicoes(_ value: CDCondicao)

    @objc(removeCondicoesObject:)
    @NSManaged public func removeFromCondicoes(_ value: CDCondicao)

    @objc(addCondicoes:)
    @NSManaged public func addToCondicoes(_ values: NSSet)

    @objc(removeCondicoes:)
    @NSManaged public func removeFromCondicoes(_ values: NSSet)

}

// MARK: Generated accessors for caracteristicas
extension CDPersonagem {

    @objc(addCaracteristicasObject:)
    @NSManaged public func addToCaracteristicas(_ value: CDCaracteristica)

    @objc(removeCaracteristicasObject:)
    @NSManaged public func removeFromCaracteristicas(_ value: CDCaracteristica)

    @objc(addCaracteristicas:)
    @NSManaged public func addToCaracteristicas(_ values: NSSet)

    @objc(removeCaracteristicas:)
    @NSManaged public func removeFromCaracteristicas(_ values: NSSet)

}

// MARK: Generated accessors for tesouros
extension CDPersonagem {

    @objc(addTesourosObject:)
    @NSManaged public func addToTesouros(_ value: CDTesouro)

    @objc(removeTesourosObject:)
    @NSManaged public func removeFromTesouros(_ value: CDTesouro)

    @objc(addTesouros:)
    @NSManaged public func addToTesouros(_ values: NSSet)

    @objc(removeTesouros:)
    @NSManaged public func removeFromTesouros(_ values: NSSet)

}

extension CDPersonagem : Identifiable {

}
