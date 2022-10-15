//
//  RacaFinalBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 29/09/22.
//

import Foundation

protocol RacaFinalBuilder {
    func resetBuilder()
    
    func setRaca(_ raca: TipoRaca)
    func setSubraca(_ subraca: TipoSubRaca)
    func setAtributosAdicionais(_ atributosGanhos: [AtributosGanhosRaca], _ escolhas: RacaEscolhasDefinidas)
    func setDeslocamento(_ deslocamento: Float)
    func setIdiomas(_ idiomas: [IdiomaAlfabeto], _ escolhas: RacaEscolhasDefinidas)
    func setTracos(_ tracos: [TraitJSON])
    func setProfArmas(_ profArmas: [ArmaJSON])
    func setProfArmaduras(_ profArmaduras: [ArmaduraJSON])
    func setProfFerramentas(_ profFerramentas: [FerramentaJSON], _ escolhas: RacaEscolhasDefinidas)
    func setProfPericias(_ profPericias: [Pericia], _ escolhas: RacaEscolhasDefinidas)
    func setMagiasRecebidas(_ magias: [MagiaJSON], _ escolhas: RacaEscolhasDefinidas)
}
