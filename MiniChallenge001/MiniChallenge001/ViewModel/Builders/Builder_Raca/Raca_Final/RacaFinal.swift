//
//  RacaFinal.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 29/09/22.
//

import Foundation

// todas as opcoes de escolhas possiveis serao salvas aqui
public struct RacaEscolhasDefinidas : Codable {
    var escolhaAtributos: [AtributosGanhosRaca] = []
    var escolhaIdioma: IdiomaAlfabeto = IdiomaAlfabeto()
    var escolhaProfFerramentaAdicional: [FerramentaJSON] = []
    var escolhaProfPericias: [Pericia] = []
    var escolhaMagia: [MagiaJSON] = []
}

//MARK: Raca Final
// classe para armazenar as infos dadas na escolha da raca para mandar pro personagem final
public class RacaFinal {
    var tipoRaca: TipoRaca = .none // pega da raca
    var subRaca: TipoSubRaca = .none // pega da subraca
    var atributosAdicionais: [AtributosGanhosRaca] = [] // pega da raca, subraca E escolha
    var deslocamento: Float = 0 // pega da raca OU subraca
    var idiomas: [IdiomaAlfabeto] = [] // pega da raca E da escolha
    var tracos: [TraitJSON] = [] // pega da raca E subraca
    var profArmas: [ArmaJSON] = [] // pega da raca OU subraca
    var profArmaduras: [ArmaduraJSON] = [] // pega da raca OU subraca
    var profFerramentas: [FerramentaJSON] = [] // pega da raca OU subraca, E escolha
    var profPericias: [Pericia] = [] // pega da raca E escolha
    var magiasRecebidas: [MagiaJSON] = [] // pega da raca OU subraca OU Escolha
}
