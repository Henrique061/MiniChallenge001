//
//  RacaBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 25/09/22.
//

import Foundation

protocol RacaBuilder {
    func resetBuilder()
    
    func setRaca(_ raca: TipoRaca)
    func getRaca() -> TipoRaca
    func setNomeRaca()
    
    func setPossuiSubraca(_ possui: Bool)
    func setSubRacas(_ subracas: [Subraca])
    func setAtributosGanhos(_ atributos: [AtributosGanhosRaca])
    func setPossuiEscolhaAtributo(_ possui: Bool)
    func setEscolhasAtributos(_ atributos: [AtributosSalvaguarda])
    func numEscolhasAtributos(_ num: Int)
    func valorGanhoEscolhaAtributos(_ valor: Int)
    func setDeslocamento(_ deslocamento: Float)
    func setDeslocamentoSubraca(_ deslocamentos: [DeslocamentoSubraca])
    func setIdiomas(_ idiomas: [IdiomaAlfabeto])
    func setPossuiEscolhaIdioma(_ possui: Bool)
    func setSubracaPossuiEscolhaIdioma(_ possui: Bool)
    func setSubracaComEscolhaIdioma(_ subraca: TipoSubRaca)
    func setEscolhaIdioma(_ idiomas: [Idioma])
    func setTracos(tracos: [TraitJSON])
    
    func setProfArmas(_ armas: [ArmaJSON])
    func setSubracaProfArma(_ profSubraca: [ProficienciaArmasPorSubraca])
    func setProfFerramentas(_ ferramentas: [FerramentaJSON])
    func setSubracaProfFerramenta(_ profSubaraca: [ProficienciaFerramentaPorSubraca])
    func setProArmaduras(_ armaduras: [ArmaduraJSON])
    func setSubracaProfArmadura(_ profSubaraca: [ProficienciaArmaduraPorSubraca])
    func setProfPericias(_ pericias: [Pericia])
    func setSubracaProfPericia(_ profSubaraca: [ProficienciaPericiaPorSubraca])
    
    func setPossuiEscolhaProfFerramentas(_ possui: Bool)
    func setEscolhasProfFerramentas(_ ferramentas: [String])
    func setPossuiEscolhaProfPericias(_ possui: Bool)
    func setEscolhasProfPericias(_ pericias: [Pericia])
    func setQuantiaEscolhaPericia(_ quantia: Int)
    
    func setMagiasRecebidas(_ magias: [MagiaJSON])
    func setMagiasPorSubraca(_ magiaSubraca: MagiaSubraca)
    func setSubracaEscolhaMagias(_ magias: MagiaEscolhaSubraca)
}
