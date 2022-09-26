//
//  RacaEscolha.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 25/09/22.
//

import Foundation
//MARK: Enum Raca
public enum TipoRaca : String, Codable, CaseIterable {
    case anao = "Anão"
    case elfo = "Elfo"
    case halfling = "Halflings"
    case humano = "Humano"
    case draconato = "Draconato"
    case gnomo = "Gnomos"
    case meioElfo = "Meio-Elfo"
    case meioOrc = "Meio-Orc"
    case tiefling = "Tiefling"
}


//MARK: Enum SubRaca
public enum TipoSubRaca : String, Codable, CaseIterable {
    case anaoColina = "Anão da Colina"
    case anaoMontanha = "Anão da Montanha"
    case altoElfo = "Alto Elfo"
    case elfoFloresta = "Elfo da Floresta"
    case elfoNegro = "Elfo Negro"
    case halflingPesLeves = "Pés Leves"
    case halflingRobusto = "Robusto"
    case gnomoFloresta = "Gnomo da Floresta"
    case gnomoRochas = "Gnomo das Rochas"
}


//MARK: ENUM Idioma
public enum Idioma: String, Codable, CaseIterable {
    case anao = "Anão"
    case comum = "Comum"
    case elfico = "Élfico"
    case gigante = "Gigante"
    case gnomico = "Gnômico"
    case goblin = "Goblin"
    case halfling = "Halfling"
    case orc = "Orc"
    
    case abissal = "Abissal"
    case celestial = "Celestial"
    case dialeto = "Dialeto Subterrâneo"
    case draconico = "Dracônico"
    case infernal = "Infernal"
    case primordial = "Primordial"
    case silvestre = "Silvestre"
    case subcomum = "Subcomum"
}

//MARK: Enum alfabeto
public enum Alfabeto : String, Codable {
    case anao = "Anão"
    case comum = "Comum"
    case elfico = "Élfico"
    case infernal = "Infernal"
    case celestial = "Celestial"
    case draconico = "Dracônico"
    case none = "Nenhum"
}

//MARK: Struct Idiomas
public struct IdiomaAlfabeto : Codable {
    var idioma: Idioma
    var alfabeto: Alfabeto
    var isPadrao: Bool
}

//MARK: AtributosGanhos
public struct AtributosGanhosRaca : Codable, Hashable {
    var atributo: AtributosSalvaguarda
    var pontosGanhos: Int
}

public struct ProficienciaArmasPorSubraca : Codable {
    var subraca: TipoSubRaca
    var armasProficientes: [ArmaJSON]
}

public struct ProficienciaFerramentaPorSubraca : Codable {
    var subraca: TipoSubRaca
    var armasProficientes: [FerramentaJSON]
}

public struct ProficienciaArmaduraPorSubraca : Codable {
    var subraca: TipoSubRaca
    var armasProficientes: [ArmaduraJSON]
}

public struct ProficienciaPericiaPorSubraca : Codable {
    var subraca: TipoSubRaca
    var armasProficientes: [Pericia]
}

public struct MagiaSubraca : Codable {
    var subraca: TipoSubRaca
    var magias: [MagiaJSON]
}

public struct MagiaEscolhaSubraca : Codable {
    var subraca: TipoSubRaca
    var magias: [String]
}

public struct DeslocamentoSubraca : Codable {
    var subraca: TipoSubRaca
    var deslocamento: Float
}

//MARK: RACA ESCOLHA
public class RacaEscolha {
    var tipoRaca: TipoRaca?
    var nomeRaca: String?
    var possuiSubRaca: Bool?
    var subRacas: [Subraca]?
    var atributosGanhos: [AtributosGanhosRaca]?
    var possuiEscolhaAtributo: Bool?
    var escolhasAtributo: [AtributosSalvaguarda]?
    var numEscolhaDeAtributos: Int?
    var valorGanhoEscolhaAtributos: Int?
    var deslocamento: Float?
    var deslocamentoSubraca: [DeslocamentoSubraca]?
    var idiomas: [IdiomaAlfabeto]?
    var possuiEscolhaIdioma: Bool?
    var subracaPossuiEscolhaIdioma: Bool?
    var subracaComEscolhaDeIdioma: TipoSubRaca?
    var escolhaIdioma: [Idioma]?
    var tracos: [TraitJSON]? // colocar json traits aqui
    var profArmas: [ArmaJSON]?
    var subracaProfArma: [ProficienciaArmasPorSubraca]?
    var profFerramentas: [FerramentaJSON]?
    var subracaProfFerramenta: [ProficienciaFerramentaPorSubraca]?
    var profArmaduras: [ArmaduraJSON]?
    var subracaProfArmaduras: [ProficienciaArmaduraPorSubraca]?
    var profPericias: [Pericia]?
    var subracaProfPericia: [ProficienciaPericiaPorSubraca]?
    var possuiEscolhaProfFerramentas: Bool?
    var escolhasProfFerramentas: [String]?
    var possuiEscolhaProfPericias: Bool?
    var escolhasProfPericias: [Pericia]?
    var quantiaEscolhaPericia: Int?
    var magiasRecebidas: [MagiaJSON]?
    var magiasPorSubraca: MagiaSubraca?
    var subracaEscolhaMagias: MagiaEscolhaSubraca?
}

//MARK: SUBRACA
public struct Subraca : Codable, Hashable {
    var subraca: TipoSubRaca
    var subracaNome: String
    var tracosSubraca: [TraitJSON] // colocar json traits aqui
    var atributoGanho: AtributosGanhosRaca
    
    init (subraca: TipoSubRaca, tracos: [TraitJSON], atributoGanho: AtributosGanhosRaca) {
        self.subraca = subraca
        self.subracaNome = subraca.rawValue
        self.tracosSubraca = tracos
        self.atributoGanho = atributoGanho
    }
}
