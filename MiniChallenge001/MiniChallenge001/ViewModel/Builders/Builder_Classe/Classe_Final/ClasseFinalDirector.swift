//
//  ClasseFinalDirector.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 04/10/22.
//

import Foundation

public class ClasseFinalDirector {
    private var builder: ClasseFinalBuilder?
    
    func newBuilder(_ classeFinalBuilder: ClasseFinalBuilder) {
        self.builder = classeFinalBuilder
    }
    
    //MARK: MAKE CLASSE FINAL
    func makeClasseFinal(_ classeEscolha: ClasseEscolha, _ escolhas: ClasseEscolhasDefinidas) {
        //MARK: CLASSE
        builder?.setTipoClasse(classeEscolha.classePersonagem)
        
        //MARK: CARACTERISTICAS
        builder?.setCaracteristicasClasse(classeEscolha.caracteristicasClasse)
        
        //MARK: SUBCLASSES
        builder?.setSubClasses(classeEscolha.subClasses)
        
        //MARK: DADO VIDA
        builder?.setDadoVida(classeEscolha.dadoVida)
        
        //MARK: VIDA INICIAL
        builder?.setVidaInicial(classeEscolha.vidaInicial)
        
        //MARK: VIDAS SEGUINTES
        builder?.setVidasSeguintes(classeEscolha.vidasSeguintes)
        
        //MARK: RIQUEZA INICIAL
        builder?.setRiquezaInicial(escolhas)
        
        //MARK: POSSUI MAGIA
        builder?.setPosusiMagia(classeEscolha.possuiMagias)
        
        //MARK: MAGIA SUBCLASSE
        builder?.setMagiaSubclasse(classeEscolha.magiaApenasSubclasse)
        
        //MARK: SUBCLASSE COM MAGIA
        builder?.setSubclasseComMagia(classeEscolha.subclasseComMagia)
        
        //MARK: MAGIAS CONHECIDAS
        builder?.setMagiasConhecidas(classeEscolha.magiasConhecidas)
        
        //MARK: ESPACOS DE MAGIA
        builder?.setEspacosMagia(classeEscolha.espacosDeMagia)
        
        //MARK: PROF SALVAGUARDA
        builder?.setProfSalvaguardas(classeEscolha.profSalvaguardas)
        
        //MARK: PROF ARMAS
        builder?.setProfArmas(classeEscolha.profArmas)
        
        //MARK: PROF ARMADURAS
        builder?.setProfArmaduras(classeEscolha.profArmaduras)
        
        //MARK: PROF FERRAMENTAS
        builder?.setProfFerramentas(classeEscolha.profFerramentas, escolhas)
        
        //MARK: PROF PERICIAS
        builder?.setProfPericias(escolhas)
        
        //MARK: PONTOS NUMERICOS
        builder?.setPontosEspecificosNumerico(classeEscolha.pontosEspecificosNumerico)
        
        //MARK: PONTOS TEXTO
        builder?.setPontosEspecificosTexto(classeEscolha.pontosEspecificosTexto)
        
        //MARK: ARMAS INICIAIS
        var armasIniciais: [ArmaJSON] = classeEscolha.armasIniciais
        armasIniciais.append(contentsOf: self.buscaArmasOpcoes(escolhas))
        builder?.setArmasIniciais(armasIniciais)
        
        //MARK: ARMADURAS INICIAIS
        var armadurasIniciais: [ArmaduraJSON] = classeEscolha.armadurasIniciais
        armadurasIniciais.append(contentsOf: self.buscaArmadurasOpcoes(escolhas))
        builder?.setArmadurasIniciais(armadurasIniciais)
        
        //MARK: EQUIPAMENTOS INICIAIS
        let equipamentosIniciais: [EquipamentoJSON] = self.buscaEquipamentosOpcoes(escolhas, classeEscolha.equipamentosIniciais)
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        
        //MARK: FERRAMENTAS INICIAIS
        var ferramentasIniciais: [FerramentaJSON] = classeEscolha.ferramentasIniciais
        ferramentasIniciais.append(contentsOf: self.buscaFerramentasOpcoes(escolhas))
        builder?.setFerramentasIniciais(ferramentasIniciais)
        
        //MARK: PACOTES INICIAIS
        var pacotesIniciais: [PacoteEquipamento] = classeEscolha.pacotesIniciais
        pacotesIniciais.append(contentsOf: self.buscaPacotesOpcoes(escolhas))
        builder?.setPacotesIniciais(pacotesIniciais)
    }
    
    //MARK: BUSCA OPCOES ARMA
    private func buscaArmasOpcoes(_ escolhas: ClasseEscolhasDefinidas) -> [ArmaJSON] {
        let escolhasOpcoes = escolhas.escolhasOpcoesEquip
        var retornoJson: [ArmaJSON] = []
        
        for escolha in escolhasOpcoes {
            for item in escolha.itens {
                if item.tipoJson == .arma {
                    retornoJson.append(contentsOf: BuscaJson.buscaArmaPorNomeQuantidade(nome: item.nomeItem, quantidade: item.quantia))
                }
            }
        }
        
        return retornoJson
    }
    
    //MARK: BUSCA OPCOES ARMADURA
    private func buscaArmadurasOpcoes(_ escolhas: ClasseEscolhasDefinidas) -> [ArmaduraJSON] {
        let escolhasOpcoes = escolhas.escolhasOpcoesEquip
        var retornoJson: [ArmaduraJSON] = []
        
        for escolha in escolhasOpcoes {
            for item in escolha.itens {
                if item.tipoJson == .arma {
                    retornoJson.append(contentsOf: BuscaJson.buscaArmaduraPorNomeQuantidade(nome: item.nomeItem, quantidade: item.quantia))
                }
            }
        }
        
        return retornoJson
    }
    
    //MARK: BUSCA OPCOES EQUIPAMENTO
    // VER EQUIP QUE RETORNA UM ITEM DE QUANTIDADE, VERIFICAR SE JA NAO TEM ESSE MSM EQUIP NO INVENTARIO
    private func buscaEquipamentosOpcoes(_ escolhas: ClasseEscolhasDefinidas, _ equipamentoAtual: [EquipamentoJSON]) -> [EquipamentoJSON] {
        let escolhasOpcoes = escolhas.escolhasOpcoesEquip
        var retornoJson: [EquipamentoJSON] = []
        retornoJson.append(contentsOf: equipamentoAtual)
        
        let nomesEquipamentos: [String] = retornoJson.map({ $0.nome })
        
        for escolha in escolhasOpcoes {
            for item in escolha.itens {
                if item.tipoJson == .equipamento {
                    if nomesEquipamentos.contains(item.nomeItem) {
                        if let i = retornoJson.firstIndex(where: { $0.nome == item.nomeItem }) {
                            retornoJson[i].quantidade += item.quantia
                        }
                    }
                    else {
                        retornoJson.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: item.nomeItem, quantidade: item.quantia))
                    }
                }
            }
        }
        
        return retornoJson
    }
    
    //MARK: BUSCA OPCOES FERRAMENTA
    private func buscaFerramentasOpcoes(_ escolhas: ClasseEscolhasDefinidas) -> [FerramentaJSON] {
        let escolhasOpcoes = escolhas.escolhasOpcoesEquip
        var retornoJson: [FerramentaJSON] = []
        
        for escolha in escolhasOpcoes {
            for item in escolha.itens {
                if item.tipoJson == .arma {
                    retornoJson.append(contentsOf: BuscaJson.buscaFerramentaPorNomeQuantidade(nome: item.nomeItem, quantidade: item.quantia))
                }
            }
        }
        
        return retornoJson
    }
    
    //MARK: BUSCA PACOTES
    private func buscaPacotesOpcoes(_ escolhas: ClasseEscolhasDefinidas) -> [PacoteEquipamento] {
        let escolhasOpcoes = escolhas.escolhasOpcoesEquip
        var retornoJson: [PacoteEquipamento] = []
        
        for escolha in escolhasOpcoes {
            for item in escolha.itens {
                if item.tipoJson == .pacote {
                    retornoJson.append(PacoteEquipamento(rawValue: item.nomeItem)!)
                }
            }
        }
        
        return retornoJson
    }
}
