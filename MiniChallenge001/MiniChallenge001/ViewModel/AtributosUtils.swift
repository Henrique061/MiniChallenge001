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
        var profValor: Int
        
        if ficha.nivel <= 4 {
            profValor = 2
        }
        
        else if ficha.nivel > 4 && ficha.nivel <= 8 {
            profValor = 3
        }
        
        else if ficha.nivel > 8 && ficha.nivel <= 12 {
            profValor = 4
        }
        
        else if ficha.nivel > 12 && ficha.nivel <= 16 {
            profValor = 5
        }
        
        else {
            profValor = 6
        }
        
        return profValor
    }
    
    public static func adicaoBonusProficiencia(ficha: PersonagemFicha, atributo: Atributo, hasProf: Bool) -> Int {
        var profValor: Int = 0
        
        if hasProf {
            if ficha.nivel <= 4 {
                profValor = 2
            }
            
            else if ficha.nivel > 4 && ficha.nivel <= 8 {
                profValor = 3
            }
            
            else if ficha.nivel > 8 && ficha.nivel <= 12 {
                profValor = 4
            }
            
            else if ficha.nivel > 12 && ficha.nivel <= 16 {
                profValor = 5
            }
            
            else {
                profValor = 6
            }
        }
        
        let valorTotal: Int = atributo.modificador + profValor
        
        return valorTotal
    }
    
    public static func adicaoSinalTexto(valor: Int) -> String {
        if valor >= 0 {
            return "+\(valor)"
        } else {
            return "\(valor)"
        }
    }
    
    public static func valorProfPericia(pericia: Pericia, hasProf: Bool, ficha: PersonagemFicha) -> String {
        var profValor: Int = 0
        
        if hasProf {
            if ficha.nivel <= 4 {
                profValor = 2
            }
            
            else if ficha.nivel > 4 && ficha.nivel <= 8 {
                profValor = 3
            }
            
            else if ficha.nivel > 8 && ficha.nivel <= 12 {
                profValor = 4
            }
            
            else if ficha.nivel > 12 && ficha.nivel <= 16 {
                profValor = 5
            }
            
            else {
                profValor = 6
            }
        }
        
        switch pericia {
        case .acrobacia:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador + profValor)
            
        case .adestrarAnimais:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador + profValor)
            
        case .arcanismo:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador + profValor)
            
        case .atletismo:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.forca.modificador + profValor)
            
        case .atuacao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador + profValor)
            
        case .enganacao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador + profValor)
            
        case .furtividade:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador + profValor)
            
        case .historia:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador + profValor)
            
        case .intimidacao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador + profValor)
            
        case .intuicao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador + profValor)
            
        case .investigacao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador + profValor)
            
        case .medicina:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador + profValor)
            
        case .natureza:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador + profValor)
            
        case .percepcao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador + profValor)
            
        case .persuasao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador + profValor)
            
        case .prestidigitacao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador + profValor)
            
        case .religiao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador + profValor)
            
        case .sobrevivencia:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador + profValor)
            
        default:
            return "none achado"
        }
    }
    
    public static func valorPericia(ficha: PersonagemFicha, pericia: Pericia) -> String {
        switch pericia {
        case .acrobacia:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador)
            
        case .adestrarAnimais:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador)
            
        case .arcanismo:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador)
            
        case .atletismo:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.forca.modificador)
            
        case .atuacao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador)
            
        case .enganacao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador)
            
        case .furtividade:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador)
            
        case .historia:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador)
            
        case .intimidacao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador)
            
        case .intuicao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador)
            
        case .investigacao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador)
            
        case .medicina:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador)
            
        case .natureza:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador)
            
        case .percepcao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador)
            
        case .persuasao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.carisma.modificador)
            
        case .prestidigitacao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.destreza.modificador)
            
        case .religiao:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.inteligencia.modificador)
            
        case .sobrevivencia:
            return AtributosUtils.adicaoSinalTexto(valor: ficha.pontosAtributos.sabedoria.modificador)
            
        default:
            return "none achado"
        }
    }
}
