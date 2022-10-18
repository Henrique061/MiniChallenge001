//
//  MiniChallenge001App.swift
//  MiniChallenge0011
//
//  Created by Henrique Batista de Assis on 12/09/22.
//

import SwiftUI

@main
struct MiniChallenge001App: App {

    @Environment(\.scenePhase) private var scene
    @StateObject private var vmfichas: SheetsViewModel
    
    public init() {
        self._vmfichas = StateObject(wrappedValue: SheetsViewModel())
    }
    
    var body: some Scene {
        WindowGroup {
            MainView(vmfichas: vmfichas)
        }
        
        .onChange(of: scene) { _ in
            let _ = vmfichas.saveFicha()
        }
    }
}
