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
        return self.classe.classePersonagem
    }

    func setNomeClasse() {
        self.classe.nomeClasse = self.classe.classePersonagem.rawValue
    }
    
    //MARK: CARACTERISTICA
    func setCaracteristicasClasse(_ caracteristicas: [CaracteristicaJSON]) {
        self.classe.caracteristicasClasse = caracteristicas
    }
    
    //MARK: SUBCLASSE
    func setSubClasses(_ subClasses: [SubClasse]) {
        self.classe.subClasses = subClasses
    }
    
    //MARK: DADO VIDA
    func setDadoVida(_ dado: String) {
        self.classe.dadoVida = dado
    }
    
    //MARK: VIDA INICIAL
    func setVidaInicial(_ vida: Int) {
        self.classe.vidaInicial = vida
    }
    
    //MARK: VIDAS SWGUINTES
    func setVidasSeguintes(_ vidaSeguinte: String) {
        self.classe.vidasSeguintes = vidaSeguinte
    }
    
    //MARK: RIQUEZA INICIAL
    func setRiquezaInicial(_ riqueza: String) {
        self.classe.riquezaInicial = riqueza
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
        self.classe.profFerramentas = ferramentas
    }
    
    //MARK: QUANTIA ESCOLHA PROF FERRAMENTA
    func setQuantiaEscolhaProfFerramentas(_ quantia: Int) {
        self.classe.quantiaEscolhaProfFerramentas = quantia
    }
    
    //MARK: OPCOES FERRAMENTAS
    func setEscolhasProficienciaFerramenta(_ escolhas: [FerramentaJSON]) {
        self.classe.escolhasProficienciaFerramenta = escolhas
    }
    
    //MARK: SET OPCOES
    func setOpcoes(opcoes: [OpcaoEquipamento]) {
        self.classe.opcoesEquipamento = opcoes
    }
    
    //MARK: ARMAS INICIAIS
    func setArmasIniciais(armas: [ArmaJSON]) {
        self.classe.armasIniciais = armas
    }
    
    //MARK: ARMADURAS INICIAIS
    func setArmadurasIniciais(armaduras: [ArmaduraJSON]) {
        self.classe.armadurasIniciais = armaduras
    }
    
    //MARK: EQUIPAMENTOS INICIAIS
    func setEquipamentosIniciais(equipamentos: [EquipamentoJSON]) {
        self.classe.equipamentosIniciais = equipamentos
    }
    
    //MARK: FERRAMENTAS INICIAIS
    func setFerramentasIniciais(ferramentas: [FerramentaJSON]) {
        self.classe.ferramentasIniciais = ferramentas
    }
    
    //MARK: PACOTES INICIAIS
    func setPacotesIniciais(pacotes: [PacoteEquipamento]) {
        self.classe.pacotesIniciais = pacotes
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
    
    //MARK: MAGIA APENAS DE SUBCLASSE
    func setMagiaApenasSubclasse(_ magiaDeSubclasse: Bool) {
        self.classe.magiaApenasSubclasse = magiaDeSubclasse
    }
    
    //MARK: SUBCLASSE COM MAGIA
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
