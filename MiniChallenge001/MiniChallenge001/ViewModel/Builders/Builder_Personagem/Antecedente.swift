//
//  Antecedente.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 21/09/22.
//

import Foundation

//MARK: Enum Antecedentes
enum AntecedentePersonagem : String {
    case acolito = "Acólito"
    case artesaoGuia = "Artesão da Guia"
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
}

//MARK: Enum Variacao Antecedentes
enum VariacaoAntecedente : String {
    case AG_mercadorGuilda = "Mercador da Guilda"
    case AR_gladiador = "Gladiador"
    case CR_espiao = "Espião"
    case ER_outrosEremitas = "Outros Eremitas"
    case MA_pirata = "Pirata"
    case NO_cavaleiro = "Cavaleiro"
}

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
