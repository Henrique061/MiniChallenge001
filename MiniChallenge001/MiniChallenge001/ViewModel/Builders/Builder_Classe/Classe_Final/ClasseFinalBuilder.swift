//
//  ClasseFinalBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 04/10/22.
//

import Foundation

protocol ClasseFinalBuilder {
    func resetBuilder()
    
    //MARK: CLASSE, VIDA E DINDIN
    func setTipoClasse(_ classe: ClassePersonagem)
    func setCaracteristicasClasse(_ caracteristicas: [CaracteristicaJSON])
    func setSubClasses(_ subclasses: [SubClasse])
    func setDadoVida(_ dadoVida: String)
    func setVidaInicial(_ vida: Int)
    func setVidasSeguintes(_ vidasSeguintes: String)
    func setRiquezaInicial(_ escolha: ClasseEscolhasDefinidas)
    
    //MARK: MAGIAS
    func setPosusiMagia(_ possui: Bool)
    func setMagiaSubclasse(_ possui: Bool)
    func setSubclasseComMagia(_ subclasse: SubclassePersonagem)
    func setMagiasConhecidas(_ magiasConhecidas: [MagiasConhecidas])
    func setEspacosMagia(_ espacosMagia: [EspacosDeMagias])
    
    //MARK: PROFICIENCIAS
    func setProfSalvaguardas(_ profSalvaguardas: [AtributosSalvaguarda])
    func setProfArmas(_ profArmas: [ArmaJSON])
    func setProfArmaduras(_ profArmaduras: [ArmaduraJSON])
    func setProfFerramentas(_ profFerramentas: [FerramentaJSON], _ escolha: ClasseEscolhasDefinidas)
    func setProfPericias(_ escolha: ClasseEscolhasDefinidas)
    
    //MARK: EQUIP INICIAIS
    func setArmasIniciais(_ armas: [ArmaJSON])
    func setArmadurasIniciais(_ armaduras: [ArmaduraJSON])
    func setEquipamentosIniciais(_ equipamentos: [EquipamentoJSON])
    func setFerramentasIniciais(_ ferramentas: [FerramentaJSON])
    func setPacotesIniciais(_ pacotes: [PacoteEquipamento])
    
    //MARK: ESPECIFICOS
    func setPontosEspecificosNumerico(_ pontos: [PontoEspecificoNumerico])
    func setPontosEspecificosTexto(_ pontos: [PontoEspecificoTexto])
}
