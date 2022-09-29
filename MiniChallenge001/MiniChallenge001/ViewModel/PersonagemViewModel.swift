//
//  PersonagemViewModel.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 26/09/22.
//

import Foundation

class PersonagemViewModel: ObservableObject {
    
    @Published var listaFichas: [PersonagemFicha] = []
    
    public init() {
        fetch()
    }
    
    public func fetch() {
        DispatchQueue.main.async {
            do {
                self.listaFichas = try JsonFileUtil.getAllSheets()
            } catch {
                print("FAILED TO FETCH SHEETS: \(error.localizedDescription)")
            }
        }
    }
    
    public func delete(at offsets: IndexSet) {
        DispatchQueue.main.async {
            do {
                let ficha = offsets.map({self.listaFichas[$0]})[0]
                try JsonFileUtil.delete(content: ficha)
                self.fetch()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    public func createNewFicha(ficha: PersonagemFicha) {
        DispatchQueue.main.async {
            do {
                ficha.id = try JsonFileUtil.getNewIdForSheet()
                try JsonFileUtil.write(content: ficha)
            } catch {
                print("UNABLE TO CREATE A NEW ID TO SHEET: \(error.localizedDescription)")
            }
            self.fetch()
        }
    }
}
