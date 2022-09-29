//
//  RacaConcreteBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 25/09/22.
//

import Foundation

public class RacaConcreteBuilder : RacaBuilder {
    private var raca = RacaEscolha()
    
    //MARK: RESET BUILDER
    func resetBuilder() {
        raca = RacaEscolha()
    }
    
    //MARK: RACA
    func setRaca(_ raca: TipoRaca) {
        self.raca.tipoRaca = raca
    }
    
    //MARK: GET RACA
    func getRaca() -> TipoRaca {
        return self.raca.tipoRaca
    }
    
    //MARK: NOME RACA
    func setNomeRaca() {
        self.raca.nomeRaca = self.raca.tipoRaca.rawValue
    }
    
    //MARK: POSSUI SUBRACA
    func setPossuiSubraca(_ possui: Bool) {
        self.raca.possuiSubRaca = possui
    }
    
    //MARK: SUB RACAS
    func setSubRacas(_ subracas: [Subraca]) {
        self.raca.subRacas = subracas
    }
    
    //MARK: ATRIBUTOS GANHOS
    func setAtributosGanhos(_ atributos: [AtributosGanhosRaca]) {
        self.raca.atributosGanhos = atributos
    }
    
    //MARK: ESCOLHA ATRIBUTO?
    func setPossuiEscolhaAtributo(_ possui: Bool) {
        self.raca.possuiEscolhaAtributo = possui
    }
    
    //MARK: ESCOLHAS DE ATRIBUTO
    func setEscolhasAtributos(_ atributos: [AtributosSalvaguarda]) {
        self.raca.escolhasAtributo = atributos
    }
    
    //MARK: NUM ESCOLHAS DE ATRIBUTOS
    func numEscolhasAtributos(_ num: Int) {
        self.raca.numEscolhaDeAtributos = num
    }
    
    //MARK: VALOR GANHO ESCOLHAS DE ATRIBUTOS
    func valorGanhoEscolhaAtributos(_ valor: Int) {
        self.raca.valorGanhoEscolhaAtributos = valor
    }
    
    //MARK: DESLOCAMENTO
    func setDeslocamento(_ deslocamento: Float) {
        self.raca.deslocamento = deslocamento
    }
    
    //MARK: DESLOCAMENTO SUBRACA
    func setDeslocamentoSubraca(_ deslocamentos: [DeslocamentoSubraca]) {
        self.raca.deslocamentoSubraca = deslocamentos
    }
    
    //MARK: IDIOMAS
    func setIdiomas(_ idiomas: [IdiomaAlfabeto]) {
        self.raca.idiomas = idiomas
    }
    
    //MARK: ESCOLHA DE IDIOMAS?
    func setPossuiEscolhaIdioma(_ possui: Bool) {
        self.raca.possuiEscolhaIdioma = possui
    }
    
    //MARK: SUBRACA ESCOLHE IDIOMA?
    func setSubracaPossuiEscolhaIdioma(_ possui: Bool) {
        self.raca.subracaPossuiEscolhaIdioma = possui
    }
    
    //MARK: SUBRACA QUE ESCOLHE IDIOMA
    func setSubracaComEscolhaIdioma(_ subraca: TipoSubRaca) {
        self.raca.subracaComEscolhaDeIdioma = subraca
    }
    
    //MARK: ESCOLHA IDIOMA
    func setEscolhaIdioma(_ idiomas: [Idioma]) {
        self.raca.escolhaIdioma = idiomas
    }
    
    //MARK: TRACOS
    func setTracos(tracos: [TraitJSON]) {
        self.raca.tracos = tracos
    }
    
    //MARK: PROF ARMAS
    func setProfArmas(_ armas: [ArmaJSON]) {
        self.raca.profArmas = armas
    }
    
    //MARK: PROF ARMA POR SUBRACA
    func setSubracaProfArma(_ profSubraca: [ProficienciaArmasPorSubraca]) {
        self.raca.subracaProfArma = profSubraca
    }
    
    //MARK: PROF FERRAMENTAS
    func setProfFerramentas(_ ferramentas: [FerramentaJSON]) {
        self.raca.profFerramentas = ferramentas
    }
    
    //MARK: SUBRACA PROF FERRAMENTA
    func setSubracaProfFerramenta(_ profSubaraca: [ProficienciaFerramentaPorSubraca]) {
        self.raca.subracaProfFerramenta = profSubaraca
    }
    
    //MARK: PROF ARMADURAS
    func setProArmaduras(_ armaduras: [ArmaduraJSON]) {
        self.raca.profArmaduras = armaduras
    }
    
    //MARK: SUBRACA PROF ARMADURA
    func setSubracaProfArmadura(_ profSubaraca: [ProficienciaArmaduraPorSubraca]) {
        self.raca.subracaProfArmaduras = profSubaraca
    }
    
    //MARK: PROF PERICIAS
    func setProfPericias(_ pericias: [Pericia]) {
        self.raca.profPericias = pericias
    }
    
    //MARK: SUBRACA PROF PERICIA
    func setSubracaProfPericia(_ profSubaraca: [ProficienciaPericiaPorSubraca]) {
        self.raca.subracaProfPericia = profSubaraca
    }
    
    //MARK: POSSUI ESCOLHA FERRAMENTA?
    func setPossuiEscolhaProfFerramentas(_ possui: Bool) {
        self.raca.possuiEscolhaProfFerramentas = possui
    }
    
    //MARK: ESCOLHAS FERRAMENTAS
    func setEscolhasProfFerramentas(_ ferramentas: [String]) {
        self.raca.escolhasProfFerramentas = ferramentas
    }
    
    //MARK: POSSUI ESCOLHA PERICIA?
    func setPossuiEscolhaProfPericias(_ possui: Bool) {
        self.raca.possuiEscolhaProfPericias = possui
    }
    
    //MARK: ESCOLHAS PERICIAS
    func setEscolhasProfPericias(_ pericias: [Pericia]) {
        self.raca.escolhasProfPericias = pericias
    }
    
    //MARK: QUANTIA ESCOLHA PERICIA
    func setQuantiaEscolhaPericia(_ quantia: Int) {
        self.raca.quantiaEscolhaPericia = quantia
    }
    
    //MARK: MAGIAS RECEBIDAS
    func setMagiasRecebidas(_ magias: [MagiaJSON]) {
        self.raca.magiasRecebidas = magias
    }
    
    //MARK: ESCOLHE MAGIAS?
    func setMagiasPorSubraca(_ magiaSubraca: MagiaSubraca) {
        self.raca.magiasPorSubraca = magiaSubraca
    }
    
    //MARK: ESCOLHA MAGIA
    func setSubracaEscolhaMagias(_ magias: MagiaEscolhaSubraca) {
        self.raca.subracaEscolhaMagias = magias
    }
    
    //MARK: GET FINAL
    func getRacaFinal() -> RacaEscolha {
        let buildedRaca = self.raca
        self.resetBuilder()
        return buildedRaca
    }
}
