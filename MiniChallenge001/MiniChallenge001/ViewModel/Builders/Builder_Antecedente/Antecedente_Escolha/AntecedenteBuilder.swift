//
//  AntecedenteBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 25/09/22.
//

import Foundation

protocol AntecedenteBuilder {
    func resetBuilder()
    
    func setAntecedente(_ antecedente: AntecedentePersonagem)
    func getAntecedente() -> AntecedentePersonagem
    func setNomeAntecedente()
    
    func setVariacaoAntecedente(_ variacao: VariacaoAntecedente)
    func setProfPericias(_ pericias: [Pericia])
    func setProfFerramentas(_ ferramentas: [FerramentaJSON])
    
    func setPossuiEscolhaProfFerramentas(_ possui: Bool)
    func setEscolhaProfFerramentas(_ escolhas: [String])
    
    func setPossuiEscolhaIdioma(_ possui: Bool)
    func setQuantiaEscolhaIdioma(_ quantia: Int)
    
    func setEquipamentoInicial(_ equipamentos: [EquipamentoJSON])
    func setFerramentasIniciais(_ ferramentas: [FerramentaJSON])
    func setArmasIniciais(_ armas: [ArmaJSON])
    
    func setPossuiEscolhaEquipamentoInicial(_ possui: Bool)
    func setEscolhaEquipamentoInicial(_ escolhas: [String])
    
    func setPossuiEscolhaFerramentaInicial(_ possui: Bool)
    func setEscolhaFerramentaInicial(_ escolhas: [String])
    
    func setDinheiroInicial(_ moeda: Moeda)
}
