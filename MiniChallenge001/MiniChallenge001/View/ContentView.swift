//
//  ContentView.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 12/09/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var currentTab: SheetTabView = .combate
    
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
        .accentColor(Color(UIColor(red: 0.675, green: 0.114, blue: 0.114, alpha: 1).cgColor))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NavigationBarTitle: View {
    private var titulo: String
    
    init(_ titulo: String) {
        self.titulo = titulo
    }
    
    var body: some View {
        Text(titulo)
            .font(.system(size: 18, weight: .bold, design: .rounded))
    }
}

struct PadraoDisplayInformacao: View {
    
    @Binding var titulo: String
    @Binding var descricao: String
    
    var body: some View {
        VStack {
            Text(titulo)
                .font(.system(size: 15, weight: .bold, design: .rounded))
            Text(descricao)
                .font(.system(size: 13, weight: .regular, design: .rounded))
        }
    }
}
