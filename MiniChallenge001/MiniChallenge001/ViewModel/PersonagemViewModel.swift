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
    
    public func delete(ficha: PersonagemFicha) {
        do {
            try JsonFileUtil.delete(content: ficha)
            for i in 0..<listaFichas.count {
                if listaFichas[i].id == ficha.id {
                    listaFichas.remove(at: i)
                    break
                }
            }
            self.fetch()
        } catch {
            print(error.localizedDescription)
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
