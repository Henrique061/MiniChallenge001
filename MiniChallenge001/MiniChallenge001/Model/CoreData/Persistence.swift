//
//  Persistence.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 12/09/22.
//

import CoreData

class PersistenceController {
    
    private let DATA_MODEL_NAME = "MiniCHallenge001"
    
    // Singleton variable
    public static let shared = PersistenceController()
    
    public let container: NSPersistentContainer
    
    public init(inMemory: Bool = false) {
        self.container = NSPersistentContainer(name: DATA_MODEL_NAME)
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data Error: \(error.localizedDescription)")
            }
        }
    }
    
    public func save() {
        let context = self.container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Core Data Save Error: \(error)")
            }
        }
    }
    
}
