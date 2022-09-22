//
//  ClasseBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 22/09/22.
//

import Foundation

protocol ClasseBuilder {
    func resetBuilder()
    
    func setClasse(classe: ClassePersonagem)
    func getClassePersonagem() -> ClassePersonagem
    func setNomeClasse()
    
    func setCaracteristicasClasse(_ caracteristicas: [String])
    func setSubClasses(_ subClasses: [SubClasse])
    func setDadoVida(_ dado: String)
    
    func setProfSalvaguarda(_ atributos: [AtributosSalvaguarda])
    func setProfArmas(_ armas: [ArmaJSON])
    func setProfArmaduras(_ armaduras: [ArmaduraJSON])
    func setProfFerramentas(_ ferramentas: [FerramentaJSON])
    
    func setArmasIniciais(_ armas: [ArmaJSON])
    func setArmadurasIniciais(_ armaduras: [ArmaduraJSON])
    func setEquipamentosIniciais(_ equipamentos: [EquipamentoJSON])
    func setFerramentasIniciais(_ ferramentas: [FerramentaJSON])
    
    func setProfPericias(_ pericias: [String])
    func setPossuiMagias(_ possuiMagia: Bool)
    func setMagiasConhecidas(_ magiasConhecidas: [MagiasConhecidas])
    func setEspacosDeMagia(_ espacosMagias: [EspacosDeMagias])
    func setPontosEspecificosNumericos(_ pontoNumerico: [PontoEspecificoNumerico])
    func setPontosEspecificosTexto(_ pontoTexto: [PontoEspecificoTexto])
    func setRiquezaInicial(_ riqueza: Int)
}
