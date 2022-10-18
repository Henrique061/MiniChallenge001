//
//  ContentView.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 12/09/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @ObservedObject private var sheet: SheetsViewModel
    @State private var currentTab: SheetTabView
    
    public init(ficha: SheetsViewModel) {
        self.currentTab = .combate
        self._sheet = ObservedObject(initialValue: ficha)
    }
    
    var body: some View {
        TabView(selection: $currentTab) {
            
            Inventario(sheet: sheet)
                .tag(SheetTabView.inventario)
                .tabItem {
                    Label("Inventário", image: currentTab == .inventario ? "InventarioIconOn" : "InventarioIconOff")
                }
            
            Habilidades(sheet: sheet)
                .tag(SheetTabView.habilidades)
                .tabItem {
                    Label("Habilidades", image: currentTab == .habilidades ? "HabilidadesIconOn" : "HabilidadesIconOff")
                }
            
            Combate(sheet: sheet)
                .tag(SheetTabView.combate)
                .tabItem {
                    Label("Combate", image: currentTab == .combate ? "CombateIconOn" : "CombateIconOff")
                }
            
            Identidade(sheet: sheet)
                .tag(SheetTabView.identidade)
                .tabItem{
                    Label("Identidade", image: currentTab == .identidade ? "IdentidadeIconOn" : "IdentidadeIconOff")
                }
            
            Atributos(ficha: sheet)
                .tag(SheetTabView.atributos)
                .tabItem{
                    Label("Atributos", image: currentTab == .atributos ? "AtributosIconOn" : "AtributosIconOff")
                }
        }
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
        VStack(alignment: .leading) {
            Text(titulo)
                .font(.system(size: 15, weight: .bold, design: .default))
            Text(descricao)
                .font(.system(size: 13, weight: .regular, design: .default))
        }
    }
}
