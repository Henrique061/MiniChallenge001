//
//  AtributosUtils.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 19/10/22.
//

import Foundation

public class AtributosUtils {
    public static func possuiProficiencia(atributosProficientes: [AtributosSalvaguarda], atributoAvaliado: AtributosSalvaguarda) -> Bool {
        return atributosProficientes.contains(atributoAvaliado)
    }
    
    public static func pontosProficiencia(ficha: PersonagemFicha) -> Int {
        switch ficha.nivel {
        case 1...4:
            return 2
        case 5...8:
            return 3
        case 9...12:
            return 4
        case 13...16:
            return 5
        case 17...20:
            return 6
        default:
            return 0
        }
    }
    
    public static func adicaoBonusProficiencia(ficha: PersonagemFicha, atributo: Atributo, hasProf: Bool) -> Int {
        if hasProf {
            return atributo.modificador + pontosProficiencia(ficha: ficha)
        } else {
            return atributo.modificador
        }
    }
    
    public static func adicaoSinalTexto(valor: Int) -> String {
        return valor < 0 ? "\(valor)" : "+\(valor)"
    }
    
    public static func valorProfPericia(pericia: Pericia, hasProf: Bool, ficha: PersonagemFicha) -> String {
        
        let profValor: Int = hasProf ? pontosProficiencia(ficha: ficha) : 0
        
        switch pericia.rawValue {
        case let str where str.contains("FOR"):
            return adicaoSinalTexto(valor: ficha.pontosAtributos.forca.modificador + profValor)
        case let str where str.contains("DES"):
            return adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador + profValor)
        case let str where str.contains("CON"):
            return adicaoSinalTexto(valor: ficha.pontosAtributos.constituicao.modificador + profValor)
        case let str where str.contains("INT"):
            return adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador + profValor)
        case let str where str.contains("SAB"):
            return adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador + profValor)
        case let str where str.contains("CAR"):
            return adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador + profValor)
        default:
            return ""
        }
        
//        switch pericia {
//        case .acrobacia:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador + profValor)
//
//        case .adestrarAnimais:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador + profValor)
//
//        case .arcanismo:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador + profValor)
//
//        case .atletismo:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.forca.modificador + profValor)
//
//        case .atuacao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador + profValor)
//
//        case .enganacao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador + profValor)
//
//        case .furtividade:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador + profValor)
//
//        case .historia:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador + profValor)
//
//        case .intimidacao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador + profValor)
//
//        case .intuicao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador + profValor)
//
//        case .investigacao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador + profValor)
//
//        case .medicina:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador + profValor)
//
//        case .natureza:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador + profValor)
//
//        case .percepcao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador + profValor)
//
//        case .persuasao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador + profValor)
//
//        case .prestidigitacao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador + profValor)
//
//        case .religiao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador + profValor)
//
//        case .sobrevivencia:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador + profValor)
//
//        default:
//            return "none achado"
//        }
    }
    
    public static func valorPericia(ficha: PersonagemFicha, pericia: Pericia) -> String {
        switch pericia.rawValue {
        case let str where str.contains("FOR"):
            return adicaoSinalTexto(valor: ficha.pontosAtributos.forca.modificador)
        case let str where str.contains("DES"):
            return adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador)
        case let str where str.contains("CON"):
            return adicaoSinalTexto(valor: ficha.pontosAtributos.constituicao.modificador)
        case let str where str.contains("INT"):
            return adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador)
        case let str where str.contains("SAB"):
            return adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador)
        case let str where str.contains("CAR"):
            return adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador)
        default:
            return ""
        }
        
//        switch pericia {
//
//        case .acrobacia:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador)
//
//        case .adestrarAnimais:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador)
//
//        case .arcanismo:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador)
//
//        case .atletismo:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.forca.modificador)
//
//        case .atuacao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador)
//
//        case .enganacao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador)
//
//        case .furtividade:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador)
//
//        case .historia:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador)
//
//        case .intimidacao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador)
//
//        case .intuicao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador)
//
//        case .investigacao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador)
//
//        case .medicina:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador)
//
//        case .natureza:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador)
//            
//        case .percepcao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador)
//
//        case .persuasao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador)
//
//        case .prestidigitacao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador)
//
//        case .religiao:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador)
//
//        case .sobrevivencia:
//            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador)
//
//        default:
//            return "none achado"
//        }
    }
}
