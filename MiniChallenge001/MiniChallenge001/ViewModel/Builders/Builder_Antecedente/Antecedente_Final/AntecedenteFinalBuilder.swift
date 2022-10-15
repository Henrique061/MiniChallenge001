//
//  AntecedenteFinalBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 14/10/22.
//

import Foundation

protocol AntecedenteFinalBuilder {
    func resetBuilder()
    
    //MARK: TIPO
    func setTipoAntecedente(_ antecedente: AntecedentePersonagem)
    func setTipoVarianteAntecedente(_ variacao: VariacaoAntecedente)
    
    //MARK: PROFICIENCIAS
    func setProfPericias(_ pericias: [Pericia])
    func setProfFerramentas(_ ferramentas: [FerramentaJSON], _ escolha: AntecedenteEscolhasDefinidas)
    
    //MARK: IDIOMA
    func setIdiomas(_ escolha: AntecedenteEscolhasDefinidas)
    
    //MARK: EQUIPS INICIAIS
    func setArmasIniciais(_ armas: [ArmaJSON])
    func setEquipamentosIniciais(_ equipamentos: [EquipamentoJSON], _ escolha: AntecedenteEscolhasDefinidas)
    func setFerramentasIniciais(_ ferramentas: [FerramentaJSON], _ escolha: AntecedenteEscolhasDefinidas)
    func setDinheiroInicial(_ dinheiro: Moeda)
}
