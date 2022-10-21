//
//  ViewModel.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 14/09/22.
//

import Foundation
import SwiftUI

public class MagiasViewModel: ObservableObject {
    
    @Published public var magias: [MagiaJSON] = []
    @Published public var filtroNivel: Int
    @Published public var filtroClasse: ClassePersonagem
    @Published public var searchText: String
    
    public var filteredMagias: [[MagiaJSON]] {
        var temp: [[MagiaJSON]] = []
        
        if self.filtroClasse == .none && self.filtroNivel == -1 {
            if self.searchText.isEmpty {
                for i in 0..<10 {
                    let aux = self.magias.filter({$0.nivel == i}).sorted(by: {$0.nome < $1.nome})
                    if !aux.isEmpty { temp.append(aux) }
                }
            } else {
                for i in 0..<10 {
                    let aux = self.magias.filter({$0.nivel == i && $0.nome.contains(self.searchText)}).sorted(by: {$0.nome < $1.nome})
                    if !aux.isEmpty { temp.append(aux) }
                }
            }
        }
        
        if self.filtroClasse == .none && self.filtroNivel > -1 {
            if self.searchText.isEmpty {
                let aux = self.magias.filter({$0.nivel == self.filtroNivel}).sorted(by: {$0.nome < $1.nome})
                if !aux.isEmpty { temp.append(aux) }
            } else {
                let aux = self.magias.filter({$0.nivel == self.filtroNivel && $0.nome.contains(self.searchText)}).sorted(by: {$0.nome < $1.nome})
                if !aux.isEmpty { temp.append(aux) }
            }
        }
        
        if self.filtroNivel == -1 && self.filtroClasse != .none {
            if self.searchText.isEmpty {
                for i in 0..<10 {
                    let aux = self.magias.filter({$0.nivel == i && $0.classes.contains(self.filtroClasse)})
                    if !aux.isEmpty { temp.append(aux.sorted(by: {$0.nome < $1.nome})) }
                }
            } else {
                for i in 0..<10 {
                    let aux = self.magias.filter({$0.nivel == i && $0.classes.contains(self.filtroClasse) && $0.nome.contains(self.searchText)})
                    if !aux.isEmpty { temp.append(aux.sorted(by: {$0.nome < $1.nome})) }
                }
            }
        }
        
        if self.filtroClasse != .none && self.filtroNivel > -1 {
            if self.searchText.isEmpty {
                let aux = self.magias.filter({$0.nivel == self.filtroNivel && $0.classes.contains(self.filtroClasse)})
                if !aux.isEmpty { temp.append(aux.sorted(by: {$0.nome < $1.nome})) }
            } else {
                let aux = self.magias.filter({$0.nivel == self.filtroNivel && $0.classes.contains(self.filtroClasse) && $0.nome.contains(self.searchText)})
                if !aux.isEmpty { temp.append(aux.sorted(by: {$0.nome < $1.nome})) }
            }
        }
        
        return temp
    }
    
    public init(nivel: Int = -1, classe: ClassePersonagem = .none) {
        self.filtroNivel = nivel
        self.filtroClasse = classe
        self.searchText = ""
        fetchMagias()
    }
    
    public func fetchMagias() {
        if let arr = JsonFileUtil.getDataFromBundle(folder: .magia, decoder: MagiaJSON.self) as? [MagiaJSON] {
            self.magias = arr
        }
    }
    
    public func resetFilters(classe: ClassePersonagem) {
        DispatchQueue.main.async {
            self.filtroClasse = classe
            self.filtroNivel = -1
        }
    }
}
