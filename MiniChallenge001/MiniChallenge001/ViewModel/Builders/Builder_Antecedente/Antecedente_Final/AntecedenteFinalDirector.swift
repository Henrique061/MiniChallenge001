//
//  AntecedenteFinalDirector.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 14/10/22.
//

import Foundation

public class AntecedenteFinalDirector {
    private var builder: AntecedenteFinalBuilder?
    
    func newBuilder(antecedenteFinalBuilder: AntecedenteFinalBuilder) {
        self.builder = antecedenteFinalBuilder
    }
    
    func makeAntecedenteFinal(_ antecedenteEscolha: AntecedenteEscolha, _ escolha: AntecedenteEscolhasDefinidas) {
        //MARK: TIPO ANTECEDENTE
        builder?.setTipoAntecedente(antecedenteEscolha.tipoAntecedente)
        
        //MARK: TIPO VARIANTE
        builder?.setTipoVarianteAntecedente(antecedenteEscolha.variacaoAntecedente)
        
        //MARK: PROF PERICIAS
        builder?.setProfPericias(antecedenteEscolha.profPericias)
        
        //MARK: PROF FERRAMENTAS
        builder?.setProfFerramentas(antecedenteEscolha.profFerramentas, escolha)
        
        //MARK: IDIOMAS
        builder?.setIdiomas(escolha)
        
        //MARK: ARMAS INICIAIS
        builder?.setArmasIniciais(antecedenteEscolha.armasIniciais)
        
        //MARK: EQUIPAMENTOS INICIAIS
        builder?.setEquipamentosIniciais(antecedenteEscolha.equipamentosIniciais, escolha)
        
        //MARK: FERRAMENTAS INICIAIS
        builder?.setFerramentasIniciais(antecedenteEscolha.ferramentasIniciais, escolha)
        
        //MARK: DINHEIRO INICIAL
        builder?.setDinheiroInicial(antecedenteEscolha.dinheiroInicial)
    }
}
