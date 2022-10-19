//
//  Proficiencias.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 19/10/22.
//

import Foundation
import SwiftUI

struct Proficiencias: View{
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View{
        TemplateTelaPadrao(withPaddings: false) {
            ScrollView {
                if !ficha.profArmaduras.isEmpty {
                    MostrarItensJson(title: "Armaduras", lista: ficha.profArmaduras)
                }
                
                if !ficha.profArmas.isEmpty {
                    MostrarItensJson(title: "Armas", lista: ficha.profArmas)
                }
                
                if !ficha.profFerramentas.isEmpty {
                    MostrarItensJson(title: "Ferramentas", lista: ficha.profFerramentas)
                }
                
            }.padding(.horizontal, 10) // fecha scrllView
                
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                        NavigationBarTitle("Proficiências")
                } // fecha toolbarItem
                    
            } // fecha toolbar
            
        } // fecha TemplateTelaPadrao
        
    } // fecha Body
    
} // fecha truct
