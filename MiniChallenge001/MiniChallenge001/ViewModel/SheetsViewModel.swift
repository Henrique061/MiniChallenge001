//
//  PersonagemViewModel.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 26/09/22.
//

import Foundation
import SwiftUI

public class SheetsViewModel: ObservableObject {
    
    @Published public var listaFichas: [PersonagemFicha] = []
    @Published public var fichaSelecionada: PersonagemFicha
    
    public var maximoDadoVida: Int {
        return self.fichaSelecionada.nivel
    }
    
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
    
    public func setVidaMaxima(value: Int) {
        DispatchQueue.main.async {
            if (self.fichaSelecionada.pontosVidaMaximo + value) < 0 {
                return
            }
            self.fichaSelecionada.pontosVidaMaximo += value
        }
    }
    
    public func setNivel(value: Int) {
        DispatchQueue.main.async {
            if (self.fichaSelecionada.nivel + value) > 20 || (self.fichaSelecionada.nivel + value) < 0 {
                return
            }
            self.fichaSelecionada.nivel += value
        }
    }
    
    public func setPontosVida(value: Int) {
        DispatchQueue.main.async {
            if (self.fichaSelecionada.pontosVida + value) < 0 || (self.fichaSelecionada.pontosVida + value) > self.fichaSelecionada.pontosVidaMaximo {
                return
            }
            
            self.fichaSelecionada.pontosVida += value
        }
    }
    
    public func setDadosVida(value: Int) {
        DispatchQueue.main.async {
            if (self.fichaSelecionada.quantiaDadoVida + value) > self.maximoDadoVida || (self.fichaSelecionada.quantiaDadoVida + value) < 0 {
                return
            }
            self.fichaSelecionada.quantiaDadoVida += value
        }
    }
    
    public func setPontosVidaTemp(value: Int) {
        DispatchQueue.main.async {
            if (self.fichaSelecionada.pontosVidaTemporário + value) < 0 {
                return
            }
            
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
    
    public func filterMagiasByLevel(nivel: Int) -> [MagiaJSON] {
        let filteredMagias = self.fichaSelecionada.magias.filter({$0.nivel == nivel})
        return filteredMagias.sorted(by: {$0.nome < $1.nome})
    }
    
    public func removeMagia(magia: MagiaJSON) {
        DispatchQueue.main.async {
            self.fichaSelecionada.magias.removeAll(where: {$0.id == magia.id})
        }
    }
    
    public func saveFicha() -> Bool {
        if self.fichaSelecionada.id == 0 { return true }
        do {
            try JsonFileUtil.write(content: self.fichaSelecionada)
            
            for i in 0..<self.listaFichas.count {
                if listaFichas[i].id == fichaSelecionada.id {
                    listaFichas[i] = fichaSelecionada
                }
            }
            return true
        } catch {
            return false
        }
    }
    
}
