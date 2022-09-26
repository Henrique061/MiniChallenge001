//
//  Antecedente.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 21/09/22.
//

import Foundation



//MARK: Antecedente
public class Antecedente {
    var antecedentePersonagem: AntecedentePersonagem
    var nomeAntecedente: String
    var profPericias: [String]
    var profFerramentas: [FerramentaJSON]?
    var idiomas: [Idioma]?
    var equipamentos: [EquipamentoJSON]
    var caracteristicaAntecedente: String
    var variacaoAntecedente: VariacaoAntecedente?
    var riquezaInicial: Int
    
    init (antecedente antecedentePersonagem: AntecedentePersonagem) {
        self.antecedentePersonagem = antecedentePersonagem
        self.nomeAntecedente = antecedentePersonagem.rawValue
        self.profPericias = []
        self.profFerramentas = nil
        self.idiomas = nil
        self.equipamentos = []
        self.caracteristicaAntecedente = ""
        self.variacaoAntecedente = nil
        self.riquezaInicial = 0
    }
}
