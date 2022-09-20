//
//  Persistence.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 12/09/22.
//

import CoreData

struct PersistenceController {
    // singleton que controla o banco
    static let shared = PersistenceController()

    // configuracao para o preview do SwiftUI
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        // cria automaticamente 10 exemplos de itens na lista
        for _ in 0..<10 {
            
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return result
    }()

    // o container que armazena nosso core data
    let container: NSPersistentContainer

    // init para carregar o core data (da para opcionalmente, armazenar numa alocacao de memoria)
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MiniChallenge001") // name = nome do banco
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        // previne que as mudancas pelo pai nao deem merge automaticamente
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    // para checar se o contexto tem mudancas para poder salvar.
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Falha ao salvar os dados (func save() do PersistanceController).")
            }
        }
    }
}
