//
//  PersonagemViewModel.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 26/09/22.
//

import Foundation

class PersonagemViewModel: ObservableObject {
    
    @Published var listaFichas: [PersonagemFicha] = []
    
    public func fetch() {
        if let request = JsonFileUtil.getDataFromFiles(folder: .fichas, decoder: PersonagemFicha.self) as? [PersonagemFicha] {
            listaFichas = request
        }
    }
    
    public func createFicha(ficha: PersonagemFicha) {
        
    }
}
