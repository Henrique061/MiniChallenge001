//
//  ClasseFinalConcreteBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 04/10/22.
//

import Foundation

public class ClasseFinalConcreteBuilder : ClasseFinalBuilder {
    private var classeFinal = ClasseFinal()
    
    //MARK: RESET
    func resetBuilder() {
        classeFinal = ClasseFinal()
    }
    
    //MARK: CLASSE
    func setTipoClasse(_ classe: ClassePersonagem) {
        self.classeFinal.tipoClasse = classe
    }
    
    //MARK: CARACTERISTICAS
    func setCaracteristicasClasse(_ caracteristicas: [CaracteristicaJSON]) {
        self.classeFinal.caracteristicasClasse = caracteristicas
    }
    
    //MARK: SUBCLASSE
    func setSubClasses(_ subclasses: [SubClasse]) {
        self.classeFinal.subClasses = subclasses
    }
    
    //MARK: DADO VIDA
    func setDadoVida(_ dadoVida: String) {
        self.classeFinal.dadoVida = dadoVida
    }
    
    //MARK: VIDA INICIAL
    func setVidaInicial(_ vida: Int) {
        self.classeFinal.vidaInicial = vida
    }
    
    //MARK: VIDAS SEGUINTES
    func setVidasSeguintes(_ vidasSeguintes: String) {
        self.classeFinal.vidasSeguintes = vidasSeguintes
    }
    
    //MARK: RIQUEZA INICIAL
    func setRiquezaInicial(_ escolha: ClasseEscolhasDefinidas) {
        self.classeFinal.riquezaInicial = escolha.escolhaRiqueza
    }
    
    //MARK: POSSUI MAGIA
    func setPosusiMagia(_ possui: Bool) {
        self.classeFinal.possuiMagia = possui
    }
    
    //MARK: MAGIA SUBCLASSE
    func setMagiaSubclasse(_ possui: Bool) {
        self.classeFinal.magiaSubclasse = possui
    }
    
    //MARK: SUBCLASSE MAGIA
    func setSubclasseComMagia(_ subclasse: SubclassePersonagem) {
        self.classeFinal.subclasseComMagia = subclasse
    }
    
    //MARK: MAGIAS CONHECIDAS
    func setMagiasConhecidas(_ magiasConhecidas: [MagiasConhecidas]) {
        self.classeFinal.magiasConhecidas = magiasConhecidas
    }
    
    //MARK: ESPACOS DE MAGIA
    func setEspacosMagia(_ espacosMagia: [EspacosDeMagias]) {
        self.classeFinal.espacosMagia = espacosMagia
    }
    
    //MARK: PROF SALVAGUARDAS
    func setProfSalvaguardas(_ profSalvaguardas: [AtributosSalvaguarda]) {
        self.classeFinal.profSalvaguardas = profSalvaguardas
    }
    
    //MARK: PROF ARMAS
    func setProfArmas(_ profArmas: [ArmaJSON]) {
        self.classeFinal.profArmas = profArmas
    }
    
    //MARK: PROF ARMADURAS
    func setProfArmaduras(_ profArmaduras: [ArmaduraJSON]) {
        self.classeFinal.profArmaduras = profArmaduras
    }
    
    //MARK: PROF FERRAMENTAS
    func setProfFerramentas(_ profFerramentas: [FerramentaJSON], _ escolha: ClasseEscolhasDefinidas) {
        if !profFerramentas.isEmpty {
            self.classeFinal.profFerramentas = profFerramentas
        }
        else {
            self.classeFinal.profFerramentas = escolha.escolhaProfFerramentas
        }
    }
    
    //MARK: PROF PERICIAS
    func setProfPericias(_ escolha: ClasseEscolhasDefinidas) {
        self.classeFinal.profPericias = escolha.escolhaProfPericias
    }
    
    //MARK: PONTOS NUMERICOS
    func setPontosEspecificosNumerico(_ pontos: [PontoEspecificoNumerico]) {
        self.classeFinal.pontosEspecificosNumerico = pontos
    }
    
    //MARK: PONTOS TEXTO
    func setPontosEspecificosTexto(_ pontos: [PontoEspecificoTexto]) {
        self.classeFinal.pontosEspecificosTexto = pontos
    }
    
    //MARK: ARMAS INICIAIS
    func setArmasIniciais(_ armas: [ArmaJSON]) {
        self.classeFinal.armasIniciais = armas
    }
    
    //MARK: ARMADURAS INICIAIS
    func setArmadurasIniciais(_ armaduras: [ArmaduraJSON]) {
        self.classeFinal.armadurasIniciais = armaduras
    }
    
    //MARK: EQUIPAMENTOS INICIAIS
    func setEquipamentosIniciais(_ equipamentos: [EquipamentoJSON]) {
        self.classeFinal.equipamentosIniciais = equipamentos
    }
    
    //MARK: FERRAMENTAS INICIAIS
    func setFerramentasIniciais(_ ferramentas: [FerramentaJSON]) {
        self.classeFinal.ferramentasIniciais = ferramentas
    }
    
    //MARK: PACOTES INICIAIS
    func setPacotesIniciais(_ pacotes: [PacoteEquipamento]) {
        self.classeFinal.pacotesIniciais = pacotes
    }
    
    //MARK: GET CLASSE
    func getClasseFinal() -> ClasseFinal {
        let buildedClasse = self.classeFinal
        self.resetBuilder()
        return buildedClasse
    }
    
    
}
