//
//  CDInventario+CoreDataProperties.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 20/09/22.
//
//

import Foundation
import CoreData


extension CDInventario {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDInventario> {
        return NSFetchRequest<CDInventario>(entityName: "CDInventario")
    }

    @NSManaged public var id: Int64
    @NSManaged public var personagem: CDPersonagem?
    @NSManaged public var montaria: CDMontaria?
    @NSManaged public var armas: [CDArma]?
    @NSManaged public var armaduras: [CDArmadura]?
    @NSManaged public var ferrametas: [CDFerramenta]?
    @NSManaged public var bugigangas: [CDBugiganga]?
    @NSManaged public var equipamentos: [CDEquipamento]?
    @NSManaged public var itensMontaria: [CDItemMontaria]?
}

// MARK: Generated accessors for armas
extension CDInventario {

    @objc(addArmasObject:)
    @NSManaged public func addToArmas(_ value: CDArma)

    @objc(removeArmasObject:)
    @NSManaged public func removeFromArmas(_ value: CDArma)

    @objc(addArmas:)
    @NSManaged public func addToArmas(_ values: NSSet)

    @objc(removeArmas:)
    @NSManaged public func removeFromArmas(_ values: NSSet)

}

// MARK: Generated accessors for armaduras
extension CDInventario {

    @objc(addArmadurasObject:)
    @NSManaged public func addToArmaduras(_ value: CDArmadura)

    @objc(removeArmadurasObject:)
    @NSManaged public func removeFromArmaduras(_ value: CDArmadura)

    @objc(addArmaduras:)
    @NSManaged public func addToArmaduras(_ values: NSSet)

    @objc(removeArmaduras:)
    @NSManaged public func removeFromArmaduras(_ values: NSSet)

}

// MARK: Generated accessors for ferrametas
extension CDInventario {

    @objc(addFerrametasObject:)
    @NSManaged public func addToFerrametas(_ value: CDFerramenta)

    @objc(removeFerrametasObject:)
    @NSManaged public func removeFromFerrametas(_ value: CDFerramenta)

    @objc(addFerrametas:)
    @NSManaged public func addToFerrametas(_ values: NSSet)

    @objc(removeFerrametas:)
    @NSManaged public func removeFromFerrametas(_ values: NSSet)

}

// MARK: Generated accessors for bugigangas
extension CDInventario {

    @objc(addBugigangasObject:)
    @NSManaged public func addToBugigangas(_ value: CDBugiganga)

    @objc(removeBugigangasObject:)
    @NSManaged public func removeFromBugigangas(_ value: CDBugiganga)

    @objc(addBugigangas:)
    @NSManaged public func addToBugigangas(_ values: NSSet)

    @objc(removeBugigangas:)
    @NSManaged public func removeFromBugigangas(_ values: NSSet)

}

// MARK: Generated accessors for equipamentos
extension CDInventario {

    @objc(addEquipamentosObject:)
    @NSManaged public func addToEquipamentos(_ value: CDEquipamento)

    @objc(removeEquipamentosObject:)
    @NSManaged public func removeFromEquipamentos(_ value: CDEquipamento)

    @objc(addEquipamentos:)
    @NSManaged public func addToEquipamentos(_ values: NSSet)

    @objc(removeEquipamentos:)
    @NSManaged public func removeFromEquipamentos(_ values: NSSet)

}

// MARK: Generated accessors for itensMontaria
extension CDInventario {

    @objc(addItensMontariaObject:)
    @NSManaged public func addToItensMontaria(_ value: CDItemMontaria)

    @objc(removeItensMontariaObject:)
    @NSManaged public func removeFromItensMontaria(_ value: CDItemMontaria)

    @objc(addItensMontaria:)
    @NSManaged public func addToItensMontaria(_ values: NSSet)

    @objc(removeItensMontaria:)
    @NSManaged public func removeFromItensMontaria(_ values: NSSet)

}

extension CDInventario : Identifiable {

}
