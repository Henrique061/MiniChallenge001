//
//  PersonagemDirector.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 17/10/22.
//

import Foundation

public class PersonagemDirector {
    private var builder: PersonagemBuilder?
    
    func newBuilder(_ personagemBuilder: PersonagemBuilder) {
        self.builder = personagemBuilder
    }
    
    //MARK: MAKE PERSONAGEM
    func makePersonagem(raca: RacaFinal, classe: ClasseFinal, antecedente: AntecedenteFinal, valoresAtributos: ValoresAtributos) {
        //MARK: NIVEL
        builder?.setNivel(1)
        
        //MARK: EXPERIENCIA
        builder?.setExperiencia(0)
        
        //MARK: CLASSE FINAL
        builder?.setClasseFinal(classeFicha(classe))
        
        //MARK: RACA FINAL
        builder?.setRacaFinal(racaFicha(raca))
        
        //MARK: ANTECEDENTE FINAL
        builder?.setAntecedenteFinal(antecedente.tipoAntecedente)
        
        //MARK: MAGIAS
        builder?.setMagias(raca.magiasRecebidas)
        
        //MARK: ARMAS
        builder?.setArmas(armasRecebidas(classe, antecedente))
        
        //MARK: ARMADURAS
        builder?.setArmaduras(armadurasRecebidas(classe))
        
        //MARK: EQUIPAMENTOS
        builder?.setEquipamentos(equipamentosRecebidos(classe, antecedente: antecedente))
        
        //MARK: FERRAMENTAS
        builder?.setFerramentas(ferramentasRecebidas(classe, antecedente))
        
        //MARK: MONTARIAS
        builder?.setMontarias([])
        
        //MARK: EQUIPAMENTOS MONTARIA
        builder?.setEquipamentosMontaria([])
        
        //MARK: VEICULOS AQUATICOS
        builder?.setVeiculosAquaticos([])
        
        //MARK: BUGIGANGAS
        builder?.setBugigangas([])
        
        //MARK: CARTEIRA
        builder?.setCarteira(dinheiroRecebido(classe, antecedente))
        
        //MARK: CLASSE ARMADURA
        builder?.setClasseArmadura(classeArmadura(valoresAtributos: valoresAtributos))
        
        //MARK: INICIATIVA
        builder?.setIniciativa(0)
        
        //MARK: DESLOCAMENTO
        builder?.setDeslocamento(raca.deslocamento)
        
        //MARK: PONTOS VIDA MAXIMO
        builder?.setPontosVidaMaximo(vidaMaxima(classe: classe, valoresAtributos: valoresAtributos))
        
        //MARK: PONTOS VIDA
        builder?.setPontosVida(vidaMaxima(classe: classe, valoresAtributos: valoresAtributos))
        
        //MARK: PONTOS VIDA TEMPORARIO
        builder?.setPontosVidaTemporario(0)
        
        //MARK: DADO VIDA MAXIMO
        builder?.setDadoVidaMaximo(1)
        
        //MARK: QUANTIA DADO VIDA
        builder?.setQuantiaDadoVida(1)
        
        //MARK: RESISTENCIA MORTE
        builder?.setResistenciaMorte(ResistenciaMorte())
        
        //MARK: PONTOS ATRIBUTOS
        builder?.setPontosAtributos(valoresAtributos)
        
        //MARK: PROF SALVAGUARDAS
        builder?.setProfSalvaguardas(classe.profSalvaguardas)
        
        //MARK: PROF PERICIAS
        
    }
    
    // //////////////////////////////////////////////////////////////////////////
    
    private func classeFicha(_ classe: ClasseFinal) -> ClasseFicha {
        return ClasseFicha(classePersonagem: classe.tipoClasse,
                           caracteristicasPersonagem: classe.caracteristicasClasse,
                           subclassesPersonagem: classe.subClasses,
                           magiasConhecidas: classe.magiasConhecidas,
                           espacosDeMagia: classe.espacosMagia,
                           pontosEspecificosNumerico: classe.pontosEspecificosNumerico,
                           pontosEspecificosTexto: classe.pontosEspecificosTexto)
    }
    
    private func racaFicha(_ raca: RacaFinal) -> RacaFicha {
        return RacaFicha(racaPersonagem: raca.tipoRaca,
                         subracaPersonagem: raca.subRaca,
                         tracos: raca.tracos)
    }
    
    //MARK: RECEBER ARMAS
    private func armasRecebidas(_ classe: ClasseFinal, _ antecedente: AntecedenteFinal) -> [ArmaJSON] {
        var armas: [ArmaJSON] = []
        armas.append(contentsOf: classe.armasIniciais)
        armas.append(contentsOf: antecedente.armasIniciais)
        
        return armas
    }
    
    //MARK: RECEBER ARMADURAS
    private func armadurasRecebidas(_ classe: ClasseFinal) -> [ArmaduraJSON] {
        var armaduras: [ArmaduraJSON] = []
        armaduras.append(contentsOf: classe.armadurasIniciais)
        
        return armaduras
    }
    
    //MARK: RECEBER EQUIPAMENTOS
    private func equipamentosRecebidos(_ classe: ClasseFinal, antecedente: AntecedenteFinal) -> [EquipamentoJSON] {
        let pacoteFactory = PacoteFactory()
        var equipamentos: [EquipamentoJSON] = []
        
        // recebe do antecedente
        equipamentos.append(contentsOf: antecedente.equipamentosIniciais)
        
        // recebe da classe
        equipamentos.append(contentsOf: equipamentoSemRepeticao(listaFinal: equipamentos, listaReceber: classe.equipamentosIniciais))
        
        // recebe dos pacotes da classe
        if !classe.pacotesIniciais.isEmpty {
            for pacote in classe.pacotesIniciais {
                equipamentos.append(contentsOf: equipamentoSemRepeticao(listaFinal: equipamentos, listaReceber: pacoteFactory.orderPacote(pacote)))
            }
        }
        
        return equipamentos
    }
    
    private func equipamentoSemRepeticao(listaFinal: [EquipamentoJSON], listaReceber: [EquipamentoJSON]) -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = listaFinal
        
        for receber in listaReceber {
            if equipamentos.contains(where: { $0.nome == receber.nome }) {
                let index: Int = equipamentos.firstIndex(where: { $0.nome == receber.nome })!
                equipamentos[index].quantidade += receber.quantidade
            }
            
            else {
                equipamentos.append(receber)
            }
        }
        
        return equipamentos
    }
    
    //MARK: RECEBER FERRAMENTAS
    private func ferramentasRecebidas(_ classe: ClasseFinal, _ antecedente: AntecedenteFinal) -> [FerramentaJSON] {
        var ferramentas: [FerramentaJSON] = []
        ferramentas.append(contentsOf: classe.ferramentasIniciais)
        ferramentas.append(contentsOf: antecedente.ferramentasIniciais)
        
        return ferramentas
    }
    
    //MARK: DINHEIRO
    private func dinheiroRecebido(_ classe: ClasseFinal, _ antecedente: AntecedenteFinal) -> [Moeda] {
        var riquezas: [Moeda] = [
            .init(quantidade: 0, tipo: .cobre),
            .init(quantidade: 0, tipo: .prata),
            .init(quantidade: 0, tipo: .electro),
            .init(quantidade: 0, tipo: .ouro),
            .init(quantidade: 0, tipo: .platina)
        ]
        
        if classe.riquezaInicial.tipo != .none {
            let index: Int = riquezas.firstIndex(where: { $0.tipo == classe.riquezaInicial.tipo })!
            riquezas[index].quantidade += classe.riquezaInicial.quantidade
        }
        
        if antecedente.dinheiroInicial.tipo != .none {
            let index: Int = riquezas.firstIndex(where: { $0.tipo == antecedente.dinheiroInicial.tipo })!
            riquezas[index].quantidade += antecedente.dinheiroInicial.quantidade
        }
        
        return riquezas
    }
    
    //MARK: CLASSE ARMADURA
    private func classeArmadura(valoresAtributos: ValoresAtributos) -> Int {
        let modDestreza: Int = valoresAtributos.destreza.modificador
        
        return 10 + modDestreza
    }
    
    //MARK: VIDA MAXIMA
    private func vidaMaxima(classe: ClasseFinal, valoresAtributos: ValoresAtributos) -> Int {
        let modConstituicao = valoresAtributos.constituicao.modificador
        
        return classe.vidaInicial + modConstituicao
    }
    
    //MARK: PROF PERICIAS
    private func profPericias(classe: ClasseFinal, raca: RacaFinal, antecedente: AntecedenteFinal) -> [Pericia] {
        var pericias: [Pericia] = []
        
        return pericias
    }
    
    //MARK: PROF ARMAS
    private func profArmas(classe: ClasseFinal, raca: RacaFinal) -> [ArmaJSON] {
        var armas: [ArmaJSON] = []
        
        return armas
    }
    
    //MARK: PROF ARMADURAS
    private func profArmaduras(classe: ClasseFinal, raca: RacaFinal) -> [ArmaduraJSON] {
        var armaduras: [ArmaduraJSON] = []
        
        return armaduras
    }
    
    //MARK: PROF FERRAMENTAS
    private func profFerramentas(classe: ClasseFinal, raca: RacaFinal, antecedente: AntecedenteFinal) -> [FerramentaJSON] {
        var ferramentas: [FerramentaJSON] = []
        
        return ferramentas
    }
}
