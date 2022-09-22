//
//  ClasseDirector.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 22/09/22.
//

import Foundation

public class ClasseDirector {
    private var builder: ClasseBuilder?
    
    func newBuilder(classeBuilder: ClasseBuilder){
        self.builder = classeBuilder
    }
    
    //MARK: Make Classe
    func makeClasse(classe: ClassePersonagem) {
        builder?.setClasse(classe: classe)
        builder?.setNomeClasse()
        
        switch builder?.getClassePersonagem() {
        case .barbaro:
            makeBarbaro()
            break
            
        case .bardo:
            makeBardo()
            break
            
        case .bruxo:
            makeBruxo()
            break
            
        case .clerigo:
            makeClerigo()
            break
            
        case .druida:
            makeDruida()
            break
            
        case .feiticeiro:
            makeFeiticeiro()
            break
            
        case .guerreiro:
            makeGuerreiro()
            break
            
        case .ladino:
            makeLadino()
            break
            
        case .mago:
            makeMago()
            break
            
        case .monge:
            makeMonge()
            break
            
        case .paladino:
            makePaladino()
            break
            
        case .patrulheiro:
            makePatrulheiro()
            break
            
        default:
            print("Por algum motivo, entrou no default do switch de classes do ClasseDirector.")
            break
        }
    }
    
    //MARK: BARBARO
    private func makeBarbaro() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // barbaro tem 2 subclasses
        // array do json caracteristicas aqui
        let caracFurioso = ["SC1", "SC2"]
        let caracTotemico = ["SC1", "SC2"]
        
        let subclasses: [SubClasse] = [
            SubClasse(subclase: .BB_caminhoFurioso, caracteristicas: caracFurioso),
            SubClasse(subclase: .BB_caminhoGuerreiroTotemico, caracteristicas: caracTotemico)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d12")
        builder?.setProfSalvaguarda([.forca, .constituicao])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        builder?.setArmasIniciais(armasIniciais) // VER OPCOES DE PLAYER
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        builder?.setProfPericias([])
        builder?.setPossuiMagias(false)
        
        builder?.setPontosEspecificosNumericos([
            PontoEspecificoNumerico(nomeValor: "Fúria", valorNumericoInicial: 2)
        ])
        
        builder?.setPontosEspecificosTexto([
            PontoEspecificoTexto(nomeValor: "Dano de Fúria", valorTexturalInicial: "+2")
        ])
        
        builder?.setRiquezaInicial(0) // JOGADOR DEFINE
        
    }
    
    //MARK: BARDO
    private func makeBardo() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // bardo tem 2 subclasses
        // array do json caracteristicas aqui
        let caracConhecimento = ["SC1", "SC2"]
        let caracBravura = ["SC1", "SC2"]
        
        let subclasses: [SubClasse] = [
            SubClasse(subclase: .BD_colegioConhecimento, caracteristicas: caracConhecimento),
            SubClasse(subclase: .BD_colegioBravura, caracteristicas: caracBravura)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        let ferramentasIniciais: [FerramentaJSON] = []
    }
    
    //MARK: BRUXO
    private func makeBruxo() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // bruxo tem 3 subclasses
        // array do json caracteristicas aqui
        let caracArquifada = ["SC1", "SC2"]
        let caracCorruptor = ["SC1", "SC2"]
        let caracAntigo = ["SC1", "SC2"]
        
        let subclasses: [SubClasse] = [
            SubClasse(subclase: .BX_arquifada, caracteristicas: caracArquifada),
            SubClasse(subclase: .BX_corruptor, caracteristicas: caracCorruptor),
            SubClasse(subclase: .BX_grandeAntigo, caracteristicas: caracAntigo)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        let ferramentasIniciais: [FerramentaJSON] = []
    }
    
    //MARK: CLERIGO
    private func makeClerigo() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // clerigo tem 7 subclasses
        // array do json caracteristicas aqui
        let caracConhecimento = ["SC1", "SC2"]
        let caracEnganacao = ["SC1", "SC2"]
        let caracGuerra = ["SC1", "SC2"]
        let caracLuz = ["SC1", "SC2"]
        let caracNatureza = ["SC1", "SC2"]
        let caracTempestade = ["SC1", "SC2"]
        let caracVida = ["SC1", "SC2"]
        
        let subclasses: [SubClasse] = [
            SubClasse(subclase: .CL_dominioConhecimento, caracteristicas: caracConhecimento),
            SubClasse(subclase: .CL_dominioEnganacao, caracteristicas: caracEnganacao),
            SubClasse(subclase: .CL_dominioGuerra, caracteristicas: caracGuerra),
            SubClasse(subclase: .CL_dominioLuz, caracteristicas: caracLuz),
            SubClasse(subclase: .CL_domonioNatureza, caracteristicas: caracNatureza),
            SubClasse(subclase: .CL_dominioTempestade, caracteristicas: caracTempestade),
            SubClasse(subclase: .CL_dominioVida, caracteristicas: caracVida)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        let ferramentasIniciais: [FerramentaJSON] = []
    }
    
    //MARK: DRUIDA
    private func makeDruida() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // druida tem 2 subclasses
        // array do json caracteristicas aqui
        let caracTerra = ["SC1", "SC2"]
        let caracLua = ["SC1", "SC2"]
        
        let subclasses: [SubClasse] = [
            SubClasse(subclase: .DR_circuloTerra, caracteristicas: caracTerra),
            SubClasse(subclase: .DR_circuloLua, caracteristicas: caracLua)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        let ferramentasIniciais: [FerramentaJSON] = []
    }
    
    //MARK: FEITICEIRO
    private func makeFeiticeiro() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // feiticeiro tem 2 subclasses
        // array do json caracteristicas aqui
        let caracDraconica = ["SC1", "SC2"]
        let caracSelvagem = ["SC1", "SC2"]
        
        let subclasses: [SubClasse] = [
            SubClasse(subclase: .FE_linhagemDraconica, caracteristicas: caracDraconica),
            SubClasse(subclase: .FE_magiaSelvagem, caracteristicas: caracSelvagem)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        let ferramentasIniciais: [FerramentaJSON] = []
    }
    
    //MARK: GUERREIRO
    private func makeGuerreiro() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // guerreiro tem 3 subclasses
        // array do json caracteristicas aqui
        let caracCampeao = ["SC1", "SC2"]
        let caracArcano = ["SC1", "SC2"]
        let caracMestre = ["SC1", "SC2"]
        
        let subclasses: [SubClasse] = [
            SubClasse(subclase: .GU_campeao, caracteristicas: caracCampeao),
            SubClasse(subclase: .GU_cavaleiroArcano, caracteristicas: caracArcano),
            SubClasse(subclase: .GU_mestreBatalha, caracteristicas: caracMestre)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        let ferramentasIniciais: [FerramentaJSON] = []
    }
    
    //MARK: LADINO
    private func makeLadino() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // ladino tem 3 subclasses
        // array do json caracteristicas aqui
        let caracAssassino = ["SC1", "SC2"]
        let caracLadrao = ["SC1", "SC2"]
        let caracArcano = ["SC1", "SC2"]
        
        let subclasses: [SubClasse] = [
            SubClasse(subclase: .LA_assassino, caracteristicas: caracAssassino),
            SubClasse(subclase: .LA_ladrao, caracteristicas: caracLadrao),
            SubClasse(subclase: .LA_trapaceiroArcano, caracteristicas: caracArcano)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        let ferramentasIniciais: [FerramentaJSON] = []
    }
    
    //MARK: MAGO
    private func makeMago() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // mago tem 7 subclasses
        // array do json caracteristicas aqui
        let caracAbjuracao = ["SC1", "SC2"]
        let caracAdivinhacao = ["SC1", "SC2"]
        let caracConjuracao = ["SC1", "SC2"]
        let caracEvocacao = ["SC1", "SC2"]
        let caracIlusao = ["SC1", "SC2"]
        let caracNecromancia = ["SC1", "SC2"]
        let caracTransmutacao = ["SC1", "SC2"]
        
        let subclasses: [SubClasse] = [
            SubClasse(subclase: .MA_escolaAbjuracao, caracteristicas: caracAbjuracao),
            SubClasse(subclase: .MA_escolaAdivinhacao, caracteristicas: caracAdivinhacao),
            SubClasse(subclase: .MA_escolaConjuracao, caracteristicas: caracConjuracao),
            SubClasse(subclase: .MA_escolaEvocacao, caracteristicas: caracEvocacao),
            SubClasse(subclase: .MA_escolaIlusao, caracteristicas: caracIlusao),
            SubClasse(subclase: .MA_escolaNecromancia, caracteristicas: caracNecromancia),
            SubClasse(subclase: .MA_escolaTransmutacao, caracteristicas: caracTransmutacao)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        let ferramentasIniciais: [FerramentaJSON] = []
    }
    
    //MARK: MONGE
    private func makeMonge() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // monge tem 3 subclasses
        // array do json caracteristicas aqui
        let caracMaoAberta = ["SC1", "SC2"]
        let caracSombra = ["SC1", "SC2"]
        let caracElementos = ["SC1", "SC2"]
        
        let subclasses: [SubClasse] = [
            SubClasse(subclase: .MO_caminhoMaoAberta, caracteristicas: caracMaoAberta),
            SubClasse(subclase: .MO_caminhoSombra, caracteristicas: caracSombra),
            SubClasse(subclase: .MO_caminhoQuatroElementos, caracteristicas: caracElementos)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        let ferramentasIniciais: [FerramentaJSON] = []
    }
    
    //MARK: PALADINO
    private func makePaladino() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // paladino tem 3 subclasses
        // array do json caracteristicas aqui
        let caracDevocao = ["SC1", "SC2"]
        let caracAncioes = ["SC1", "SC2"]
        let caracVinganca = ["SC1", "SC2"]
        
        let subclasses: [SubClasse] = [
            SubClasse(subclase: .PD_juramentoDevocao, caracteristicas: caracDevocao),
            SubClasse(subclase: .PD_juramentoAncioes, caracteristicas: caracAncioes),
            SubClasse(subclase: .PD_juramentoVinganca, caracteristicas: caracVinganca)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        let ferramentasIniciais: [FerramentaJSON] = []
    }
    
    //MARK: PATRULHEIRO
    private func makePatrulheiro() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // patrulheiro tem 3 subclasses
        // array do json caracteristicas aqui
        let caracBesta = ["SC1", "SC2"]
        let caracCacador = ["SC1", "SC2"]
        let caracSubterraneo = ["SC1", "SC2"]
        
        let subclasses: [SubClasse] = [
            SubClasse(subclase: .PT_conclaveBesta, caracteristicas: caracBesta),
            SubClasse(subclase: .PT_conclaveCacador, caracteristicas: caracCacador),
            SubClasse(subclase: .PT_conclaveRastreadorSubterraneo, caracteristicas: caracSubterraneo)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        let ferramentasIniciais: [FerramentaJSON] = []
    }
}
