//
//  RacaFinalDirector.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 04/10/22.
//

import Foundation

public class RacaFinalDirector {
    private var builder: RacaFinalBuilder?
    
    func newBuilder(racaFinalBuilder: RacaFinalBuilder) {
        self.builder = racaFinalBuilder
    }
    
    //MARK: MAKE RACA FINAL
    func makeRacaFinal(_ racaEscolha: RacaEscolha, _ escolha: RacaEscolhasDefinidas) {
        //MARK: RACA
        builder?.setRaca(racaEscolha.tipoRaca)
        
        //MARK: SUBRACA
        if racaEscolha.possuiSubRaca {
            builder?.setSubraca(escolha.escolhaSubRaca.subraca)
        }
        let subracaEscolhida = escolha.escolhaSubRaca
        
        //MARK: ATT GANHOS
        var attGanhos: [AtributosGanhosRaca] = racaEscolha.atributosGanhos
        if racaEscolha.possuiSubRaca {
            attGanhos.append(subracaEscolhida.atributoGanho)
        }

        builder?.setAtributosAdicionais(attGanhos, escolha)
        
        
        //MARK: DESLOCAMENTO
        if racaEscolha.deslocamentoSubraca.isEmpty {
            builder?.setDeslocamento(racaEscolha.deslocamento)
        }
        else {
            for deslocamento in racaEscolha.deslocamentoSubraca {
                if deslocamento.subraca == escolha.escolhaSubRaca.subraca {
                    builder?.setDeslocamento(deslocamento.deslocamento)
                    break
                }
            }
        }
        
        //MARK: IDIOMAS
        builder?.setIdiomas(racaEscolha.idiomas, escolha)
        
        //MARK: TRACOS
        var tracos: [TraitJSON] = racaEscolha.tracos
        if racaEscolha.possuiSubRaca {
            tracos.append(contentsOf: escolha.escolhaSubRaca.tracosSubraca)
        }
        builder?.setTracos(tracos)
        
        //MARK: PROF ARMAS
        if !racaEscolha.profArmas.isEmpty {
            var profArmas: [ArmaJSON] = racaEscolha.profArmas
            
            if !racaEscolha.subracaProfArma.isEmpty {
                for subraca in racaEscolha.subracaProfArma {
                    if subraca.subraca == escolha.escolhaSubRaca.subraca {
                        profArmas.append(contentsOf: subraca.armasProficientes)
                    }
                }
            }
            
            builder?.setProfArmas(profArmas)
        }
        
        //MARK: PROF ARMADURAS
        if !racaEscolha.subracaProfArmaduras.isEmpty {
            for subraca in racaEscolha.subracaProfArmaduras {
                if subraca.subraca == escolha.escolhaSubRaca.subraca {
                    builder?.setProfArmaduras(subraca.armadurasProficientes)
                    break
                }
            }
        }
        
        //MARK: PROF FERRAMENTAS
        var profFerramentas: [FerramentaJSON] = []
        if !racaEscolha.subracaProfFerramenta.isEmpty {
            for subraca in racaEscolha.subracaProfFerramenta {
                if subraca.subraca == escolha.escolhaSubRaca.subraca {
                    profFerramentas.append(contentsOf: subraca.ferramentasProficientes)
                    break
                }
            }
        }
        
        builder?.setProfFerramentas(profFerramentas, escolha)
        
        //MARK: PROF PERICIAS
        builder?.setProfPericias(racaEscolha.profPericias, escolha)
        
        //MARK: MAGIAS RECEBIDAS
        if !racaEscolha.magiasRecebidas.isEmpty {
            builder?.setMagiasRecebidas(racaEscolha.magiasRecebidas, escolha)
        }
        else {
            builder?.setMagiasRecebidas(racaEscolha.magiasPorSubraca.magias, escolha)
        }
        
    } // fecha make raca final
}
