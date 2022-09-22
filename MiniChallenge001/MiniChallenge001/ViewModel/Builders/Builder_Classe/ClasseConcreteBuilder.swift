//
//  ClasseConcreteBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 22/09/22.
//

import Foundation

public class ClasseConcreteBuilder : ClasseBuilder {
    private var classe = ClasseEscolha()
    
    func resetBuilder() {
        classe = ClasseEscolha()
    }
    
    //MARK: CLASSE
    func setClasse(classe: ClassePersonagem) {
        self.classe.classePersonagem = classe
    }
    
    func getClassePersonagem() -> ClassePersonagem {
        return self.classe.classePersonagem!
    }

    func setNomeClasse() {
        self.classe.nomeClasse = self.classe.classePersonagem?.rawValue
    }
    
    //MARK: CARACTERISTICA
    func setCaracteristicasClasse(_ caracteristicas: [String]) {
        self.classe.caracteristicasClasse = caracteristicas
    }
    
    //MARK: SUBCLASSE
    func setSubClasses(_ subClasses: [SubClasseEscolha]) {
        self.classe.subClasses = subClasses
    }
    
    //MARK: DADO VIDA
    func setDadoVida(_ dado: String) {
        self.classe.dadoVida = dado
    }
    
    //MARK: PROFICIENCIA SALVAGUARDA
    func setProfSalvaguarda(_ atributos: [AtributosSalvaguarda]) {
        self.classe.profSalvaguardas = atributos
    }
    
    //MARK: PROFICIENCIA ARMAS
    func setProfArmas(_ armas: [ArmaJSON]) {
        self.classe.profArmas = armas
    }
    
    //MARK: PROFICIENCIA ARMADURAS
    func setProfArmaduras(_ armaduras: [ArmaduraJSON]) {
        self.classe.profArmaduras = armaduras
    }
    
    //MARK: PROFICIENCIA FERRAMENTAS
    func setProfFerramentas(_ ferramentas: [FerramentaJSON]) {
        self.setProfFerramentas(ferramentas)
    }
    
    //MARK: ARMAS INICIAIS
    func setArmasIniciais(_ armas: [ArmaJSON]) {
        self.classe.armasIniciais = armas
    }
    
    //MARK: ARMADURAS INICIAIS
    func setArmadurasIniciais(_ armaduras: [ArmaduraJSON]) {
        self.classe.armadurasIniciais = armaduras
    }
    
    //MARK: EQUIPAMENTOS INICIAIS
    func setEquipamentosIniciais(_ equipamentos: [EquipamentoJSON]) {
        self.classe.equipamentosIniciais = equipamentos
    }
    
    //MARK: FERRAMENTAS INICIAIS
    func setFerramentasIniciais(_ ferramentas: [FerramentaJSON]) {
        self.classe.ferramentasIniciais = ferramentas
    }
    
    //MARK: PROFICIENCIA PERICIAS
    func setProfPericias(_ pericias: [Pericia]) {
        self.classe.profPericias = pericias
    }
    
    //MARK: QUANTIA PROFICIENCIA PERICIAS
    func setQuantiaEscolhaProfPericia(_ quantia: Int) {
        self.classe.quantiaProfPericias = quantia
    }
    
    //MARK: POSSUI MAGIAS
    func setPossuiMagias(_ possuiMagia: Bool) {
        self.classe.possuiMagias = possuiMagia
    }
    
    func setMagiaApenasSubclasse(_ magiaDeSubclasse: Bool) {
        self.classe.magiaApenasSubclasse = magiaDeSubclasse
    }
    
    func setSubclasseComMagia(_ subclasse: SubclassePersonagem) {
        self.classe.subclasseComMagia = subclasse
    }
    
    //MARK: MAGIAS CONHECIDAS
    func setMagiasConhecidas(_ magiasConhecidas: [MagiasConhecidas]) {
        self.classe.magiasConhecidas = magiasConhecidas
    }
    
    //MARK: ESPACOS DE MAGIA
    func setEspacosDeMagia(_ espacosMagias: [EspacosDeMagias]) {
        self.classe.espacosDeMagia = espacosMagias
    }
    
    //MARK: PONTOS NUMERICOS
    func setPontosEspecificosNumericos(_ pontoNumerico: [PontoEspecificoNumerico]) {
        self.classe.pontosEspecificosNumerico = pontoNumerico
    }
    
    //MARK: PONTOS TEXTO
    func setPontosEspecificosTexto(_ pontoTexto: [PontoEspecificoTexto]) {
        self.classe.pontosEspecificosTexto = pontoTexto
    }
    
     //MARK: GET FINAL
    func getClasseFinal() -> ClasseEscolha {
        let buildedClasse = self.classe
        self.resetBuilder()
        return buildedClasse
    }
}
