//
//  AntecedenteDirector.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 25/09/22.
//

import Foundation

public class AntecedenteDirector {
    private var builder: AntecedenteBuilder?
    
    func newBuilder(antBuilder: AntecedenteBuilder){
        self.builder = antBuilder
    }
    
    //MARK: MAKE ANTECEDENTE
    func makeAntecedente(_ antecedente: AntecedentePersonagem) {
        builder?.setAntecedente(antecedente)
        builder?.setNomeAntecedente()
        
        switch builder?.getAntecedente() {
        case .acolito:
            makeAcolito()
            break
            
        case .artesaoGuilda:
            makeArtesaoGuilda()
            break
            
        case .artista:
            makeArtista()
            break
            
        case .charlatao:
            makeCharlatao()
            break
            
        case .criminoso:
            makeCriminoso()
            break
            
        case .eremita:
            makeEremita()
            break
            
        case .forasteiro:
            makeForasteiro()
            break
            
        case .heroiPovo:
            makeHeroiPovo()
            break
            
        case .marinheiro:
            makeMarinheiro()
            break
            
        case .nobre:
            makeNobre()
            break
            
        case .orfao:
            makeOrfao()
            break
            
        case .sabio:
            makeSabio()
            break
            
        case .soldado:
            makeSoldado()
            break
            
        default:
            break
        }
    }
    
    //MARK: ACOLITO
    private func makeAcolito() {
        let profPericias: [Pericia] = [.intuicao, .religiao]
        
        var equipamentoInicial: [EquipamentoJSON] = []
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas comuns"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Algibeira"))
        
        let escolhaEquipamento: [String] = BuscaEquipamento.buscaEquipamentoCategoria(categoria: .simboloSagrado, nomeExcluso: "")
        
        // METODOS /////////////////////////////
        builder?.setProfPericias(profPericias)
        builder?.setPossuiEscolhaIdioma(true)
        builder?.setQuantiaEscolhaIdioma(2)
        builder?.setEquipamentoInicial(equipamentoInicial)
        builder?.setPossuiEscolhaEquipamentoInicial(true)
        builder?.setEscolhaEquipamentoInicial(escolhaEquipamento)
        builder?.setDinheiroInicial(Moeda(quantidade: 15, tipo: .ouro))
    }
    
    //MARK: ARTESAO GUILDA
    private func makeArtesaoGuilda() {
        let profPericias: [Pericia] = [.intuicao, .persuasao]
        
        let escolhaProfFerramenta: [String] = BuscaFerramenta.buscaFerramentaTipo(tipo: .artesao, nomeExcluso: "")
        
        var equipamentoInicial: [EquipamentoJSON] = []
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas de viajante"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Algibeira"))
        
        let escolhaFerramentaInicial: [String] = BuscaFerramenta.buscaFerramentaTipo(tipo: .artesao, nomeExcluso: "")
        
        // METODOS /////////////////////////////
        builder?.setVariacaoAntecedente(.AG_mercadorGuilda)
        builder?.setProfPericias(profPericias)
        builder?.setPossuiEscolhaProfFerramentas(true)
        builder?.setEscolhaProfFerramentas(escolhaProfFerramenta)
        builder?.setPossuiEscolhaIdioma(true)
        builder?.setQuantiaEscolhaIdioma(1)
        builder?.setEquipamentoInicial(equipamentoInicial)
        builder?.setPossuiEscolhaFerramentaInicial(true)
        builder?.setEscolhaFerramentaInicial(escolhaFerramentaInicial)
        builder?.setDinheiroInicial(Moeda(quantidade: 15, tipo: .ouro))
    }
    
    //MARK: ARTISTA
    private func makeArtista() {
        let profPericias: [Pericia] = [.acrobacia, .atuacao]
        
        var profFerramentas: [FerramentaJSON] = []
        profFerramentas.append(BuscaJson.buscaFerramentaPorNome(nome: "Kit de disfarce"))
        
        let escolhaProfFerramenta: [String] = BuscaFerramenta.buscaFerramentaTipo(tipo: .musical, nomeExcluso: "")
        
        var equipamentoInicial: [EquipamentoJSON] = []
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas de entretenimento"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Algibeira"))
        
        let escolhaFerramentaInicial: [String] = BuscaFerramenta.buscaFerramentaTipo(tipo: .musical, nomeExcluso: "")
        
        // METODOS /////////////////////////////
        builder?.setVariacaoAntecedente(.AR_gladiador)
        builder?.setProfPericias(profPericias)
        builder?.setProfFerramentas(profFerramentas)
        builder?.setPossuiEscolhaProfFerramentas(true)
        builder?.setEscolhaProfFerramentas(escolhaProfFerramenta)
        builder?.setEquipamentoInicial(equipamentoInicial)
        builder?.setPossuiEscolhaFerramentaInicial(true)
        builder?.setEscolhaFerramentaInicial(escolhaFerramentaInicial)
        builder?.setDinheiroInicial(Moeda(quantidade: 15, tipo: .ouro))
    }
    
    //MARK: CHALATAO
    private func makeCharlatao() {
        let profPericias: [Pericia] = [.enganacao, .prestidigitacao]
        
        var profFerramentas: [FerramentaJSON] = []
        profFerramentas.append(BuscaJson.buscaFerramentaPorNome(nome: "Kit de disfarce"))
        profFerramentas.append(BuscaJson.buscaFerramentaPorNome(nome: "Kit de falsifica????o"))
        
        var equipamentoInicial: [EquipamentoJSON] = []
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas finas"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Algibeira"))
        
        var ferramentasIniciais: [FerramentaJSON] = []
        ferramentasIniciais.append(BuscaJson.buscaFerramentaPorNome(nome: "Kit de disfarce"))
        
        // METODOS /////////////////////////////
        builder?.setProfPericias(profPericias)
        builder?.setProfFerramentas(profFerramentas)
        builder?.setEquipamentoInicial(equipamentoInicial)
        builder?.setFerramentasIniciais(ferramentasIniciais)
        builder?.setDinheiroInicial(Moeda(quantidade: 15, tipo: .ouro))
    }
    
    //MARK: CRIMINOSO
    private func makeCriminoso() {
        let profPericias: [Pericia] = [.enganacao, .furtividade]
        
        var profFerramentas: [FerramentaJSON] = []
        profFerramentas.append(BuscaJson.buscaFerramentaPorNome(nome: "Ferramentas de ladr??o"))
        
        let escolhaFerramenta: [String] = BuscaFerramenta.buscaFerramentaTipo(tipo: .jogo, nomeExcluso: "")
        
        var equipamentoInicial: [EquipamentoJSON] = []
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "P?? de cabra"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas comuns"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Algibeira"))
        
        // METODOS /////////////////////////////
        builder?.setVariacaoAntecedente(.CR_espiao)
        builder?.setProfPericias(profPericias)
        builder?.setProfFerramentas(profFerramentas)
        builder?.setPossuiEscolhaProfFerramentas(true)
        builder?.setEscolhaProfFerramentas(escolhaFerramenta)
        builder?.setEquipamentoInicial(equipamentoInicial)
        builder?.setDinheiroInicial(Moeda(quantidade: 15, tipo: .ouro))
    }
    
    //MARK: EREMITA
    private func makeEremita() {
        let profPericias: [Pericia] = [.medicina, .religiao]
        
        var profFerramentas: [FerramentaJSON] = []
        profFerramentas.append(BuscaJson.buscaFerramentaPorNome(nome: "Kit de herbalismo"))
        
        var equipamentoInicial: [EquipamentoJSON] = []
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Cobertor de inverno"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas comuns"))
        
        // METODOS /////////////////////////////
        builder?.setVariacaoAntecedente(.ER_outrosEremitas)
        builder?.setProfPericias(profPericias)
        builder?.setProfFerramentas(profFerramentas)
        builder?.setPossuiEscolhaIdioma(true)
        builder?.setQuantiaEscolhaIdioma(1)
        builder?.setEquipamentoInicial(equipamentoInicial)
        builder?.setDinheiroInicial(Moeda(quantidade: 5, tipo: .ouro))
    }
    
    //MARK: FORASTEIRO
    private func makeForasteiro() {
        let profPericias: [Pericia] = [.atletismo, .sobrevivencia]
        
        let escolhaFerramenta: [String] = BuscaFerramenta.buscaFerramentaTipo(tipo: .musical, nomeExcluso: "")
        
        var equipamentoInicial: [EquipamentoJSON] = []
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Armadilha de ca??a"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas de viajante"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Algibeira"))
        
        var armasIniciais: [ArmaJSON] = []
        armasIniciais.append(BuscaJson.buscaArmaPorNome(nome: "Bord??o"))
        
        // METODOS /////////////////////////////
        builder?.setProfPericias(profPericias)
        builder?.setPossuiEscolhaProfFerramentas(true)
        builder?.setEscolhaProfFerramentas(escolhaFerramenta)
        builder?.setPossuiEscolhaIdioma(true)
        builder?.setQuantiaEscolhaIdioma(1)
        builder?.setEquipamentoInicial(equipamentoInicial)
        builder?.setArmasIniciais(armasIniciais)
        builder?.setDinheiroInicial(Moeda(quantidade: 10, tipo: .ouro))
    }
    
    //MARK: HEROI DO POVO
    private func makeHeroiPovo() {
        let profPericias: [Pericia] = [.adestrarAnimais, .sobrevivencia]
        
        let escolhaProfFerramenta: [String] = BuscaFerramenta.buscaFerramentaTipo(tipo: .artesao, nomeExcluso: "")
        
        var equipamentoInicial: [EquipamentoJSON] = []
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "P??"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas comuns"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Algibeira"))
        
        let escolhaFerramentaInicial: [String] = BuscaFerramenta.buscaFerramentaTipo(tipo: .artesao, nomeExcluso: "")
        
        // METODOS /////////////////////////////
        builder?.setProfPericias(profPericias)
        builder?.setPossuiEscolhaProfFerramentas(true)
        builder?.setEscolhaProfFerramentas(escolhaProfFerramenta)
        builder?.setEquipamentoInicial(equipamentoInicial)
        builder?.setPossuiEscolhaFerramentaInicial(true)
        builder?.setEscolhaFerramentaInicial(escolhaFerramentaInicial)
        builder?.setDinheiroInicial(Moeda(quantidade: 10, tipo: .ouro))
    }
    
    //MARK: MARINHEIRO
    private func makeMarinheiro() {
        let profPericias: [Pericia] = [.atletismo, .percepcao]
        
        var profFerramentas: [FerramentaJSON] = []
        profFerramentas.append(BuscaJson.buscaFerramentaPorNome(nome: "Ferramentas de navega????o"))
        
        var equipamentoInicial: [EquipamentoJSON] = []
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Corda de seda (15 metros)"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas comuns"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Algibeira"))
        
        var armasIniciais: [ArmaJSON] = []
        armasIniciais.append(BuscaJson.buscaArmaPorNome(nome: "Clava Grande"))
        
        // METODOS /////////////////////////////
        builder?.setVariacaoAntecedente(.MA_pirata)
        builder?.setProfPericias(profPericias)
        builder?.setProfFerramentas(profFerramentas)
        builder?.setEquipamentoInicial(equipamentoInicial)
        builder?.setArmasIniciais(armasIniciais)
        builder?.setDinheiroInicial(Moeda(quantidade: 10, tipo: .ouro))
    }
    
    //MARK: NOBRE
    private func makeNobre() {
        let profPericias: [Pericia] = [.historia, .persuasao]
        
        let escolhaFerramenta: [String] = BuscaFerramenta.buscaFerramentaTipo(tipo: .jogo, nomeExcluso: "")
        
        var equipamentoInicial: [EquipamentoJSON] = []
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Pergaminho"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas finas"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Algibeira"))
        
        // METODOS /////////////////////////////
        builder?.setVariacaoAntecedente(.NO_cavaleiro)
        builder?.setProfPericias(profPericias)
        builder?.setPossuiEscolhaProfFerramentas(true)
        builder?.setEscolhaProfFerramentas(escolhaFerramenta)
        builder?.setPossuiEscolhaIdioma(true)
        builder?.setQuantiaEscolhaIdioma(1)
        builder?.setEquipamentoInicial(equipamentoInicial)
        builder?.setDinheiroInicial(Moeda(quantidade: 25, tipo: .ouro))
    }
    
    //MARK: ORFAO
    private func makeOrfao() {
        let profPericias: [Pericia] = [.furtividade, .prestidigitacao]
        
        var profFerramentas: [FerramentaJSON] = []
        profFerramentas.append(BuscaJson.buscaFerramentaPorNome(nome: "Kit de disfarce"))
        profFerramentas.append(BuscaJson.buscaFerramentaPorNome(nome: "Ferramentas de ladr??o"))
        
        var equipamentoInicial: [EquipamentoJSON] = []
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas comuns"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Algibeira"))
        
        // METODOS /////////////////////////////
        builder?.setProfPericias(profPericias)
        builder?.setProfFerramentas(profFerramentas)
        builder?.setEquipamentoInicial(equipamentoInicial)
        builder?.setDinheiroInicial(Moeda(quantidade: 10, tipo: .ouro))
    }
    
    //MARK: SABIO
    private func makeSabio() {
        let profPericias: [Pericia] = [.arcanismo, .historia]
        
        var equipamentoInicial: [EquipamentoJSON] = []
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas comuns"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Algibeira"))
        
        // METODOS /////////////////////////////
        builder?.setProfPericias(profPericias)
        builder?.setPossuiEscolhaIdioma(true)
        builder?.setQuantiaEscolhaIdioma(2)
        builder?.setEquipamentoInicial(equipamentoInicial)
        builder?.setDinheiroInicial(Moeda(quantidade: 10, tipo: .ouro))
    }
    
    //MARK: SOLDADO
    private func makeSoldado() {
        let profPericias: [Pericia] = [.atletismo, .intimidacao]
        
        let escolhaFerramenta: [String] = BuscaFerramenta.buscaFerramentaTipo(tipo: .jogo, nomeExcluso: "")
        
        var equipamentoInicial: [EquipamentoJSON] = []
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas comuns"))
        equipamentoInicial.append(BuscaJson.buscaEquipamentoPorNome(nome: "Algibeira"))
        
        // METODOS /////////////////////////////
        builder?.setProfPericias(profPericias)
        builder?.setPossuiEscolhaProfFerramentas(true)
        builder?.setEscolhaProfFerramentas(escolhaFerramenta)
        builder?.setEquipamentoInicial(equipamentoInicial)
        builder?.setDinheiroInicial(Moeda(quantidade: 10, tipo: .ouro))
    }
}
