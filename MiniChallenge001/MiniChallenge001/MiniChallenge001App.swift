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
    @Environment(\.scenePhase) var scenePhase // var para salvar o core data quando o app vai pro background do phone

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        
        // chama a func save() quando o app vai de base
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
    struct RecivedView: View {
        var body: some View {
            Text("Hello, World!")
        }
    }
}
