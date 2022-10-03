//
//  ClasseDirector.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 22/09/22.
//

import Foundation

public class FactoryMagiasConhecidas : Codable {
    
    public static func criarMagiasComTudo(classe: ClassePersonagem, limiteTruePorNivel: [Int]) -> [MagiasConhecidas] {
        guard let magias = JsonFileUtil.getDataFromBundle(folder: .magia, decoder: MagiaJSON.self) as? [MagiaJSON] else {
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
    
    public static func criarEspacosDeMagiaPiramide() -> [EspacosDeMagias] {
        var espacosMagia: [EspacosDeMagias] = []
        
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 1, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 2, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 3, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2], limiteUsoMagia: [4, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 4, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2], limiteUsoMagia: [4, 3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 5, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3], limiteUsoMagia: [4, 3, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 6, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3], limiteUsoMagia: [4, 3, 3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 7, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4], limiteUsoMagia: [4, 3, 3, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 8, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4], limiteUsoMagia: [4, 3, 3, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 9, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5], limiteUsoMagia: [4, 3, 3, 3, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 10, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5], limiteUsoMagia: [4, 3, 3, 3, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 11, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5, 6], limiteUsoMagia: [4, 3, 3, 3, 2, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 12, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5, 6], limiteUsoMagia: [4, 3, 3, 3, 2, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 13, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5, 6, 7], limiteUsoMagia: [4, 3, 3, 3, 2, 1, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 14, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5, 6, 7], limiteUsoMagia: [4, 3, 3, 3, 2, 1, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 15, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5, 6, 7, 8], limiteUsoMagia: [4, 3, 3, 3, 2, 1, 1, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 16, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5, 6, 7, 8], limiteUsoMagia: [4, 3, 3, 3, 2, 1, 1, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 17, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5, 6, 7, 8, 9], limiteUsoMagia: [4, 3, 3, 3, 2, 1, 1, 1, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 18, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5, 6, 7, 8, 9], limiteUsoMagia: [4, 3, 3, 3, 3, 1, 1, 1, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 19, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5, 6, 7, 8, 9], limiteUsoMagia: [4, 3, 3, 3, 3, 2, 1, 1, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 20, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5, 6, 7, 8, 9], limiteUsoMagia: [4, 3, 3, 3, 3, 2, 2, 1, 1])))
        
        return espacosMagia
    }
    
    public static func criarEspacosDeMagiaMetade() -> [EspacosDeMagias] {
        var espacosMagia: [EspacosDeMagias] = []
        
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 1, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [0])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 2, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 3, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 4, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 5, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2], limiteUsoMagia: [4, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 6, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2], limiteUsoMagia: [4, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 7, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2], limiteUsoMagia: [4, 3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 8, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2], limiteUsoMagia: [4, 3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 9, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3], limiteUsoMagia: [4, 3, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 10, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3], limiteUsoMagia: [4, 3, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 11, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3], limiteUsoMagia: [4, 3, 3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 12, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3], limiteUsoMagia: [4, 3, 3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 13, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4], limiteUsoMagia: [4, 3, 3, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 14, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4], limiteUsoMagia: [4, 3, 3, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 15, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4], limiteUsoMagia: [4, 3, 3, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 16, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4], limiteUsoMagia: [4, 3, 3, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 17, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5], limiteUsoMagia: [4, 3, 3, 3, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 18, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5], limiteUsoMagia: [4, 3, 3, 3, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 19, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5], limiteUsoMagia: [4, 3, 3, 3, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 20, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4, 5], limiteUsoMagia: [4, 3, 3, 3, 2])))
        
        return espacosMagia
    }
    
    public static func criarEspacosDeMagiaPequeno() -> [EspacosDeMagias] {
        var espacosMagia: [EspacosDeMagias] = []
        
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 1, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [0])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 2, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [0])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 3, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 4, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 5, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 6, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 7, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2], limiteUsoMagia: [4, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 8, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2], limiteUsoMagia: [4, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 9, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2], limiteUsoMagia: [4, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 10, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2], limiteUsoMagia: [4, 3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 11, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2], limiteUsoMagia: [4, 3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 12, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2], limiteUsoMagia: [4, 3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 13, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3], limiteUsoMagia: [4, 3, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 14, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3], limiteUsoMagia: [4, 3, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 15, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3], limiteUsoMagia: [4, 3, 2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 16, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3], limiteUsoMagia: [4, 3, 3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 17, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3], limiteUsoMagia: [4, 3, 3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 18, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3], limiteUsoMagia: [4, 3, 3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 19, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4], limiteUsoMagia: [4, 3, 3, 1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 20, niveisCirculo: CirculoMagico(nivelCirculo: [1, 2, 3, 4], limiteUsoMagia: [4, 3, 3, 1])))
        
        return espacosMagia
    }
    
    public static func criarEspacosDeMagiaBruxo() -> [EspacosDeMagias] {
        var espacosMagia: [EspacosDeMagias] = []
        
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 1, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [1])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 2, niveisCirculo: CirculoMagico(nivelCirculo: [1], limiteUsoMagia: [2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 3, niveisCirculo: CirculoMagico(nivelCirculo: [2], limiteUsoMagia: [2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 4, niveisCirculo: CirculoMagico(nivelCirculo: [2], limiteUsoMagia: [2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 5, niveisCirculo: CirculoMagico(nivelCirculo: [3], limiteUsoMagia: [2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 6, niveisCirculo: CirculoMagico(nivelCirculo: [3], limiteUsoMagia: [2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 7, niveisCirculo: CirculoMagico(nivelCirculo: [4], limiteUsoMagia: [2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 8, niveisCirculo: CirculoMagico(nivelCirculo: [4], limiteUsoMagia: [2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 9, niveisCirculo: CirculoMagico(nivelCirculo: [5], limiteUsoMagia: [2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 10, niveisCirculo: CirculoMagico(nivelCirculo: [5], limiteUsoMagia: [2])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 11, niveisCirculo: CirculoMagico(nivelCirculo: [5], limiteUsoMagia: [3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 12, niveisCirculo: CirculoMagico(nivelCirculo: [5], limiteUsoMagia: [3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 13, niveisCirculo: CirculoMagico(nivelCirculo: [5], limiteUsoMagia: [3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 14, niveisCirculo: CirculoMagico(nivelCirculo: [5], limiteUsoMagia: [3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 15, niveisCirculo: CirculoMagico(nivelCirculo: [5], limiteUsoMagia: [3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 16, niveisCirculo: CirculoMagico(nivelCirculo: [5], limiteUsoMagia: [3])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 17, niveisCirculo: CirculoMagico(nivelCirculo: [5], limiteUsoMagia: [4])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 18, niveisCirculo: CirculoMagico(nivelCirculo: [5], limiteUsoMagia: [4])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 19, niveisCirculo: CirculoMagico(nivelCirculo: [5], limiteUsoMagia: [4])))
        espacosMagia.append(EspacosDeMagias(nivelPersonagem: 20, niveisCirculo: CirculoMagico(nivelCirculo: [5], limiteUsoMagia: [4])))
        
        return espacosMagia
    }
    
}

//MARK: DIRECTOR
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
        let caracteristicasClasse: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorClasse(classe: .barbaro)
        
        // barbaro tem 2 subclasses
        // array do json caracteristicas aqui
        let caracFurioso: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .BB_caminhoFurioso)
        let caracTotemico: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .BB_caminhoGuerreiroTotemico)
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .BB_caminhoFurioso, caracteristicas: caracFurioso),
            SubClasseEscolha(subclase: .BB_caminhoGuerreiroTotemico, caracteristicas: caracTotemico)
        ]
        
        let armasProficientes: [ArmaJSON] = BuscaJson.buscaArmaTodos()
        let armadurasProficientes: [ArmaduraJSON] = BuscaJson.buscaArmadurasPorTipos(tipos: [.leve, .media, .escudo])
        
        let armasIniciais: [ArmaJSON] = BuscaJson.buscaArmaPorNomeQuantidade(nome: "Azagaia", quantidade: 4)
        let pacotesIniciais: [PacoteEquipamento] = [PacoteEquipamento.pacoteAventureiro]
        
        let periciasProficientes: [Pericia] = [.adestrarAnimais, .atletismo, .intimidacao, .natureza, .percepcao, .sobrevivencia]
        
        var opcao1: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha2: [String] = BuscaArma.buscaArmaTipoEstilo(tipo: .marcial, estilo: .cac, nomeExcluso: "")
            
            for arma in armasEscolha2 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao2: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha2: [String] = BuscaArma.buscaArmaTipo(tipo: .simples, nomeExcluso: "Machadinha")
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Machadinha", quantia: 2, tipo: .arma)]))
            
            for arma in armasEscolha2 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d12")
        
        builder?.setVidaInicial(12)
        builder?.setVidasSeguintes("1d12 ou 7")
        builder?.setRiquezaInicial("2d4 x 10")
        
        builder?.setProfSalvaguarda([.forca, .constituicao])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        
        builder?.setOpcoes(opcoes: [opcao1, opcao2])
        builder?.setArmasIniciais(armas: armasIniciais)
        builder?.setPacotesIniciais(pacotes: pacotesIniciais)
        
        builder?.setProfPericias(periciasProficientes) // definir pericias
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(false)
        
        builder?.setPontosEspecificosNumericos([
            PontoEspecificoNumerico(nomeValor: "Fúria", valorPorNivel: [2, 2, 3, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 99])
        ])
        
        builder?.setPontosEspecificosTexto([
            PontoEspecificoTexto(nomeValor: "Dano de Fúria", textoPorNivel: ["+2", "+2", "+2", "+2", "+2", "+2", "+2", "+2", "+3", "+3", "+3", "+3", "+3", "+3", "+3", "+4", "+4", "+4", "+4", "+4"])
        ])
        
    }
    
    //MARK: BARDO
    private func makeBardo() {
        let caracteristicasClasse: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorClasse(classe: .bardo)
        
        // bardo tem 2 subclasses
        // array do json caracteristicas aqui
        let caracConhecimento: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .BD_colegioConhecimento)
        let caracBravura: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .BD_colegioBravura)
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .BD_colegioConhecimento, caracteristicas: caracConhecimento),
            SubClasseEscolha(subclase: .BD_colegioBravura, caracteristicas: caracBravura)
        ]
        
        var armasProficientes: [ArmaJSON] = BuscaJson.buscaArmaTipo(tipo: .simples)
        armasProficientes.append(BuscaJson.buscaArmaPorNome(nome: "Besta de Mão"))
        armasProficientes.append(BuscaJson.buscaArmaPorNome(nome: "Espada Longa"))
        armasProficientes.append(BuscaJson.buscaArmaPorNome(nome: "Rapieira"))
        armasProficientes.append(BuscaJson.buscaArmaPorNome(nome: "Espada Curta"))
        
        let armadurasProficientes: [ArmaduraJSON] = BuscaJson.buscaArmadurasPorTipo(tipo: .leve)
        
        var escolhasProfFerramenta: [EscolhaOpcao] {
            var itensEscolha: [[ItemEscolha]] = []
            let ferramentas = BuscaFerramenta.buscaFerramentaTipo(tipo: .musical, nomeExcluso: "")
            
            for ferramenta in ferramentas {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: ferramenta, quantia: 1, tipo: .ferramenta)]))
            }
            
            return FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha)
        }
        
        var armasIniciais: [ArmaJSON] = []
        armasIniciais.append(BuscaJson.buscaArmaPorNome(nome: "Adaga"))
        
        var armadurasIniciais: [ArmaduraJSON] = []
        armadurasIniciais.append(BuscaJson.buscaArmaduraPorNome(nome: "Couro"))
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComLimite(classe: .bardo, limiteTruquePorNivel: [2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4], limiteMagia: [4,5,6,7,8,9,10,11,12,14,15,15,16,18,19,19,20,22,22,22])
        
        var opcao1: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha3: [String] = BuscaArma.buscaArmaTipo(tipo: .simples, nomeExcluso: "")
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Rapieira", quantia: 1, tipo: .arma)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Espada Longa", quantia: 1, tipo: .arma)]))
            
            for arma in armasEscolha3 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao2: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteDiplomata.rawValue, quantia: 1, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteArtista.rawValue, quantia: 1, tipo: .equipamento)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao3: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let ferramentasEscolha: [String] = BuscaFerramenta.buscaFerramentaTipo(tipo: .musical, nomeExcluso: "")
            
            for ferramenta in ferramentasEscolha {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: ferramenta, quantia: 1, tipo: .ferramenta)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d8")
        
        builder?.setVidaInicial(8)
        builder?.setVidasSeguintes("1d8 ou 5")
        builder?.setRiquezaInicial("5d4 x 10")
        
        builder?.setProfSalvaguarda([.destreza, .carisma])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        builder?.setEscolhasProficienciaFerramenta(escolhasProfFerramenta)
        
        builder?.setOpcoes(opcoes: [opcao1, opcao2, opcao3])
        builder?.setArmasIniciais(armas: armasIniciais)
        builder?.setArmadurasIniciais(armaduras: armadurasIniciais)
        
        builder?.setProfPericias(Pericia.allCases)
        builder?.setQuantiaEscolhaProfPericia(3)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
        builder?.setEspacosDeMagia(FactoryMagiasConhecidas.criarEspacosDeMagiaPiramide())
    }
    
    //MARK: BRUXO
    private func makeBruxo() {
        let caracteristicasClasse: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorClasse(classe: .bruxo)
        
        // bruxo tem 3 subclasses
        // array do json caracteristicas aqui
        let caracArquifada: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .BX_arquifada)
        let caracCorruptor: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .BX_corruptor)
        let caracAntigo: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .BX_grandeAntigo)
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .BX_arquifada, caracteristicas: caracArquifada),
            SubClasseEscolha(subclase: .BX_corruptor, caracteristicas: caracCorruptor),
            SubClasseEscolha(subclase: .BX_grandeAntigo, caracteristicas: caracAntigo)
        ]
        
        let armasProficientes: [ArmaJSON] = BuscaJson.buscaArmaTipo(tipo: .simples)
        let armadurasProficientes: [ArmaduraJSON] = BuscaJson.buscaArmadurasPorTipo(tipo: .leve)
        
        var armadurasIniciais: [ArmaduraJSON] = []
        armadurasIniciais.append(BuscaJson.buscaArmaduraPorNome(nome: "Couro"))
        
        let armasIniciais: [ArmaJSON] = BuscaJson.buscaArmaPorNomeQuantidade(nome: "Adaga", quantidade: 2)
        
        let periciasProficientes: [Pericia] = [.arcanismo, .enganacao, .historia, .intimidacao, .investigacao, .natureza, .religiao]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComLimite(classe: .bruxo, limiteTruquePorNivel: [2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4], limiteMagia: [2,3,4,5,6,7,8,9,10,10,11,11,12,12,13,13,14,14,15,15])
        
        var opcao1: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha2: [String] = BuscaArma.buscaArmaTipo(tipo: .simples, nomeExcluso: "Besta Leve")
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Besta Leve", quantia: 1, tipo: .arma), (item: "Virotes", quantia: 20, tipo: .equipamento)]))
            
            for arma in armasEscolha2 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao2: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let equipamentosEscolha2: [String] = BuscaEquipamento.buscaEquipamentoCategoria(categoria: .focoArcano, nomeExcluso: "")
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Bolsa de componentes", quantia: 1, tipo: .equipamento)]))
            
            for equipamento in equipamentosEscolha2 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: equipamento, quantia: 1, tipo: .equipamento)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao3: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteEstudioso.rawValue, quantia: 1, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteExplorador.rawValue, quantia: 1, tipo: .equipamento)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao4: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha: [String] = BuscaArma.buscaArmaTipo(tipo: .simples, nomeExcluso: "")
            
            for arma in armasEscolha {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d8")
        
        builder?.setVidaInicial(8)
        builder?.setVidasSeguintes("1d8 ou 5")
        builder?.setRiquezaInicial("4d4 x 10")
        
        builder?.setProfSalvaguarda([.sabedoria, .carisma])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        
        builder?.setOpcoes(opcoes: [opcao1, opcao2, opcao3, opcao4])
        builder?.setArmasIniciais(armas: armasIniciais)
        builder?.setArmadurasIniciais(armaduras: armadurasIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
        builder?.setEspacosDeMagia(FactoryMagiasConhecidas.criarEspacosDeMagiaBruxo())
        
        builder?.setPontosEspecificosNumericos([
            PontoEspecificoNumerico(nomeValor: "Invocações Conhecidas", valorPorNivel: [0, 2, 2, 3, 3, 4, 4 ,4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 8, 8, 8])
        ])
    }
    
    //MARK: CLERIGO
    private func makeClerigo() {
        let caracteristicasClasse: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorClasse(classe: .clerigo)
        
        // clerigo tem 7 subclasses
        // array do json caracteristicas aqui
        let caracConhecimento: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .CL_dominioConhecimento)
        let caracEnganacao: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .CL_dominioEnganacao)
        let caracGuerra: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .CL_dominioGuerra)
        let caracLuz: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .CL_dominioLuz)
        let caracNatureza: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .CL_domonioNatureza)
        let caracTempestade: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .CL_dominioTempestade)
        let caracVida: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .CL_dominioVida)
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .CL_dominioConhecimento, caracteristicas: caracConhecimento),
            SubClasseEscolha(subclase: .CL_dominioEnganacao, caracteristicas: caracEnganacao),
            SubClasseEscolha(subclase: .CL_dominioGuerra, caracteristicas: caracGuerra),
            SubClasseEscolha(subclase: .CL_dominioLuz, caracteristicas: caracLuz),
            SubClasseEscolha(subclase: .CL_domonioNatureza, caracteristicas: caracNatureza),
            SubClasseEscolha(subclase: .CL_dominioTempestade, caracteristicas: caracTempestade),
            SubClasseEscolha(subclase: .CL_dominioVida, caracteristicas: caracVida)
        ]
        
        let armasProficientes: [ArmaJSON] = BuscaJson.buscaArmaTipo(tipo: .simples)
        let armadurasProficientes: [ArmaduraJSON] = BuscaJson.buscaArmadurasPorTipos(tipos: [.leve, .media, .escudo])
        
        var armadurasIniciais: [ArmaduraJSON] = []
        armadurasIniciais.append(BuscaJson.buscaArmaduraPorNome(nome: "Escudo"))
        
        let periciasProficientes: [Pericia] = [.historia, .intuicao, .medicina, .persuasao, .religiao]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComTudo(classe: .clerigo, limiteTruePorNivel: [3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5])
        
        var opcao1: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Maça", quantia: 1, tipo: .arma)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Martelo de Guerra", quantia: 1, tipo: .arma)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao2: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Brunea", quantia: 1, tipo: .armadura)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Couro", quantia: 1, tipo: .armadura)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Cota de Malha", quantia: 1, tipo: .armadura)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao3: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha2: [String] = BuscaArma.buscaArmaTipo(tipo: .simples, nomeExcluso: "Besta Leve")
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Besta Leve", quantia: 1, tipo: .arma), (item: "Virotes", quantia: 20, tipo: .equipamento)]))
            
            for arma in armasEscolha2 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao4: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteSacerdote.rawValue, quantia: 1, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteAventureiro.rawValue, quantia: 1, tipo: .equipamento)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao5: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let equipamentosEscolha: [String] = BuscaEquipamento.buscaEquipamentoCategoria(categoria: .simboloSagrado, nomeExcluso: "")
            
            for equipamento in equipamentosEscolha {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: equipamento, quantia: 1, tipo: .equipamento)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d8")
        
        builder?.setVidaInicial(8)
        builder?.setVidasSeguintes("1d8 ou 5")
        builder?.setRiquezaInicial("5d4 x 10")
        
        builder?.setProfSalvaguarda([.sabedoria, .carisma])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        
        builder?.setOpcoes(opcoes: [opcao1, opcao2, opcao3, opcao4, opcao5])
        builder?.setArmadurasIniciais(armaduras: armadurasIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
        builder?.setEspacosDeMagia(FactoryMagiasConhecidas.criarEspacosDeMagiaPiramide())
    }
    
    //MARK: DRUIDA
    private func makeDruida() {
        let caracteristicasClasse: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorClasse(classe: .druida)
        
        // druida tem 2 subclasses
        // array do json caracteristicas aqui
        let caracTerra: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .DR_circuloTerra)
        let caracLua: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .DR_circuloLua)
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .DR_circuloTerra, caracteristicas: caracTerra),
            SubClasseEscolha(subclase: .DR_circuloLua, caracteristicas: caracLua)
        ]
        
        let armasProficientes: [ArmaJSON] = BuscaJson.buscaArmaPorNomes(nomes: ["Clava Grande", "Adaga", "Dardo", "Azagaia", "Maça", "Bordão", "Cimitarra", "Foice Curta", "Funda", "Lança"])
        let armadurasProficientes: [ArmaduraJSON] = BuscaJson.buscaArmaduraPorNomes(nomes: ["Escudo", "Gibão de Peles", "Couro Batido", "Couro", "Acolchoado"])
        var ferramentasProficientes: [FerramentaJSON] = []
        ferramentasProficientes.append(BuscaJson.buscaFerramentaPorNome(nome: "Kit de herbalismo"))
        
        var armadurasIniciais: [ArmaduraJSON] = []
        armadurasIniciais.append(BuscaJson.buscaArmaduraPorNome(nome: "Couro"))
        
        let pacotesIniciais: [PacoteEquipamento] = [PacoteEquipamento.pacoteAventureiro]
        
        let periciasProficientes: [Pericia] = [.adestrarAnimais, .arcanismo, .intuicao, .medicina, .natureza, .percepcao, .religiao, .sobrevivencia]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComTudo(classe: .druida, limiteTruePorNivel: [2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4])
        
        var opcao1: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha2: [String] = BuscaArma.buscaArmaTipo(tipo: .simples, nomeExcluso: "")
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Escudo", quantia: 1, tipo: .armadura)]))
            
            for arma in armasEscolha2 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao2: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha2: [String] = BuscaArma.buscaArmaTipoEstilo(tipo: .simples, estilo: .cac, nomeExcluso: "Cimitarra")
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Cimitarra", quantia: 1, tipo: .arma)]))
            
            for arma in armasEscolha2 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao3: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteEstudioso.rawValue, quantia: 1, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteExplorador.rawValue, quantia: 1, tipo: .equipamento)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao4: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let equipamentosEscolha: [String] = BuscaEquipamento.buscaEquipamentoCategoria(categoria: .focoDruidico, nomeExcluso: "")
            
            for equipamento in equipamentosEscolha {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: equipamento, quantia: 1, tipo: .equipamento)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d8")
        
        builder?.setVidaInicial(8)
        builder?.setVidasSeguintes("1d8 ou 5")
        builder?.setRiquezaInicial("2d4 x 10")
        
        builder?.setProfSalvaguarda([.inteligencia, .sabedoria])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        builder?.setProfFerramentas(ferramentasProficientes)
        
        builder?.setOpcoes(opcoes: [opcao1, opcao2, opcao3, opcao4])
        builder?.setArmadurasIniciais(armaduras: armadurasIniciais)
        builder?.setPacotesIniciais(pacotes: pacotesIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
        builder?.setEspacosDeMagia(FactoryMagiasConhecidas.criarEspacosDeMagiaPiramide())
    }
    
    //MARK: FEITICEIRO
    private func makeFeiticeiro() {
        let caracteristicasClasse: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorClasse(classe: .feiticeiro)
        
        // feiticeiro tem 2 subclasses
        // array do json caracteristicas aqui
        let caracDraconica: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .FE_linhagemDraconica)
        let caracSelvagem: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .FE_magiaSelvagem)
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .FE_linhagemDraconica, caracteristicas: caracDraconica),
            SubClasseEscolha(subclase: .FE_magiaSelvagem, caracteristicas: caracSelvagem)
        ]
        
        let armasProficientes: [ArmaJSON] = BuscaJson.buscaArmaPorNomes(nomes: ["Adaga", "Dardo", "Bordão", "Funda", "Besta Leve"])
        
        let periciasProficientes: [Pericia] = [.arcanismo, .enganacao, .intimidacao, .intuicao, .persuasao, .religiao]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComLimite(classe: .feiticeiro, limiteTruquePorNivel: [4,4,4,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6], limiteMagia: [2,3,4,5,6,7,8,9,10,11,12,12,13,13,14,14,15,15,15,15])
        
        var opcao1: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha2: [String] = BuscaArma.buscaArmaTipo(tipo: .simples, nomeExcluso: "Besta Leve")
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Besta Leve", quantia: 1, tipo: .arma), (item: "Virotes", quantia: 20, tipo: .equipamento)]))
            
            for arma in armasEscolha2 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao2: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let equipamentosEscolha2: [String] = BuscaEquipamento.buscaEquipamentoCategoria(categoria: .focoArcano, nomeExcluso: "")
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Bolsa de componentes", quantia: 1, tipo: .equipamento)]))
            
            for equipamento in equipamentosEscolha2 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: equipamento, quantia: 1, tipo: .equipamento)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao3: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteExplorador.rawValue, quantia: 1, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteAventureiro.rawValue, quantia: 1, tipo: .equipamento)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d6")
        
        builder?.setVidaInicial(6)
        builder?.setVidasSeguintes("1d6 ou 4")
        builder?.setRiquezaInicial("3d4 x 10")
        
        builder?.setProfSalvaguarda([.constituicao, .carisma])
        builder?.setProfArmas(armasProficientes)
        
        builder?.setOpcoes(opcoes: [opcao1, opcao2, opcao3])
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
        builder?.setEspacosDeMagia(FactoryMagiasConhecidas.criarEspacosDeMagiaPiramide())
        
        builder?.setPontosEspecificosNumericos([
            PontoEspecificoNumerico(nomeValor: "Ponto de Feitiçaria", valorPorNivel: [0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20])
        ])
    }
    
    //MARK: GUERREIRO
    private func makeGuerreiro() {
        let caracteristicasClasse: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorClasse(classe: .guerreiro)
        
        // guerreiro tem 3 subclasses
        // array do json caracteristicas aqui
        let caracCampeao: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .GU_campeao)
        let caracArcano: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .GU_cavaleiroArcano)
        let caracMestre: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .GU_mestreBatalha)
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .GU_campeao, caracteristicas: caracCampeao),
            SubClasseEscolha(subclase: .GU_cavaleiroArcano, caracteristicas: caracArcano),
            SubClasseEscolha(subclase: .GU_mestreBatalha, caracteristicas: caracMestre)
        ]
        
        let armasProficientes: [ArmaJSON] = BuscaJson.buscaArmaTodos()
        let armadurasProficientes: [ArmaduraJSON] = BuscaJson.buscaArmadurasSemEscudo()
        
        let periciasProficientes: [Pericia] = [.acrobacia, .adestrarAnimais, .atletismo, .historia, .intimidacao, .intuicao, .percepcao, .sobrevivencia]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComLimite(classe: .guerreiro, limiteTruquePorNivel: [0,0,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3], limiteMagia: [0,0,3,4,4,4,5,6,6,7,8,8,9,10,10,11,11,11,12,13])
        
        var opcao1: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Cota de Malha", quantia: 1, tipo: .armadura)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Gibão de Peles", quantia: 1, tipo: .armadura), (item: "Arco Longo", quantia: 1, tipo: .arma), (item: "Flechas", quantia: 20, tipo: .equipamento)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao2: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha: [String] = BuscaArma.buscaArmaTipo(tipo: .marcial, nomeExcluso: "")
            
            for arma in armasEscolha {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1, tipo: .arma), (item: "Escudo", quantia: 1, tipo: .armadura)]))
            }
            
            for arma in armasEscolha {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 2, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao3: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Besta Leve", quantia: 1, tipo: .arma), (item: "Virotes", quantia: 20, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Machadinha", quantia: 2, tipo: .arma)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao4: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteAventureiro.rawValue, quantia: 1, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteExplorador.rawValue, quantia: 1, tipo: .equipamento)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d10")
        
        builder?.setVidaInicial(10)
        builder?.setVidasSeguintes("1d10 ou 6")
        builder?.setRiquezaInicial("5d4 x 10")
        
        builder?.setProfSalvaguarda([.forca, .constituicao])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        
        builder?.setOpcoes(opcoes: [opcao1, opcao2, opcao3, opcao4])
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(true)
        builder?.setSubclasseComMagia(.GU_cavaleiroArcano)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
        builder?.setEspacosDeMagia(FactoryMagiasConhecidas.criarEspacosDeMagiaPequeno())
    }
    
    //MARK: LADINO
    private func makeLadino() {
        let caracteristicasClasse: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorClasse(classe: .ladino)
        
        // ladino tem 3 subclasses
        // array do json caracteristicas aqui
        let caracAssassino: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .LA_assassino)
        let caracLadrao: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .LA_ladrao)
        let caracArcano: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .LA_trapaceiroArcano)
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .LA_assassino, caracteristicas: caracAssassino),
            SubClasseEscolha(subclase: .LA_ladrao, caracteristicas: caracLadrao),
            SubClasseEscolha(subclase: .LA_trapaceiroArcano, caracteristicas: caracArcano)
        ]
        
        var armasProficientes: [ArmaJSON] = BuscaJson.buscaArmaTipo(tipo: .simples)
        armasProficientes.append(BuscaJson.buscaArmaPorNome(nome: "Besta de Mão"))
        armasProficientes.append(BuscaJson.buscaArmaPorNome(nome: "Espada Longa"))
        armasProficientes.append(BuscaJson.buscaArmaPorNome(nome: "Rapieira"))
        armasProficientes.append(BuscaJson.buscaArmaPorNome(nome: "Espada Curta"))
        
        let armadurasProficientes: [ArmaduraJSON] = BuscaJson.buscaArmadurasPorTipo(tipo: .leve)
        
        var ferramentasProficientes: [FerramentaJSON] = []
        ferramentasProficientes.append(BuscaJson.buscaFerramentaPorNome(nome: "Ferramentas de ladrão"))
        
        var armadurasIniciais: [ArmaduraJSON] = []
        armadurasIniciais.append(BuscaJson.buscaArmaduraPorNome(nome: "Couro"))
        
        let armasIniciais: [ArmaJSON] = BuscaJson.buscaArmaPorNomeQuantidade(nome: "Adaga", quantidade: 2)
        var ferramentasIniciais: [FerramentaJSON] = []
        ferramentasIniciais.append(BuscaJson.buscaFerramentaPorNome(nome: "Ferramentas de ladrão"))
        
        let periciasProficientes: [Pericia] = [.acrobacia, .atletismo, .atuacao, .enganacao, .furtividade, .intimidacao, .intuicao, .investigacao, .percepcao, .persuasao, .prestidigitacao]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComLimite(classe: .ladino, limiteTruquePorNivel: [0,0,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4], limiteMagia: [0,0,3,4,4,4,5,6,6,7,8,8,9,10,10,11,11,11,12,13])
        
        var opcao1: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Rapieira", quantia: 1, tipo: .arma)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Espada Longa", quantia: 1, tipo: .arma)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao2: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Arco Curto", quantia: 1, tipo: .arma), (item: "Aljava", quantia: 1, tipo: .equipamento), (item: "Flechas", quantia: 20, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Espada Curta", quantia: 1, tipo: .arma)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao3: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteAssaltante.rawValue, quantia: 1, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteAventureiro.rawValue, quantia: 1, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteExplorador.rawValue, quantia: 1, tipo: .equipamento)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d8")
        
        builder?.setVidaInicial(8)
        builder?.setVidasSeguintes("1d8 ou 5")
        builder?.setRiquezaInicial("4d4 x 10")
        
        builder?.setProfSalvaguarda([.destreza, .inteligencia])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        builder?.setProfFerramentas(ferramentasProficientes)
        
        builder?.setOpcoes(opcoes: [opcao1, opcao2, opcao3])
        builder?.setArmasIniciais(armas: armasIniciais)
        builder?.setArmadurasIniciais(armaduras: armadurasIniciais)
        builder?.setFerramentasIniciais(ferramentas: ferramentasIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(4)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(true)
        builder?.setSubclasseComMagia(.LA_trapaceiroArcano)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
        builder?.setEspacosDeMagia(FactoryMagiasConhecidas.criarEspacosDeMagiaPequeno())
        
        builder?.setPontosEspecificosTexto([
            PontoEspecificoTexto(nomeValor: "Ataque Furtivo", textoPorNivel: ["1d6", "1d6", "2d6", "2d6", "3d6", "3d6", "4d6", "4d6", "5d6", "5d6", "6d6", "6d6", "7d6", "7d6", "8d6", "8d6", "9d6", "9d6", "10d6", "10d6"])
        ])
    }
    
    //MARK: MAGO
    private func makeMago() {
        let caracteristicasClasse: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorClasse(classe: .mago)
        
        // mago tem 7 subclasses
        // array do json caracteristicas aqui
        let caracAbjuracao: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .MA_escolaAbjuracao)
        let caracAdivinhacao: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .MA_escolaAdivinhacao)
        let caracConjuracao: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .MA_escolaConjuracao)
        let caracEvocacao: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .MA_escolaEvocacao)
        let caracIlusao: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .MA_escolaIlusao)
        let caracNecromancia: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .MA_escolaNecromancia)
        let caracTransmutacao: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .MA_escolaTransmutacao)
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .MA_escolaAbjuracao, caracteristicas: caracAbjuracao),
            SubClasseEscolha(subclase: .MA_escolaAdivinhacao, caracteristicas: caracAdivinhacao),
            SubClasseEscolha(subclase: .MA_escolaConjuracao, caracteristicas: caracConjuracao),
            SubClasseEscolha(subclase: .MA_escolaEvocacao, caracteristicas: caracEvocacao),
            SubClasseEscolha(subclase: .MA_escolaIlusao, caracteristicas: caracIlusao),
            SubClasseEscolha(subclase: .MA_escolaNecromancia, caracteristicas: caracNecromancia),
            SubClasseEscolha(subclase: .MA_escolaTransmutacao, caracteristicas: caracTransmutacao)
        ]
        
        let armasProficientes: [ArmaJSON] = BuscaJson.buscaArmaPorNomes(nomes: ["Adaga", "Dardo", "Bordão", "Funda", "Besta Leve"])
        
        var equipamentosIniciais: [EquipamentoJSON] = []
        equipamentosIniciais.append(BuscaJson.buscaEquipamentoPorNome(nome: "Grimório"))
        
        let periciasProficientes: [Pericia] = [.arcanismo, .historia, .intuicao, .investigacao, .medicina, .religiao]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComTudo(classe: .mago, limiteTruePorNivel: [3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5])
        
        var opcao1: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Bordão", quantia: 1, tipo: .arma)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Adaga", quantia: 1, tipo: .arma)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao2: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let equipamentosEscolha2: [String] = BuscaEquipamento.buscaEquipamentoCategoria(categoria: .focoArcano, nomeExcluso: "")
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Bolsa de componentes", quantia: 1, tipo: .equipamento)]))
            
            for equipamento in equipamentosEscolha2 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: equipamento, quantia: 1, tipo: .equipamento)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao3: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteEstudioso.rawValue, quantia: 1, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteExplorador.rawValue, quantia: 1, tipo: .equipamento)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d6")
        
        builder?.setVidaInicial(6)
        builder?.setVidasSeguintes("1d6 ou 4")
        builder?.setRiquezaInicial("4d4 x 10")
        
        builder?.setProfSalvaguarda([.inteligencia, .sabedoria])
        builder?.setProfArmas(armasProficientes)
        
        builder?.setOpcoes(opcoes: [opcao1, opcao2, opcao3])
        builder?.setEquipamentosIniciais(equipamentos: equipamentosIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
        builder?.setEspacosDeMagia(FactoryMagiasConhecidas.criarEspacosDeMagiaPiramide())
    }
    
    //MARK: MONGE
    private func makeMonge() {
        let caracteristicasClasse: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorClasse(classe: .monge)
        
        // monge tem 3 subclasses
        // array do json caracteristicas aqui
        let caracMaoAberta: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .MO_caminhoMaoAberta)
        let caracSombra: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .MO_caminhoSombra)
        let caracElementos: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .MO_caminhoQuatroElementos)
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .MO_caminhoMaoAberta, caracteristicas: caracMaoAberta),
            SubClasseEscolha(subclase: .MO_caminhoSombra, caracteristicas: caracSombra),
            SubClasseEscolha(subclase: .MO_caminhoQuatroElementos, caracteristicas: caracElementos)
        ]
        
        var armasProficientes: [ArmaJSON] = BuscaJson.buscaArmaTipo(tipo: .simples)
        armasProficientes.append(BuscaJson.buscaArmaPorNome(nome: "Espada Curta"))
        
        var escolhasProfFerramenta: [EscolhaOpcao] {
            var itensEscolha: [[ItemEscolha]] = []
            let ferramentas1 = BuscaFerramenta.buscaFerramentaTipo(tipo: .musical, nomeExcluso: "")
            let ferramentas2 = BuscaFerramenta.buscaFerramentaTipo(tipo: .artesao, nomeExcluso: "")
            
            let ferramentas: [String] = ferramentas1 + ferramentas2
            
            for ferramenta in ferramentas {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: ferramenta, quantia: 1, tipo: .ferramenta)]))
            }
            
            return FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha)
        }
        
        let armasIniciais: [ArmaJSON] = BuscaJson.buscaArmaPorNomeQuantidade(nome: "Dardo", quantidade: 10)
        
        let periciasProficientes: [Pericia] = [.acrobacia, .atletismo, .furtividade, .historia, .intuicao, .religiao]
        
        var opcao1: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha2: [String] = BuscaArma.buscaArmaTipo(tipo: .simples, nomeExcluso: "")
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Espada Curta", quantia: 1, tipo: .arma)]))
            
            for arma in armasEscolha2 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao2: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteExplorador.rawValue, quantia: 1, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteAventureiro.rawValue, quantia: 1, tipo: .equipamento)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d8")
        
        builder?.setVidaInicial(8)
        builder?.setVidasSeguintes("1d8 ou 5")
        builder?.setRiquezaInicial("5d4")
        
        builder?.setProfSalvaguarda([.forca, .destreza])
        builder?.setProfArmas(armasProficientes)
        builder?.setEscolhasProficienciaFerramenta(escolhasProfFerramenta)
        
        builder?.setOpcoes(opcoes: [opcao1, opcao2])
        builder?.setArmasIniciais(armas: armasIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(false)
        
        builder?.setPontosEspecificosTexto([
            PontoEspecificoTexto(nomeValor: "Artes Marciais", textoPorNivel: ["1d4", "1d4", "1d4", "1d4", "1d6", "1d6", "1d6", "1d6", "1d6", "1d6", "1d8", "1d8", "1d8", "1d8", "1d8", "1d8", "1d10", "1d10", "1d10", "1d10"]),
            PontoEspecificoTexto(nomeValor: "Deslocamento sem Armadura", textoPorNivel: ["+0m", "+3m", "+3m", "+3m", "+3m", "+4.5m", "+4.5m", "+4.5m", "+4.5m", "+6m", "+6m", "+6m", "+6m", "+7.5m", "+7.5m", "+7.5m", "+7.5m", "+9m", "+9m", "+9m"])
        ])
        
        builder?.setPontosEspecificosNumericos([
            PontoEspecificoNumerico(nomeValor: "Pontos de Chi", valorPorNivel: [0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20])
        ])
        
    }
    
    //MARK: PALADINO
    private func makePaladino() {
        let caracteristicasClasse: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorClasse(classe: .paladino)
        
        // paladino tem 3 subclasses
        // array do json caracteristicas aqui
        let caracDevocao: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .PD_juramentoDevocao)
        let caracAncioes: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .PD_juramentoAncioes)
        let caracVinganca: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .PD_juramentoVinganca)
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .PD_juramentoDevocao, caracteristicas: caracDevocao),
            SubClasseEscolha(subclase: .PD_juramentoAncioes, caracteristicas: caracAncioes),
            SubClasseEscolha(subclase: .PD_juramentoVinganca, caracteristicas: caracVinganca)
        ]
        
        let armasProficientes: [ArmaJSON] = BuscaJson.buscaArmaTodos()
        let armadurasProficientes: [ArmaduraJSON] = BuscaJson.buscaArmadurasTodos()
        
        var armadurasIniciais: [ArmaduraJSON] = []
        armadurasIniciais.append(BuscaJson.buscaArmaduraPorNome(nome: "Cota de Malha"))
        
        let periciasProficientes: [Pericia] = [.atletismo, .intimidacao, .intuicao, .medicina, .persuasao, .religiao]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComTudo(classe: .paladino, limiteTruePorNivel: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
        
        var opcao1: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha: [String] = BuscaArma.buscaArmaTipo(tipo: .marcial, nomeExcluso: "")
            
            for arma in armasEscolha {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1, tipo: .arma), (item: "Escudo", quantia: 1, tipo: .armadura)]))
            }
            
            for arma in armasEscolha {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 2, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao2: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha2: [String] = BuscaArma.buscaArmaTipoEstilo(tipo: .simples, estilo: .cac, nomeExcluso: "Azagaia")
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Azagaia", quantia: 5, tipo: .arma)]))
            
            for arma in armasEscolha2 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 1, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao3: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteSacerdote.rawValue, quantia: 1, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteAventureiro.rawValue, quantia: 1, tipo: .equipamento)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao4: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let equipamentosEscolha: [String] = BuscaEquipamento.buscaEquipamentoCategoria(categoria: .simboloSagrado, nomeExcluso: "")
            
            for equipamento in equipamentosEscolha {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: equipamento, quantia: 1, tipo: .equipamento)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d10")
        
        builder?.setVidaInicial(10)
        builder?.setVidasSeguintes("1d10 ou 6")
        builder?.setRiquezaInicial("5d4 x 10")
        
        builder?.setProfSalvaguarda([.sabedoria, .carisma])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        
        builder?.setOpcoes(opcoes: [opcao1, opcao2, opcao3, opcao4])
        builder?.setArmadurasIniciais(armaduras: armadurasIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(2)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
        builder?.setEspacosDeMagia(FactoryMagiasConhecidas.criarEspacosDeMagiaMetade())
    }
    
    //MARK: PATRULHEIRO
    private func makePatrulheiro() {
        let caracteristicasClasse: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorClasse(classe: .patrulheiro)
        
        // patrulheiro tem 3 subclasses
        // array do json caracteristicas aqui
        let caracBesta: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .PT_conclaveBesta)
        let caracCacador: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .PT_conclaveCacador)
        let caracSubterraneo: [CaracteristicaJSON] = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .PT_conclaveRastreadorSubterraneo)
        
        let subclasses: [SubClasseEscolha] = [
            SubClasseEscolha(subclase: .PT_conclaveBesta, caracteristicas: caracBesta),
            SubClasseEscolha(subclase: .PT_conclaveCacador, caracteristicas: caracCacador),
            SubClasseEscolha(subclase: .PT_conclaveRastreadorSubterraneo, caracteristicas: caracSubterraneo)
        ]
        
        let armasProficientes: [ArmaJSON] = BuscaJson.buscaArmaTodos()
        let armadurasProficientes: [ArmaduraJSON] = BuscaJson.buscaArmadurasPorTipos(tipos: [.leve, .media, .escudo])
        
        var armasIniciais: [ArmaJSON] = []
        armasIniciais.append(BuscaJson.buscaArmaPorNome(nome: "Arco Longo"))
        
        var equipamentosIniciais: [EquipamentoJSON] = []
        equipamentosIniciais.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Flechas", quantidade: 20))
        equipamentosIniciais.append(BuscaJson.buscaEquipamentoPorNome(nome: "Aljava"))
        
        let periciasProficientes: [Pericia] = [.adestrarAnimais, .atletismo, .furtividade, .intuicao, .investigacao, .natureza, .percepcao, .sobrevivencia]
        
        let magiasConhecidas: [MagiasConhecidas] = FactoryMagiasConhecidas.criarMagiasComLimite(classe: .patrulheiro, limiteTruquePorNivel: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], limiteMagia: [0,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11])
        
        var opcao1: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Brunea", quantia: 1, tipo: .armadura)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Couro", quantia: 1, tipo: .armadura)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao2: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            let armasEscolha2: [String] = BuscaArma.buscaArmaTipo(tipo: .simples, nomeExcluso: "Espada Curta")
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: "Espada Curta", quantia: 2, tipo: .arma)]))
            
            for arma in armasEscolha2 {
                itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: arma, quantia: 2, tipo: .arma)]))
            }
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        var opcao3: OpcaoEquipamento {
            var itensEscolha: [[ItemEscolha]] = []
            
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteExplorador.rawValue, quantia: 1, tipo: .equipamento)]))
            itensEscolha.append(FactoryOpcaoEquipamento.criaItemEscolha(tuplaItens: [(item: PacoteEquipamento.pacoteAventureiro.rawValue, quantia: 1, tipo: .equipamento)]))
            
            return FactoryOpcaoEquipamento.criaOpcao(escolhas: FactoryOpcaoEquipamento.criaEscolha(itensEscolha: itensEscolha))
        }
        
        // METODOS //////////////////////////
        
        builder?.setCaracteristicasClasse(caracteristicasClasse)
        builder?.setSubClasses(subclasses)
        builder?.setDadoVida("d10")
        
        builder?.setVidaInicial(10)
        builder?.setVidasSeguintes("1d10 ou 6")
        builder?.setRiquezaInicial("5d4 x 10")
        
        builder?.setProfSalvaguarda([.forca, .destreza])
        builder?.setProfArmas(armasProficientes)
        builder?.setProfArmaduras(armadurasProficientes)
        
        builder?.setOpcoes(opcoes: [opcao1, opcao2, opcao3])
        builder?.setArmasIniciais(armas: armasIniciais)
        builder?.setEquipamentosIniciais(equipamentos: equipamentosIniciais)
        
        builder?.setProfPericias(periciasProficientes)
        builder?.setQuantiaEscolhaProfPericia(3)
        builder?.setPossuiMagias(true)
        builder?.setMagiaApenasSubclasse(false)
        
        builder?.setMagiasConhecidas(magiasConhecidas)
        builder?.setEspacosDeMagia(FactoryMagiasConhecidas.criarEspacosDeMagiaMetade())
    }
}
