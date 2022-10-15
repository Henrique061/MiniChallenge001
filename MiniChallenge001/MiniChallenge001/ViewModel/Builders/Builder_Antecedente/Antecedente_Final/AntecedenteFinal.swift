//
//  AntecedenteFinal.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 14/10/22.
//

import Foundation

public struct AntecedenteEscolhasDefinidas : Codable {
    var escolhaProfFerramenta: [FerramentaJSON] = []
    var escolhaIdiomas: [IdiomaAlfabeto] = []
    
    var escolhaEquipamentosIniciais: [EquipamentoJSON] = []
    var escolhaFerramentasIniciais: [FerramentaJSON] = []
}

public class AntecedenteFinal : Codable {
    //MARK: TIPO
    var tipoAntecedente: AntecedentePersonagem = .none
    var tipoVarianteAntecedente: VariacaoAntecedente = .none
    
    //MARK: PROFICIENCIAS
    var profPericias: [Pericia] = []
    var profFerramentas: [FerramentaJSON] = []
    
    //MARK: IDIOMA
    var idiomas: [IdiomaAlfabeto] = []
    
    //MARK: EQUIPS INICIAIS
    var armasIniciais: [ArmaJSON] = []
    var equipamentosIniciais: [EquipamentoJSON] = []
    var ferramentasIniciais: [FerramentaJSON] = []
    var dinheiroInicial: Moeda = Moeda(quantidade: 0, tipo: .none)
}
