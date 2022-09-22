//
//  ContentView.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 12/09/22.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @State var currentTab: SheetTabView = .inventario
    
    var body: some View {
        TabView(selection: $currentTab) {
            Inventario()
                .tag(SheetTabView.inventario)
                .tabItem {
                    Label("Inventário", image: currentTab == .inventario ? "InventarioIconOn" : "InventarioIconOff")
                }
            
            Habilidades()
                .tag(SheetTabView.habilidades)
                .tabItem {
                    Label("Habilidades", image: currentTab == .habilidades ? "HabilidadesIconOn" : "HabilidadesIconOff")
                }
            
            Combate()
                .tag(SheetTabView.combate)
                .tabItem {
                    Label("Combate", image: currentTab == .combate ? "CombateIconOn" : "CombateIconOff")
                }
            
            Identidade()
                .tag(SheetTabView.identidade)
                .tabItem{
                    Label("Identidade", image: currentTab == .identidade ? "IdentidadeIconOn" : "IdentidadeIconOff")
                }
            
            Atributos()
                .tag(SheetTabView.atributos)
                .tabItem{
                    Label("Atributos", image: currentTab == .atributos ? "AtributosIconOn" : "AtributosIconOff")
                }
            
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

