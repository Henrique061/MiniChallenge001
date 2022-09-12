//
//  MiniChallenge001App.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 12/09/22.
//

import SwiftUI

@main
struct MiniChallenge001App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
