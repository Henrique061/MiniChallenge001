//
//  ViewModel.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 14/09/22.
//

import Foundation
import SwiftUI

class MagiasViewModel: ObservableObject {
    
    @Published var magias: [MagiaJSON] = []
    
    public init() {
        fetchMagias()
    }
    
    public func fetchMagias() {
        if let arr = JsonFileUtil.getDataFromBundle(folder: .magia, decoder: MagiaJSON.self) as? [MagiaJSON] {
            self.magias = arr
        }
    }
    
    public func filterMagiasByLevel(nivel: Int) -> [MagiaJSON] {
        let filteredMagias = magias.filter({$0.nivel == nivel})
        return filteredMagias
    }
    
    public func filterMagiaPerClass(classe: ClassePersonagem) {
        
    }
}
