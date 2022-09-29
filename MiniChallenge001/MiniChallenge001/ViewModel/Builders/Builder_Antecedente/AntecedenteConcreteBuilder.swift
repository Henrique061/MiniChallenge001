//
//  AntecedenteConcreteBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 25/09/22.
//

import Foundation

public class AntecedenteConcreteBuilder : AntecedenteBuilder {
    private var antecedente = AntecedenteEscolha()
    
    //MARK: RESET BUILDER
    func resetBuilder() {
        antecedente = AntecedenteEscolha()
    }
    
    //MARK: ANTECEDENTE
    func setAntecedente(_ antecedente: AntecedentePersonagem) {
        self.antecedente.tipoAntecedente = antecedente
    }
    
    //MARK: GET ANTECEDENTE
    func getAntecedente() -> AntecedentePersonagem {
        return self.antecedente.tipoAntecedente
    }
    
    //MARK: NOME ANTECEDENTE
    func setNomeAntecedente() {
        self.antecedente.nomeAntecente = self.antecedente.tipoAntecedente.rawValue
    }
    
    //MARK: VARIACAO ANTECEDENTE
    func setVariacaoAntecedente(_ variacao: VariacaoAntecedente) {
        self.antecedente.variacaoAntecedente = variacao
    }
    
    //MARK: PROF PERICIAS
    func setProfPericias(_ pericias: [Pericia]) {
        self.antecedente.profPericias = pericias
    }
    
    //MARK: PROF FERRAMENTAS
    func setProfFerramentas(_ ferramentas: [FerramentaJSON]) {
        self.antecedente.profFerramentas = ferramentas
    }
    
    //MARK: ESCOLHA PROF FERRAMENTAS
    func setEscolhaProfFerramentas(_ escolhas: [String]) {
        self.antecedente.escolhaProfFerramentas = escolhas
    }
    
    //MARK: QUANTIA ESCOLHA IDIOMA
    func setQuantiaEscolhaIdioma(_ quantia: Int) {
        self.antecedente.quantiaEscolhaIdioma = quantia
    }
    
    //MARK: EQUIPAMENTO INICIAL
    func setEquipamentoInicial(_ equipamentos: [EquipamentoJSON]) {
        self.antecedente.equipamentosIniciais = equipamentos
    }
    
    //MARK: FERRAMENTA INICIAL
    func setFerramentasIniciais(_ ferramentas: [FerramentaJSON]) {
        self.antecedente.ferramentasIniciais = ferramentas
    }
    
    //MARK: ARMAS INICIAIS
    func setArmasIniciais(_ armas: [ArmaJSON]) {
        self.antecedente.armasIniciais = armas
    }
    
    //MARK: ESCOLHA EQUIP INICIAL
    func setEscolhaEquipamentoInicial(_ escolhas: [String]) {
        self.antecedente.escolhaEquipamentoInicial = escolhas
    }
    
    //MARK: ESCOLHAS FERRA INICIAL
    func setEscolhaFerramentaInicial(_ escolhas: [String]) {
        self.antecedente.escolhaFerramentaInicial = escolhas
    }
    
    //MARK: DINHEIRO INICIAL
    func setDinheiroInicial(_ moeda: Moeda) {
        self.antecedente.dinheiroInicial = moeda
    }
    
    //MARK: GET FINAL
    func getAntecedenteFinal() -> AntecedenteEscolha {
        let buildedAnt = self.antecedente
        self.resetBuilder()
        return buildedAnt
    }
}
