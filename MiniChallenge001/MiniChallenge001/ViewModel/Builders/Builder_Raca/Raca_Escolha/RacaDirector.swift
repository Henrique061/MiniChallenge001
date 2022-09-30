//
//  RacaDirector.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 25/09/22.
//

import Foundation

public class FactoryEscolhaIdioma {
    public static func idiomasComExclusao(_ idiomasExlusos: [Idioma]) -> [Idioma] {
        var idiomas: [Idioma] = []
        for idioma in Idioma.allCases {
            if !idiomasExlusos.contains(idioma) {
                idiomas.append(idioma)
            }
        }
        
        return idiomas
    }
}

public class RacaDirector {
    private var builder: RacaBuilder?
    
    func newBuilder(racaBuilder: RacaBuilder){
        self.builder = racaBuilder
    }
    
    // MARK: MAKE RACA
    func makeRaca(_ raca: TipoRaca) {
        builder?.setRaca(raca)
        builder?.setNomeRaca()
        
        switch builder?.getRaca() {
        case .anao:
            makeAnao()
            
        case .elfo:
            makeElfo()
            
        case .halfling:
            makeHalfling()
            
        case .humano:
            makeHumano()
            
        case .draconato:
            makeDraconato()
            
        case .gnomo:
            makeGnomo()
            
        case .meioElfo:
            makeMeioElfo()
            
        case .meioOrc:
            makeMeioOrc()
            
        case .tiefling:
            makeTiefling()
            
        default:
            break
        }
    }
    
    //MARK: ANAO
    private func makeAnao() {
        // TRACOS, trocar por tracosJson
        let tracos: [TraitJSON] = BuscaJson.buscaTracosPorRaca(raca: .anao)
        let tracosColina: [TraitJSON] = BuscaJson.buscaTracosPorSubraca(subraca: .anaoColina)
        let tracosMontanha: [TraitJSON] = BuscaJson.buscaTracosPorSubraca(subraca: .anaoMontanha)
        
        let subracas: [Subraca] = [
            Subraca(subraca: .anaoColina, tracos: tracosColina, atributoGanho: AtributosGanhosRaca(atributo: .sabedoria, pontosGanhos: 1)),
            Subraca(subraca: .anaoMontanha, tracos: tracosMontanha, atributoGanho: AtributosGanhosRaca(atributo: .forca, pontosGanhos: 2))
        ]
        
        let atributosGanhos: [AtributosGanhosRaca] = [
            AtributosGanhosRaca(atributo: .constituicao, pontosGanhos: 2)
        ]
        
        let idiomas: [IdiomaAlfabeto] = [
            IdiomaAlfabeto(idioma: .anao, alfabeto: .anao, isPadrao: true),
            IdiomaAlfabeto(idioma: .comum, alfabeto: .comum, isPadrao: true)
        ]
        let armasProficientes: [ArmaJSON] = BuscaJson.buscaArmaPorNomes(nomes: ["Machado de Batalha", "Machadinha", "Martelo Leve", "Martelo de Guerra"])
        
        let profArmadurasPorSubraca: [ProficienciaArmaduraPorSubraca] = [
            ProficienciaArmaduraPorSubraca(subraca: .anaoMontanha, armasProficientes: BuscaJson.buscaArmadurasPorTipos(tipos: [.leve, .media]))
        ]
        
        let escolhasFerramentas: [String] = ["Ferramentas de ferreiro", "Suprimentos de cervejeiro", "Ferramentas de pedreiro"]
        
        // METODOS /////////////////////
        builder?.setPossuiSubraca(true)
        builder?.setSubRacas(subracas)
        builder?.setTracos(tracos: tracos)
        builder?.setAtributosGanhos(atributosGanhos)
        builder?.setPossuiEscolhaAtributo(false)
        builder?.setDeslocamento(7.5)
        builder?.setIdiomas(idiomas)
        builder?.setPossuiEscolhaIdioma(false)
        builder?.setSubracaPossuiEscolhaIdioma(false)
        builder?.setProfArmas(armasProficientes)
        builder?.setSubracaProfArmadura(profArmadurasPorSubraca)
        builder?.setPossuiEscolhaProfFerramentas(true)
        builder?.setEscolhasProfFerramentas(escolhasFerramentas)
        builder?.setPossuiEscolhaProfPericias(false)
    }
    
    //MARK: ELFO
    private func makeElfo() {
        let tracos: [TraitJSON] = BuscaJson.buscaTracosPorRaca(raca: .elfo)
        let tracosAlto: [TraitJSON] = BuscaJson.buscaTracosPorSubraca(subraca: .altoElfo)
        let tracosFloresta: [TraitJSON] = BuscaJson.buscaTracosPorSubraca(subraca: .elfoFloresta)
        let tracosNegro: [TraitJSON] = BuscaJson.buscaTracosPorSubraca(subraca: .elfoNegro)
        
        let subracas: [Subraca] = [
            Subraca(subraca: .altoElfo, tracos: tracosAlto, atributoGanho: AtributosGanhosRaca(atributo: .inteligencia, pontosGanhos: 1)),
            Subraca(subraca: .elfoFloresta, tracos: tracosFloresta, atributoGanho: AtributosGanhosRaca(atributo: .sabedoria, pontosGanhos: 1)),
            Subraca(subraca: .elfoNegro, tracos: tracosNegro, atributoGanho: AtributosGanhosRaca(atributo: .carisma, pontosGanhos: 1))
        ]
        
        let atributosGanhos: [AtributosGanhosRaca] = [
            AtributosGanhosRaca(atributo: .destreza, pontosGanhos: 2)
        ]
        
        let idiomas: [IdiomaAlfabeto] = [
            IdiomaAlfabeto(idioma: .elfico, alfabeto: .elfico, isPadrao: true),
            IdiomaAlfabeto(idioma: .comum, alfabeto: .comum, isPadrao: true)
        ]
        
        let escolhaIdiomas: [Idioma] = FactoryEscolhaIdioma.idiomasComExclusao([.comum, .elfico])
        
        var armasProficientes: [ArmaJSON] = []
        armasProficientes.append(BuscaJson.buscaArmaPorNome(nome: "Espada Curta"))
        
        let profArmasPorSubraca: [ProficienciaArmasPorSubraca] = [
            ProficienciaArmasPorSubraca(subraca: .altoElfo, armasProficientes: BuscaJson.buscaArmaPorNomes(nomes: ["Espada Longa", "Arco Longo", "Arco Curto"])),
            ProficienciaArmasPorSubraca(subraca: .elfoFloresta, armasProficientes: BuscaJson.buscaArmaPorNomes(nomes: ["Espada Longa", "Arco Longo", "Arco Curto"])),
            ProficienciaArmasPorSubraca(subraca: .elfoNegro, armasProficientes: BuscaJson.buscaArmaPorNomes(nomes: ["Rapieira", "Besta de Mão"]))
        ]
        
        let profPericias: [Pericia] = [.percepcao]
        
        let magiasSubraca: MagiaSubraca = MagiaSubraca(subraca: .elfoNegro, magias: BuscaJson.buscaMagiasPorNomes(nomes: ["Globos de Luz", "Fome de Hadar", "Escuridão"]))
        
        let subracaEscolhaMagia = MagiaEscolhaSubraca(subraca: .altoElfo, magias: BuscaMagia.buscaMagiaClasseNivel(classe: .mago, nivel: 0))
        
        let deslocamentoSubraca: [DeslocamentoSubraca] = [
            DeslocamentoSubraca(subraca: .altoElfo, deslocamento: 9.0),
            DeslocamentoSubraca(subraca: .elfoFloresta, deslocamento: 10.5),
            DeslocamentoSubraca(subraca: .elfoNegro, deslocamento: 9.0)
        ]
        
        // METODOS /////////////////////
        builder?.setPossuiSubraca(true)
        builder?.setSubRacas(subracas)
        builder?.setTracos(tracos: tracos)
        builder?.setAtributosGanhos(atributosGanhos)
        builder?.setPossuiEscolhaAtributo(false)
        builder?.setDeslocamentoSubraca(deslocamentoSubraca)
        builder?.setIdiomas(idiomas)
        builder?.setPossuiEscolhaIdioma(false)
        builder?.setSubracaPossuiEscolhaIdioma(true)
        builder?.setSubracaComEscolhaIdioma(.altoElfo)
        builder?.setEscolhaIdioma(escolhaIdiomas)
        builder?.setProfArmas(armasProficientes)
        builder?.setSubracaProfArma(profArmasPorSubraca)
        builder?.setProfPericias(profPericias)
        builder?.setPossuiEscolhaProfFerramentas(false)
        builder?.setPossuiEscolhaProfPericias(false)
        builder?.setMagiasPorSubraca(magiasSubraca)
        builder?.setSubracaEscolhaMagias(subracaEscolhaMagia)
    }
    
    //MARK: HALFLING
    private func makeHalfling() {
        let tracos: [TraitJSON] = BuscaJson.buscaTracosPorRaca(raca: .halfling)
        let tracosPesLeves: [TraitJSON] = BuscaJson.buscaTracosPorSubraca(subraca: .halflingPesLeves)
        let tracosRobusto: [TraitJSON] = BuscaJson.buscaTracosPorSubraca(subraca: .halflingRobusto)
        
        let subracas: [Subraca] = [
            Subraca(subraca: .halflingPesLeves, tracos: tracosPesLeves, atributoGanho: AtributosGanhosRaca(atributo: .carisma, pontosGanhos: 1)),
            Subraca(subraca: .halflingRobusto, tracos: tracosRobusto, atributoGanho: AtributosGanhosRaca(atributo: .constituicao, pontosGanhos: 1))
        ]
        
        let atributosGanhos: [AtributosGanhosRaca] = [
            AtributosGanhosRaca(atributo: .destreza, pontosGanhos: 2)
        ]
        
        let idiomas: [IdiomaAlfabeto] = [
            IdiomaAlfabeto(idioma: .halfling, alfabeto: .comum, isPadrao: true),
            IdiomaAlfabeto(idioma: .comum, alfabeto: .comum, isPadrao: true)
        ]
        
        // METODOS /////////////////////
        builder?.setPossuiSubraca(true)
        builder?.setSubRacas(subracas)
        builder?.setTracos(tracos: tracos)
        builder?.setAtributosGanhos(atributosGanhos)
        builder?.setPossuiEscolhaAtributo(false)
        builder?.setDeslocamento(7.5)
        builder?.setIdiomas(idiomas)
        builder?.setPossuiEscolhaIdioma(false)
        builder?.setSubracaPossuiEscolhaIdioma(false)
        builder?.setPossuiEscolhaProfFerramentas(false)
        builder?.setPossuiEscolhaProfPericias(false)
    }
    
    //MARK: HUMANO
    private func makeHumano() {
        let tracos: [TraitJSON] = BuscaJson.buscaTracosPorRaca(raca: .humano)
        
        let atributosGanhos: [AtributosGanhosRaca] = [
            AtributosGanhosRaca(atributo: .forca, pontosGanhos: 1),
            AtributosGanhosRaca(atributo: .destreza, pontosGanhos: 1),
            AtributosGanhosRaca(atributo: .constituicao, pontosGanhos: 1),
            AtributosGanhosRaca(atributo: .inteligencia, pontosGanhos: 1),
            AtributosGanhosRaca(atributo: .sabedoria, pontosGanhos: 1),
            AtributosGanhosRaca(atributo: .carisma, pontosGanhos: 1)
        ]
        
        let idiomas: [IdiomaAlfabeto] = [
            IdiomaAlfabeto(idioma: .comum, alfabeto: .comum, isPadrao: true)
        ]
        
        let escolhaIdiomas: [Idioma] = FactoryEscolhaIdioma.idiomasComExclusao([.comum])
        
        // METODOS /////////////////////
        builder?.setPossuiSubraca(false)
        builder?.setTracos(tracos: tracos)
        builder?.setAtributosGanhos(atributosGanhos)
        builder?.setPossuiEscolhaAtributo(false)
        builder?.setDeslocamento(9.0)
        builder?.setIdiomas(idiomas)
        builder?.setPossuiEscolhaIdioma(true)
        builder?.setSubracaPossuiEscolhaIdioma(false)
        builder?.setEscolhaIdioma(escolhaIdiomas)
        builder?.setPossuiEscolhaProfFerramentas(false)
        builder?.setPossuiEscolhaProfPericias(false)
    }
    
    //MARK: DRACONATO
    private func makeDraconato() {
        let tracos: [TraitJSON] = BuscaJson.buscaTracosPorRaca(raca: .draconato)
        
        let atributosGanhos: [AtributosGanhosRaca] = [
            AtributosGanhosRaca(atributo: .forca, pontosGanhos: 2),
            AtributosGanhosRaca(atributo: .carisma, pontosGanhos: 1)
        ]
        
        let idiomas: [IdiomaAlfabeto] = [
            IdiomaAlfabeto(idioma: .draconico, alfabeto: .draconico, isPadrao: false),
            IdiomaAlfabeto(idioma: .comum, alfabeto: .comum, isPadrao: true)
        ]
        
        // METODOS /////////////////////
        builder?.setPossuiSubraca(false)
        builder?.setTracos(tracos: tracos)
        builder?.setAtributosGanhos(atributosGanhos)
        builder?.setPossuiEscolhaAtributo(false)
        builder?.setDeslocamento(9.0)
        builder?.setIdiomas(idiomas)
        builder?.setPossuiEscolhaIdioma(false)
        builder?.setSubracaPossuiEscolhaIdioma(false)
        builder?.setPossuiEscolhaProfFerramentas(false)
        builder?.setPossuiEscolhaProfPericias(false)
    }
    
    //MARK: GNOMO
    private func makeGnomo() {
        let tracos: [TraitJSON] = BuscaJson.buscaTracosPorRaca(raca: .gnomo)
        let tracosFloresta: [TraitJSON] = BuscaJson.buscaTracosPorSubraca(subraca: .gnomoFloresta)
        let tracosRochas: [TraitJSON] = BuscaJson.buscaTracosPorSubraca(subraca: .gnomoRochas)
        
        let subracas: [Subraca] = [
            Subraca(subraca: .gnomoFloresta, tracos: tracosFloresta, atributoGanho: AtributosGanhosRaca(atributo: .destreza, pontosGanhos: 1)),
            Subraca(subraca: .gnomoRochas, tracos: tracosRochas, atributoGanho: AtributosGanhosRaca(atributo: .constituicao, pontosGanhos: 1))
        ]
        
        let atributosGanhos: [AtributosGanhosRaca] = [
            AtributosGanhosRaca(atributo: .inteligencia, pontosGanhos: 2)
        ]
        
        let idiomas: [IdiomaAlfabeto] = [
            IdiomaAlfabeto(idioma: .gnomico, alfabeto: .anao, isPadrao: true),
            IdiomaAlfabeto(idioma: .comum, alfabeto: .comum, isPadrao: true)
        ]
        
        let profFerramentasPorSubraca: [ProficienciaFerramentaPorSubraca] = [
            ProficienciaFerramentaPorSubraca(subraca: .gnomoRochas, armasProficientes: BuscaJson.buscaFerramentaPorTipo(tipo: .artesao))
        ]
        
        let magiasSubraca: MagiaSubraca = MagiaSubraca(subraca: .gnomoFloresta, magias: [BuscaJson.buscaMagiaPorNome(nome: "Ilusão Programada")])
        
        // METODOS /////////////////////
        builder?.setPossuiSubraca(true)
        builder?.setSubRacas(subracas)
        builder?.setTracos(tracos: tracos)
        builder?.setAtributosGanhos(atributosGanhos)
        builder?.setPossuiEscolhaAtributo(false)
        builder?.setIdiomas(idiomas)
        builder?.setDeslocamento(7.5)
        builder?.setPossuiEscolhaIdioma(false)
        builder?.setSubracaPossuiEscolhaIdioma(false)
        builder?.setSubracaProfFerramenta(profFerramentasPorSubraca)
        builder?.setPossuiEscolhaProfFerramentas(false)
        builder?.setPossuiEscolhaProfPericias(false)
        builder?.setMagiasPorSubraca(magiasSubraca)
    }
    
    //MARK: MEIO ELFO
    private func makeMeioElfo() {
        let tracos: [TraitJSON] = BuscaJson.buscaTracosPorRaca(raca: .meioElfo)
        
        let atributosGanhos: [AtributosGanhosRaca] = [
            AtributosGanhosRaca(atributo: .carisma, pontosGanhos: 2)
        ]
        
        let escolhasAtributos: [AtributosSalvaguarda] = [.forca, .destreza, .constituicao, .inteligencia, .sabedoria]
        
        let idiomas: [IdiomaAlfabeto] = [
            IdiomaAlfabeto(idioma: .elfico, alfabeto: .elfico, isPadrao: true),
            IdiomaAlfabeto(idioma: .comum, alfabeto: .comum, isPadrao: true)
        ]
        
        let escolhaIdiomas: [Idioma] = FactoryEscolhaIdioma.idiomasComExclusao([.comum, .elfico])
        
        let escolhasPericias: [Pericia] = Pericia.allCases
        
        // METODOS /////////////////////
        builder?.setPossuiSubraca(false)
        builder?.setTracos(tracos: tracos)
        builder?.setAtributosGanhos(atributosGanhos)
        builder?.setPossuiEscolhaAtributo(true)
        builder?.setEscolhasAtributos(escolhasAtributos)
        builder?.numEscolhasAtributos(2)
        builder?.valorGanhoEscolhaAtributos(1)
        builder?.setDeslocamento(9.0)
        builder?.setIdiomas(idiomas)
        builder?.setPossuiEscolhaIdioma(true)
        builder?.setSubracaPossuiEscolhaIdioma(false)
        builder?.setEscolhaIdioma(escolhaIdiomas)
        builder?.setPossuiEscolhaProfFerramentas(false)
        builder?.setPossuiEscolhaProfPericias(true)
        builder?.setEscolhasProfPericias(escolhasPericias)
        builder?.setQuantiaEscolhaPericia(2)
    }
    
    //MARK: MEIO ORC
    private func makeMeioOrc() {
        let tracos: [TraitJSON] = BuscaJson.buscaTracosPorRaca(raca: .meioOrc)
        
        let atributosGanhos: [AtributosGanhosRaca] = [
            AtributosGanhosRaca(atributo: .forca, pontosGanhos: 2),
            AtributosGanhosRaca(atributo: .constituicao, pontosGanhos: 1)
        ]
        
        let idiomas: [IdiomaAlfabeto] = [
            IdiomaAlfabeto(idioma: .orc, alfabeto: .anao, isPadrao: true),
            IdiomaAlfabeto(idioma: .comum, alfabeto: .comum, isPadrao: true)
        ]
        
        let profPericias: [Pericia] = [.intimidacao]
        
        // METODOS /////////////////////
        builder?.setPossuiSubraca(false)
        builder?.setTracos(tracos: tracos)
        builder?.setAtributosGanhos(atributosGanhos)
        builder?.setPossuiEscolhaAtributo(false)
        builder?.setDeslocamento(9.0)
        builder?.setIdiomas(idiomas)
        builder?.setPossuiEscolhaIdioma(false)
        builder?.setSubracaPossuiEscolhaIdioma(false)
        builder?.setProfPericias(profPericias)
        builder?.setPossuiEscolhaProfFerramentas(false)
        builder?.setPossuiEscolhaProfPericias(false)
    }
    
    //MARK: TIEFLING
    private func makeTiefling() {
        let tracos: [TraitJSON] = BuscaJson.buscaTracosPorRaca(raca: .tiefling)
        
        let atributosGanhos: [AtributosGanhosRaca] = [
            AtributosGanhosRaca(atributo: .inteligencia, pontosGanhos: 1),
            AtributosGanhosRaca(atributo: .carisma, pontosGanhos: 2)
        ]
        
        let idiomas: [IdiomaAlfabeto] = [
            IdiomaAlfabeto(idioma: .infernal, alfabeto: .infernal, isPadrao: false),
            IdiomaAlfabeto(idioma: .comum, alfabeto: .comum, isPadrao: true)
        ]
        
        let magias: [MagiaJSON] = BuscaJson.buscaMagiasPorNomes(nomes: ["Taumaturgia", "Repreensão Infernal", "Escuridão"])
        
        // METODOS /////////////////////
        builder?.setPossuiSubraca(false)
        builder?.setTracos(tracos: tracos)
        builder?.setAtributosGanhos(atributosGanhos)
        builder?.setPossuiEscolhaAtributo(false)
        builder?.setDeslocamento(9.0)
        builder?.setIdiomas(idiomas)
        builder?.setPossuiEscolhaIdioma(false)
        builder?.setSubracaPossuiEscolhaIdioma(false)
        builder?.setPossuiEscolhaProfFerramentas(false)
        builder?.setPossuiEscolhaProfPericias(false)
        builder?.setMagiasRecebidas(magias)
    }
}
