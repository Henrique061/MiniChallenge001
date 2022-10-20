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
    
    case none = "Nenhum"
}


//MARK: Enum SubRaca
public enum TipoSubRaca : String, Codable, CaseIterable, Hashable {
    case anaoColina = "Anão da Colina"
    case anaoMontanha = "Anão da Montanha"
    case altoElfo = "Alto Elfo"
    case elfoFloresta = "Elfo da Floresta"
    case elfoNegro = "Elfo Negro"
    case halflingPesLeves = "Pés Leves"
    case halflingRobusto = "Robusto"
    case gnomoFloresta = "Gnomo da Floresta"
    case gnomoRochas = "Gnomo das Rochas"
    
    case none = "Nenhum"
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
    
    case none = "Nenhum"
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
public struct IdiomaAlfabeto : Codable, Hashable {
    var idioma: Idioma = .none
    var alfabeto: Alfabeto = .none
    var isPadrao: Bool = true
}

//MARK: AtributosGanhos
public struct AtributosGanhosRaca : Codable, Hashable {
    var atributo: AtributosSalvaguarda = .none
    var pontosGanhos: Int = 0
}

public struct ProficienciaArmasPorSubraca : Codable {
    var subraca: TipoSubRaca = .none
    var armasProficientes: [ArmaJSON] = []
}

public struct ProficienciaFerramentaPorSubraca : Codable {
    var subraca: TipoSubRaca = .none
    var ferramentasProficientes: [FerramentaJSON] = []
}

public struct ProficienciaArmaduraPorSubraca : Codable {
    var subraca: TipoSubRaca = .none
    var armadurasProficientes: [ArmaduraJSON] = []
}

public struct ProficienciaPericiaPorSubraca : Codable {
    var subraca: TipoSubRaca = .none
    var periciasProficientes: [Pericia] = []
}

public struct MagiaSubraca : Codable {
    var subraca: TipoSubRaca = .none
    var magias: [MagiaJSON] = []
}

public struct MagiaEscolhaSubraca : Codable {
    var subraca: TipoSubRaca = .none
    var magias: [String] = []
}

public struct DeslocamentoSubraca : Codable {
    var subraca: TipoSubRaca = .none
    var deslocamento: Float = 0;
}

//MARK: RACA ESCOLHA
public class RacaEscolha {
    var tipoRaca: TipoRaca = .none
    var nomeRaca: String = ""
    var possuiSubRaca: Bool = false
    var subRacas: [Subraca] = []
    var atributosGanhos: [AtributosGanhosRaca] = []
    var possuiEscolhaAtributo: Bool = false
    var escolhasAtributo: [AtributosSalvaguarda] = []
    var numEscolhaDeAtributos: Int = 0
    var valorGanhoEscolhaAtributos: Int = 0
    var deslocamento: Float = 0
    var deslocamentoSubraca: [DeslocamentoSubraca] = []
    var idiomas: [IdiomaAlfabeto] = []
    var possuiEscolhaIdioma: Bool = false
    var subracaPossuiEscolhaIdioma: Bool = false
    var subracaComEscolhaDeIdioma: TipoSubRaca = .none
    var escolhaIdioma: [Idioma] = []
    var tracos: [TraitJSON] = [] // colocar json traits aqui
    var profArmas: [ArmaJSON] = []
    var subracaProfArma: [ProficienciaArmasPorSubraca] = []
    var profFerramentas: [FerramentaJSON] = []
    var subracaProfFerramenta: [ProficienciaFerramentaPorSubraca] = []
    var profArmaduras: [ArmaduraJSON] = []
    var subracaProfArmaduras: [ProficienciaArmaduraPorSubraca] = []
    var profPericias: [Pericia] = []
    var possuiEscolhaProfFerramentas: Bool = false
    var escolhasProfFerramentas: [String] = []
    var possuiEscolhaProfPericias: Bool = false
    var escolhasProfPericias: [Pericia] = []
    var quantiaEscolhaPericia: Int = 0
    var magiasRecebidas: [MagiaJSON] = []
    var magiasPorSubraca: MagiaSubraca = MagiaSubraca()
    var subracaEscolhaMagias: MagiaEscolhaSubraca = MagiaEscolhaSubraca()
}

//MARK: SUBRACA
public struct Subraca : Codable, Hashable {
    var subraca: TipoSubRaca
    var subracaNome: String
    var tracosSubraca: [TraitJSON]// colocar json traits aqui
    var atributoGanho: AtributosGanhosRaca
    
    init () {
        self.subraca = .none
        self.subracaNome = ""
        self.tracosSubraca = []
        self.atributoGanho = AtributosGanhosRaca(atributo: .none, pontosGanhos: 0)
    }
    
    init (subraca: TipoSubRaca, tracos: [TraitJSON], atributoGanho: AtributosGanhosRaca) {
        self.subraca = subraca
        self.subracaNome = subraca.rawValue
        self.tracosSubraca = tracos
        self.atributoGanho = atributoGanho
    }
}
