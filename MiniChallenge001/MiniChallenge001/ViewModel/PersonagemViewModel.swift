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
        do {
            listaFichas = try JsonFileUtil.getAllSheets()
        } catch {
            print("FAILED TO FETCH SHEETS: \(error.localizedDescription)")
        }
    }
    
    public func createNewFicha(ficha: PersonagemFicha) {
        do {
            ficha.id = try JsonFileUtil.getNewIdForSheet()
            try JsonFileUtil.write(content: ficha)
        } catch {
            print("UNABLE TO CREATE A NEW ID TO SHEET: \(error.localizedDescription)")
        }
        fetch()
    }
}
