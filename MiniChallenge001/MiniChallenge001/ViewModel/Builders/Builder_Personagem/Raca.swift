//
//  Raca.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 21/09/22.
//

import Foundation

//MARK: Enum Raca
enum TipoRaca : String {
    case anao = "Anão"
    case elfo = "Elfo"
    case halfling = "Halfling"
    case humano = "Humano"
    case draconato = "Draconato"
    case gnomo = "Gnomo"
    case meioElfo = "Meio-Elfo"
    case meioOrc = "Meio-Orc"
    case tiefling = "Tiefling"
}


//MARK: Enum SubRaca
enum TipoSubRaca : String {
    case anaoColina = "Anão da Colina"
    case anaoMontanha = "Anão da Montanha"
    case altoElfo = "Alto Elfo"
    case elfoFloresta = "Elfo da Floresta"
    case elfoNegro = "Elfo Negro"
    case halflingPesLeves = "Halfling Pés Leves"
    case halflingRobusto = "Halfling Robusto"
    case gnomoFloresta = "Gnomo da Floresta"
    case gnomoRochas = "Gnomo das Rochas"
}

//MARK: Enum alfabeto
enum Alfabeto : String {
    case anao = "Anão"
    case comum = "Comum"
    case elfico = "Élfico"
    case infernal = "Infernal"
    case celestial = "Celestial"
    case draconico = "Dracônico"
    case none = "Nenhum"
}

//MARK: Struct Idiomas
struct Idioma {
    var isPadrao: Bool
    var nomeIdioma: String
    var faladoPor: String
    var alfabeto: Alfabeto
}

//MARK: Classe Raca
public class Raca {
    var tipoRaca: TipoRaca
    var racaNome: String
    var deslocamento: Float
    var idiomas: [Idioma]
    var tracosRaca: [String] //MARK: trocar para skills json depois
    var profArmas: [ArmaJSON]?
    var profArmaduras: [ArmaduraJSON]?
    var profFerramentas: [FerramentaJSON]?
    var profPericias: [String]?
    
    init(tipoRaca: TipoRaca) {
        self.tipoRaca = tipoRaca
        self.racaNome = tipoRaca.rawValue
        self.deslocamento = 0
        self.idiomas = []
        self.tracosRaca = []
        self.profArmas = nil
        self.profArmaduras = nil
        self.profFerramentas = nil
        self.profPericias = nil
    }
}

//MARK: Classe SubRaca
public class SubRaca : Raca {
    var tipoSubRaca: TipoSubRaca //MARK: trocar para skills json depois
    var subracaNome: String
    var tracosSubraca: [String]
    
    init(tipoRaca: TipoRaca, tipoSubRaca: TipoSubRaca) {
        self.tipoSubRaca = tipoSubRaca
        self.subracaNome = tipoSubRaca.rawValue
        self.tracosSubraca = []
        super.init(tipoRaca: tipoRaca)
    }
}
