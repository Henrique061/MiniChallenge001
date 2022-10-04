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
    
    func setCaracteristicasClasse(_ caracteristicas: [CaracteristicaJSON])
    func setSubClasses(_ subClasses: [SubClasseEscolha])
    func setDadoVida(_ dado: String)
    
    func setVidaInicial(_ vida: Int)
    func setVidasSeguintes(_ vidaSeguinte: String)
    func setRiquezaInicial(_ riqueza: String)
    
    func setProfSalvaguarda(_ atributos: [AtributosSalvaguarda])
    func setProfArmas(_ armas: [ArmaJSON])
    func setProfArmaduras(_ armaduras: [ArmaduraJSON])
    func setProfFerramentas(_ ferramentas: [FerramentaJSON])
    func setEscolhasProficienciaFerramenta(_ escolhas: [EscolhaOpcao])
    
    func setOpcoes(opcoes: [OpcaoEquipamento])
    func setArmasIniciais(armas: [ArmaJSON])
    func setArmadurasIniciais(armaduras: [ArmaduraJSON])
    func setEquipamentosIniciais(equipamentos: [EquipamentoJSON])
    func setFerramentasIniciais(ferramentas: [FerramentaJSON])
    func setPacotesIniciais(pacotes: [PacoteEquipamento])
    
    func setProfPericias(_ pericias: [Pericia])
    func setQuantiaEscolhaProfPericia(_ quantia: Int)
    func setPossuiMagias(_ possuiMagia: Bool)
    func setMagiaApenasSubclasse(_ magiaDeSubclasse: Bool)
    func setSubclasseComMagia(_ subclasse: SubclassePersonagem)
    
    func setMagiasConhecidas(_ magiasConhecidas: [MagiasConhecidas])
    func setEspacosDeMagia(_ espacosMagias: [EspacosDeMagias])
    func setPontosEspecificosNumericos(_ pontoNumerico: [PontoEspecificoNumerico])
    func setPontosEspecificosTexto(_ pontoTexto: [PontoEspecificoTexto])
}
