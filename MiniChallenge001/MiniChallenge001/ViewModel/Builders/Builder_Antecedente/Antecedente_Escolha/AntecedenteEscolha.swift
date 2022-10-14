//
//  AntecedenteEscolha.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 25/09/22.
//

import Foundation

//MARK: Enum Antecedentes
public enum AntecedentePersonagem : String, Codable, CaseIterable {
    case acolito = "Acólito"
    case artesaoGuilda = "Artesão de Guilda"
    case artista = "Artista"
    case charlatao = "Charlatão"
    case criminoso = "Criminoso"
    case eremita = "Eremita"
    case forasteiro = "Forasteiro"
    case heroiPovo = "Herói do Povo"
    case marinheiro = "Marinheiro"
    case nobre = "Nobre"
    case orfao = "Órfão"
    case sabio = "Sábio"
    case soldado = "Soldado"
    
    case none = "Nenhum"
}

//MARK: Enum Variacao Antecedentes
public enum VariacaoAntecedente : String, Codable {
    case AG_mercadorGuilda = "Mercador da Guilda"
    case AR_gladiador = "Gladiador"
    case CR_espiao = "Espião"
    case ER_outrosEremitas = "Outros Eremitas"
    case MA_pirata = "Pirata"
    case NO_cavaleiro = "Cavaleiro"
    
    case none = "Nenhum"
}

public class AntecedenteEscolha {
    var tipoAntecedente: AntecedentePersonagem = .none
    var nomeAntecente: String = ""
    var variacaoAntecedente: VariacaoAntecedente = .none
    var profPericias: [Pericia] = []
    var profFerramentas: [FerramentaJSON] = []
    
    var possuiEscolhaProfFerramentas: Bool = false
    var escolhaProfFerramentas: [String] = []
    
    var possuiEscolhaIdioma: Bool = false
    var quantiaEscolhaIdioma: Int = 0
    
    var equipamentosIniciais: [EquipamentoJSON] = []
    var ferramentasIniciais: [FerramentaJSON] = []
    var armasIniciais: [ArmaJSON] = []
    
    var possuiEscolhaEquipamentoInicial: Bool = false
    var escolhaEquipamentoInicial: [String] = []
    
    var possuiEscolhaFerramentaInicial: Bool = false
    var escolhaFerramentaInicial: [String] = []
    
    var dinheiroInicial: Moeda = Moeda()
}
