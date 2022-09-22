//
//  ClasseDirector.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 22/09/22.
//

import Foundation

public class FactoryMagiasConhecidas {
    
    public static func criarMagiasComTudo(classe: ClassePersonagem, limiteTruePorNivel: [Int]) -> [MagiasConhecidas] {
        guard let magias = JsonFileUtil.getDataFromFiles(folder: "magia", decoder: MagiaJSON.self) as? [MagiaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        var contador = 0
        for magia in magias {
            contador = (magia.classes.contains(classe)) ? contador + 1 : contador
        }
        
        return criarMagiasComLimite(classe: classe, limiteTruquePorNivel: limiteTruePorNivel, limiteMagia: Array<Int>.init(repeating: contador, count: 20))
    }
    
    public static func criarMagiasComLimite(classe: ClassePersonagem, limiteTruquePorNivel: [Int], limiteMagia: [Int]) -> [MagiasConhecidas] {
        var arr: [MagiasConhecidas] = []
        
        for i in 1...20 {
            arr.append(MagiasConhecidas(nivel: i, quantiaTruques: limiteTruquePorNivel[i - 1], quantiaMagias: limiteMagia[i - 1]))
        }
        
        return arr
    }
    
}

public class FactoryEspacosDeMagia {
    public static func criarEspacosDeMagia(circulosPorNivel: [Int]) -> [EspacosDeMagias] {
        var espacosMagia: [EspacosDeMagias] = []
        
        if circulosPorNivel.count == 20 {
            for nivel in 1 ... circulosPorNivel.count {
                espacosMagia.append(EspacosDeMagias(nivelPersonagem: nivel, niveisCirculo: []))
            }
        }
        
        else {
            print("Erro ao criar Factory de epsacos de magia. CirculoPorNivel deve ser == 20")
        }
        
        return espacosMagia
    }
}

//public class OpcaoEquipamentoMultiplo {
//    public static func addMultiploEquipamento<T:Json>(equipamento: T, quantidade: Int) -> [T] {
//        var equipamentos: [T] = []
//        for _ in 1 ... quantidade {
//            equipamentos.append(equipamento)
//        }
//
//        return equipamentos
//    }
//}

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
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .BB_caminhoFurioso, caracteristicas: caracFurioso),
            SubClasseEscolha(subclase: .BB_caminhoGuerreiroTotemico, caracteristicas: caracTotemico)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        
        let periciasProficientes: [Pericia] = [.adestrarAnimais, .atletismo, .intimidacao, .natureza, .percepcao, .sobrevivencia]
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d12")
        
        builder?.setProfSalvaguarda([.forca, .constituicao])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        
        builder?.setArmasIniciais(armasIniciais) // VER OPCOES DE PLAYER
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        
        builder?.setProfPericias(periciasProficientes) // definir pericias
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(false)
        
        builder?.setPontosEspecificosNumericos([
            PontoEspecificoNumerico(nomeValor: "Fúria", valorNumericoInicial: 2)
        ])
        
        builder?.setPontosEspecificosTexto([
            PontoEspecificoTexto(nomeValor: "Dano de Fúria", valorTexturalInicial: "+2")
        ])
        
    }
    
    //MARK: BARDO
    private func makeBardo() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // bardo tem 2 subclasses
        // array do json caracteristicas aqui
        let caracConhecimento = ["SC1", "SC2"]
        let caracBravura = ["SC1", "SC2"]
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .BD_colegioConhecimento, caracteristicas: caracConhecimento),
            SubClasseEscolha(subclase: .BD_colegioBravura, caracteristicas: caracBravura)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        let ferramentasIniciais: [FerramentaJSON] = []
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComLimite(classe: .bardo, limiteTruquePorNivel: [2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4], limiteMagia: [4,5,6,7,8,9,10,11,12,14,15,15,16,18,19,19,20,22,22,22])
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d8")
        
        builder?.setProfSalvaguarda([.destreza, .carisma])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        builder?.setProfFerramentas(ferramentasProficientes)
        
        builder?.setArmasIniciais(armasIniciais)
        builder?.setArmadurasIniciais(armadurasIniciais)
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        builder?.setFerramentasIniciais(ferramentasIniciais)
        
        builder?.setProfPericias(Pericia.allCases)
        builder?.setQuantiaEscolhaProfPericia(3)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
    }
    
    //MARK: BRUXO
    private func makeBruxo() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // bruxo tem 3 subclasses
        // array do json caracteristicas aqui
        let caracArquifada = ["SC1", "SC2"]
        let caracCorruptor = ["SC1", "SC2"]
        let caracAntigo = ["SC1", "SC2"]
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .BX_arquifada, caracteristicas: caracArquifada),
            SubClasseEscolha(subclase: .BX_corruptor, caracteristicas: caracCorruptor),
            SubClasseEscolha(subclase: .BX_grandeAntigo, caracteristicas: caracAntigo)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        
        let periciasProficientes: [Pericia] = [.arcanismo, .enganacao, .historia, .intimidacao, .investigacao, .natureza, .religiao]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComLimite(classe: .bruxo, limiteTruquePorNivel: [2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4], limiteMagia: [2,3,4,5,6,7,8,9,10,10,11,11,12,12,13,13,14,14,15,15])
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d8")
        
        builder?.setProfSalvaguarda([.sabedoria, .carisma])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        
        builder?.setArmasIniciais(armasIniciais)
        builder?.setArmadurasIniciais(armadurasIniciais)
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
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
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .CL_dominioConhecimento, caracteristicas: caracConhecimento),
            SubClasseEscolha(subclase: .CL_dominioEnganacao, caracteristicas: caracEnganacao),
            SubClasseEscolha(subclase: .CL_dominioGuerra, caracteristicas: caracGuerra),
            SubClasseEscolha(subclase: .CL_dominioLuz, caracteristicas: caracLuz),
            SubClasseEscolha(subclase: .CL_domonioNatureza, caracteristicas: caracNatureza),
            SubClasseEscolha(subclase: .CL_dominioTempestade, caracteristicas: caracTempestade),
            SubClasseEscolha(subclase: .CL_dominioVida, caracteristicas: caracVida)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        
        let periciasProficientes: [Pericia] = [.historia, .intuicao, .medicina, .persuasao, .religiao]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComTudo(classe: .clerigo, limiteTruePorNivel: [3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5])
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d8")
        
        builder?.setProfSalvaguarda([.sabedoria, .carisma])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        
        builder?.setArmasIniciais(armasIniciais)
        builder?.setArmadurasIniciais(armadurasIniciais)
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
    }
    
    //MARK: DRUIDA
    private func makeDruida() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // druida tem 2 subclasses
        // array do json caracteristicas aqui
        let caracTerra = ["SC1", "SC2"]
        let caracLua = ["SC1", "SC2"]
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .DR_circuloTerra, caracteristicas: caracTerra),
            SubClasseEscolha(subclase: .DR_circuloLua, caracteristicas: caracLua)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        
        let periciasProficientes: [Pericia] = [.adestrarAnimais, .arcanismo, .intuicao, .medicina, .natureza, .percepcao, .religiao, .sobrevivencia]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComTudo(classe: .druida, limiteTruePorNivel: [2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4])
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d8")
        
        builder?.setProfSalvaguarda([.inteligencia, .sabedoria])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        builder?.setProfFerramentas(ferramentasProficientes)
        
        builder?.setArmasIniciais(armasIniciais)
        builder?.setArmadurasIniciais(armadurasIniciais)
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
    }
    
    //MARK: FEITICEIRO
    private func makeFeiticeiro() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // feiticeiro tem 2 subclasses
        // array do json caracteristicas aqui
        let caracDraconica = ["SC1", "SC2"]
        let caracSelvagem = ["SC1", "SC2"]
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .FE_linhagemDraconica, caracteristicas: caracDraconica),
            SubClasseEscolha(subclase: .FE_magiaSelvagem, caracteristicas: caracSelvagem)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        
        let periciasProficientes: [Pericia] = [.arcanismo, .enganacao, .intimidacao, .intuicao, .persuasao, .religiao]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComLimite(classe: .feiticeiro, limiteTruquePorNivel: [4,4,4,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6], limiteMagia: [2,3,4,5,6,7,8,9,10,11,12,12,13,13,14,14,15,15,15,15])
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d6")
        
        builder?.setProfSalvaguarda([.constituicao, .carisma])
        builder?.setProfArmas(armasProficientes)
        
        builder?.setArmasIniciais(armasIniciais)
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
    }
    
    //MARK: GUERREIRO
    private func makeGuerreiro() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // guerreiro tem 3 subclasses
        // array do json caracteristicas aqui
        let caracCampeao = ["SC1", "SC2"]
        let caracArcano = ["SC1", "SC2"]
        let caracMestre = ["SC1", "SC2"]
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .GU_campeao, caracteristicas: caracCampeao),
            SubClasseEscolha(subclase: .GU_cavaleiroArcano, caracteristicas: caracArcano),
            SubClasseEscolha(subclase: .GU_mestreBatalha, caracteristicas: caracMestre)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        
        let periciasProficientes: [Pericia] = [.acrobacia, .adestrarAnimais, .atletismo, .historia, .intimidacao, .intuicao, .percepcao, .sobrevivencia]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComLimite(classe: .guerreiro, limiteTruquePorNivel: [0,0,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3], limiteMagia: [0,0,3,4,4,4,5,6,6,7,8,8,9,10,10,11,11,11,12,13])
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d10")
        
        builder?.setProfSalvaguarda([.forca, .constituicao])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        
        builder?.setArmasIniciais(armasIniciais)
        builder?.setArmadurasIniciais(armadurasIniciais)
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(true)
        builder?.setSubclasseComMagia(.GU_cavaleiroArcano)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
    }
    
    //MARK: LADINO
    private func makeLadino() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // ladino tem 3 subclasses
        // array do json caracteristicas aqui
        let caracAssassino = ["SC1", "SC2"]
        let caracLadrao = ["SC1", "SC2"]
        let caracArcano = ["SC1", "SC2"]
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .LA_assassino, caracteristicas: caracAssassino),
            SubClasseEscolha(subclase: .LA_ladrao, caracteristicas: caracLadrao),
            SubClasseEscolha(subclase: .LA_trapaceiroArcano, caracteristicas: caracArcano)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        let ferramentasIniciais: [FerramentaJSON] = []
        
        let periciasProficientes: [Pericia] = [.acrobacia, .atletismo, .atuacao, .enganacao, .furtividade, .intimidacao, .intuicao, .investigacao, .percepcao, .persuasao, .prestidigitacao]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComLimite(classe: .ladino, limiteTruquePorNivel: [0,0,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4], limiteMagia: [0,0,3,4,4,4,5,6,6,7,8,8,9,10,10,11,11,11,12,13])
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d8")
        
        builder?.setProfSalvaguarda([.destreza, .inteligencia])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        builder?.setProfFerramentas(ferramentasProficientes)
        
        builder?.setArmasIniciais(armasIniciais)
        builder?.setArmadurasIniciais(armadurasIniciais)
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        builder?.setFerramentasIniciais(ferramentasIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(4)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(true)
        builder?.setSubclasseComMagia(.LA_trapaceiroArcano)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
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
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .MA_escolaAbjuracao, caracteristicas: caracAbjuracao),
            SubClasseEscolha(subclase: .MA_escolaAdivinhacao, caracteristicas: caracAdivinhacao),
            SubClasseEscolha(subclase: .MA_escolaConjuracao, caracteristicas: caracConjuracao),
            SubClasseEscolha(subclase: .MA_escolaEvocacao, caracteristicas: caracEvocacao),
            SubClasseEscolha(subclase: .MA_escolaIlusao, caracteristicas: caracIlusao),
            SubClasseEscolha(subclase: .MA_escolaNecromancia, caracteristicas: caracNecromancia),
            SubClasseEscolha(subclase: .MA_escolaTransmutacao, caracteristicas: caracTransmutacao)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        
        let periciasProficientes: [Pericia] = [.arcanismo, .historia, .intuicao, .investigacao, .medicina, .religiao]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComTudo(classe: .mago, limiteTruePorNivel: [3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5])
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d6")
        
        builder?.setProfSalvaguarda([.inteligencia, .sabedoria])
        builder?.setProfArmas(armasProficientes)
        
        builder?.setArmasIniciais(armasIniciais)
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
    }
    
    //MARK: MONGE
    private func makeMonge() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // monge tem 3 subclasses
        // array do json caracteristicas aqui
        let caracMaoAberta = ["SC1", "SC2"]
        let caracSombra = ["SC1", "SC2"]
        let caracElementos = ["SC1", "SC2"]
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .MO_caminhoMaoAberta, caracteristicas: caracMaoAberta),
            SubClasseEscolha(subclase: .MO_caminhoSombra, caracteristicas: caracSombra),
            SubClasseEscolha(subclase: .MO_caminhoQuatroElementos, caracteristicas: caracElementos)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let ferramentasProficientes: [FerramentaJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        
        let periciasProficientes: [Pericia] = [.acrobacia, .atletismo, .furtividade, .historia, .intuicao, .religiao]
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d8")
        
        builder?.setProfSalvaguarda([.forca, .destreza])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfFerramentas(ferramentasProficientes)
        
        builder?.setArmasIniciais(armasIniciais)
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(false)
    }
    
    //MARK: PALADINO
    private func makePaladino() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // paladino tem 3 subclasses
        // array do json caracteristicas aqui
        let caracDevocao = ["SC1", "SC2"]
        let caracAncioes = ["SC1", "SC2"]
        let caracVinganca = ["SC1", "SC2"]
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .PD_juramentoDevocao, caracteristicas: caracDevocao),
            SubClasseEscolha(subclase: .PD_juramentoAncioes, caracteristicas: caracAncioes),
            SubClasseEscolha(subclase: .PD_juramentoVinganca, caracteristicas: caracVinganca)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        
        let periciasProficientes: [Pericia] = [.atletismo, .intimidacao, .intuicao, .medicina, .persuasao, .religiao]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComTudo(classe: .paladino, limiteTruePorNivel: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d10")
        
        builder?.setProfSalvaguarda([.sabedoria, .carisma])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        
        builder?.setArmasIniciais(armasIniciais)
        builder?.setArmadurasIniciais(armadurasIniciais)
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
    }
    
    //MARK: PATRULHEIRO
    private func makePatrulheiro() {
        let caracteristicasClasse = ["C1", "C2"] // array do json caracteristicas aqui
        
        // patrulheiro tem 3 subclasses
        // array do json caracteristicas aqui
        let caracBesta = ["SC1", "SC2"]
        let caracCacador = ["SC1", "SC2"]
        let caracSubterraneo = ["SC1", "SC2"]
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .PT_conclaveBesta, caracteristicas: caracBesta),
            SubClasseEscolha(subclase: .PT_conclaveCacador, caracteristicas: caracCacador),
            SubClasseEscolha(subclase: .PT_conclaveRastreadorSubterraneo, caracteristicas: caracSubterraneo)
        ]
        
        let armasProficientes: [ArmaJSON] = []
        let armadurasProficientes: [ArmaduraJSON] = []
        
        let armasIniciais: [ArmaJSON] = []
        let armadurasIniciais: [ArmaduraJSON] = []
        let equipamentosIniciais: [EquipamentoJSON] = []
        
        let periciasProficientes: [Pericia] = [.adestrarAnimais, .atletismo, .furtividade, .intuicao, .investigacao, .natureza, .percepcao, .sobrevivencia]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComLimite(classe: .patrulheiro, limiteTruquePorNivel: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], limiteMagia: [0,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11])
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d10")
        
        builder?.setProfSalvaguarda([.forca, .destreza])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        
        builder?.setArmasIniciais(armasIniciais)
        builder?.setArmadurasIniciais(armadurasIniciais)
        builder?.setEquipamentosIniciais(equipamentosIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(3)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
    }
}
