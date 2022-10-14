//
//  AntecedenteFinalConcreteBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 14/10/22.
//

import Foundation

public class AntecedenteFinalConcreteBuilder : AntecedenteFinalBuilder {
    private var antecedenteFinal = AntecedenteFinal()
    
    //MARK: RESET
    func resetBuilder() {
        antecedenteFinal = AntecedenteFinal()
    }
    
    //MARK: TIPO ANTECEDENTE
    func setTipoAntecedente(_ antecedente: AntecedentePersonagem) {
        self.antecedenteFinal.tipoAntecedente = antecedente
    }
    
    //MARK: TIPO VARIANTE
    func setTipoVarianteAntecedente(_ variacao: VariacaoAntecedente) {
        self.antecedenteFinal.tipoVarianteAntecedente = variacao
    }
    
    //MARK: PROF PERICIAS
    func setProfPericias(_ pericias: [Pericia]) {
        self.antecedenteFinal.profPericias = pericias
    }
    
    //MARK: PROF FERRAMENTAS
    func setProfFerramentas(_ ferramentas: [FerramentaJSON], _ escolha: AntecedenteEscolhasDefinidas) {
        var profFerramentas: [FerramentaJSON] = ferramentas
        profFerramentas.append(contentsOf: escolha.escolhaProfFerramenta)
        
        self.antecedenteFinal.profFerramentas = profFerramentas
    }
    
    //MARK: IDIOMAS
    func setIdiomas(_ escolha: AntecedenteEscolhasDefinidas) {
        self.antecedenteFinal.idiomas = escolha.escolhaIdiomas
    }
    
    //MARK: ARMAS INICIAIS
    func setArmasIniciais(_ armas: [ArmaJSON]) {
        self.antecedenteFinal.armasIniciais = armas
    }
    
    //MARK: EQUIPAMENTOS INICIAIS
    func setEquipamentosIniciais(_ equipamentos: [EquipamentoJSON], _ escolha: AntecedenteEscolhasDefinidas) {
        var equipamentosIniciais: [EquipamentoJSON] = equipamentos
        equipamentosIniciais.append(contentsOf: escolha.escolhaEquipamentosIniciais)
        
        self.antecedenteFinal.equipamentosIniciais = equipamentosIniciais
    }
    
    //MARK: FERRAMENTAS INICIAIS
    func setFerramentasIniciais(_ ferramentas: [FerramentaJSON], _ escolha: AntecedenteEscolhasDefinidas) {
        var ferramentasIniciais: [FerramentaJSON] = ferramentas
        ferramentasIniciais.append(contentsOf: escolha.escolhaFerramentasIniciais)
        
        self.antecedenteFinal.ferramentasIniciais = ferramentasIniciais
    }
    
    //MARK: DINHEIRO INICIAL
    func setDinheiroInicial(_ dinheiro: Moeda) {
        self.antecedenteFinal.dinheiroInicial = dinheiro
    }
    
    //MARK: GET ANTECEDENTE
    func getAntecedenteFinal() -> AntecedenteFinal {
        let buildedAntecedente = self.antecedenteFinal
        self.resetBuilder()
        return buildedAntecedente
    }
}
