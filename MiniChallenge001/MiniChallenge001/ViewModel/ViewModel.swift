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
    
    public var filteredMagias: [[MagiaJSON]] {
        var temp: [[MagiaJSON]] = []
        
        if filtroClasse == .none && filtroNivel == -1 {
            for i in 0..<10 {
                temp.append(self.magias.filter({$0.nivel == i}).sorted(by: {$0.nome < $1.nome}))
            }
        }
        
        if filtroClasse == .none && filtroNivel > -1 {
            temp.append(self.magias.filter({$0.nivel == filtroNivel}).sorted(by: {$0.nome < $1.nome}))
        }
        
        if filtroNivel == -1 && filtroClasse != .none {
            for i in 0..<10 {
                let aux = self.magias.filter({$0.nivel == i && $0.classes.contains(filtroClasse)})
                if !aux.isEmpty { temp.append(aux.sorted(by: {$0.nome < $1.nome})) }
            }
        }
        
        if filtroClasse != .none && filtroNivel > -1 {
            let aux = self.magias.filter({$0.nivel == self.filtroNivel && $0.classes.contains(self.filtroClasse)})
            if !aux.isEmpty { temp.append(aux.sorted(by: {$0.nome < $1.nome})) }
        }
        
        return temp
    }
    
    public init(nivel: Int = -1, classe: ClassePersonagem = .none) {
        self.filtroNivel = nivel
        self.filtroClasse = classe
        
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
