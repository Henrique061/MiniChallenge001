//
//  RacaFinalConcreteBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 30/09/22.
//

import Foundation

public class RacaFinalConcreteBuilder : RacaFinalBuilder {
    private var racaFinal = RacaFinal()
    
    //MARK: RESET
    func resetBuilder() {
        racaFinal = RacaFinal()
    }
    
    //MARK: RACA
    func setRaca(_ raca: TipoRaca) {
        self.racaFinal.tipoRaca = raca
    }
    
    //MARK: SUBRACA
    func setSubraca(_ subraca: TipoSubRaca) {
        self.racaFinal.subRaca = subraca
    }
    
    //MARK: ATRIBUTOS ADICIONAIS
    func setAtributosAdicionais(_ atributosGanhos: [AtributosGanhosRaca], _ escolhas: RacaEscolhasDefinidas) {
        self.racaFinal.atributosAdicionais = atributosGanhos
        
        if(!escolhas.escolhaAtributos.isEmpty) {
            self.racaFinal.atributosAdicionais.append(contentsOf: escolhas.escolhaAtributos)
        }
    }
    
    //MARK: DESLOCAMENTO
    func setDeslocamento(_ deslocamento: Float) {
        self.racaFinal.deslocamento = deslocamento
    }
    
    //MARK: IDIOMAS
    func setIdiomas(_ idiomas: [IdiomaAlfabeto], _ escolhas: RacaEscolhasDefinidas) {
        self.racaFinal.idiomas = idiomas
        
        if escolhas.escolhaIdioma.idioma != .none {
            self.racaFinal.idiomas.append(escolhas.escolhaIdioma)
        }
    }
    
    //MARK: TRACOS
    func setTracos(_ tracos: [TraitJSON]) {
        self.racaFinal.tracos = tracos
    }
    
    //MARK: PROF ARMAS
    func setProfArmas(_ profArmas: [ArmaJSON]) {
        self.racaFinal.profArmas = profArmas
    }
    
    //MARK: PROF ARMADURAS
    func setProfArmaduras(_ profArmaduras: [ArmaduraJSON]) {
        self.racaFinal.profArmaduras = profArmaduras
    }
    
    //MARK: PROF FERRAMENTAS
    func setProfFerramentas(_ profFerramentas: [FerramentaJSON], _ escolhas: RacaEscolhasDefinidas) {
        self.racaFinal.profFerramentas = profFerramentas
        
        if !escolhas.escolhaProfFerramentasAdicionais.isEmpty {
            self.racaFinal.profFerramentas.append(contentsOf: escolhas.escolhaProfFerramentasAdicionais)
        }
    }
    
    //MARK: PROF PERICIAS
    func setProfPericias(_ profPericias: [Pericia], _ escolhas: RacaEscolhasDefinidas) {
        self.racaFinal.profPericias = profPericias
        
        if !escolhas.escolhaProfPericias.isEmpty {
            self.racaFinal.profPericias.append(contentsOf: escolhas.escolhaProfPericias)
        }
    }
    
    //MARK: MAGIAS RECEBIDAS
    func setMagiasRecebidas(_ magias: [MagiaJSON], _ escolhas: RacaEscolhasDefinidas) {
        if escolhas.escolhaMagia.isEmpty {
            self.racaFinal.magiasRecebidas = magias
        }
        
        else {
            self.racaFinal.magiasRecebidas = escolhas.escolhaMagia
        }
    }
    
    //MARK: RACA FINAL
    func getRacaFinal() -> RacaFinal {
        let buildedRaca = self.racaFinal
        self.resetBuilder()
        return buildedRaca
    }
}
