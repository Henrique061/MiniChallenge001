//
//  PersonagemViewModel.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 26/09/22.
//

import Foundation

class SheetsViewModel: ObservableObject {
    
    @Published public var listaFichas: [PersonagemFicha] = []
    @Published public var fichaSelecionada: PersonagemFicha
    
    public init() {
        self.fichaSelecionada = PersonagemFicha()
        self.fetch()
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
    
    public func setSelectedFicha(ficha: PersonagemFicha) {
        DispatchQueue.main.async {
            self.fichaSelecionada = ficha
        }
    }
    
    public func setPontosVida(value: Int) {
        DispatchQueue.main.async {
            self.fichaSelecionada.pontosVida += value
        }
    }
    
    public func setDadosVida(value: Int) {
        DispatchQueue.main.async {
            self.fichaSelecionada.quantiaDadoVida += value
        }
    }
    
    public func setPontosVidaTemp(value: Int) {
        DispatchQueue.main.async {
            self.fichaSelecionada.pontosVidaTemporário += value
        }
    }
    
    public func setResistenciaMorteSucesso() {
        DispatchQueue.main.async {
            if self.fichaSelecionada.resistenciaMorte.falha >= 3 || self.fichaSelecionada.resistenciaMorte.sucesso >= 3 {
                return
            }
            self.fichaSelecionada.resistenciaMorte.sucesso += 1
        }
    }
    
    public func setResistenciaMorteFalha() {
        DispatchQueue.main.async {
            if self.fichaSelecionada.resistenciaMorte.falha >= 3 || self.fichaSelecionada.resistenciaMorte.sucesso >= 3 {
                return
            }
            self.fichaSelecionada.resistenciaMorte.falha += 1
        }
    }
    
    public func resetResistenciaMorte() {
        DispatchQueue.main.async {
            self.fichaSelecionada.resistenciaMorte = ResistenciaMorte(sucesso: 0, falha: 0)
        }
    }
}
