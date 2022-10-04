//
//  ClasseFinal.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 04/10/22.
//

import Foundation

// todas as opcoes de escolhas possiveis serao salvas aqui
public struct ClasseEscolhasDefinidas : Codable {
    var escolhaRiqueza: Moeda = Moeda(quantidade: 0, tipo: .none)
    var escolhaProfFerramentas: [FerramentaJSON] = []
    var escolhaProfPericias: [Pericia] = []
    var escolhasOpcoesEquip: [EscolhaOpcao] = []
}

public class ClasseFinal {
    //MARK: CLASSE, VIDA E DINDIN
    var tipoClasse: ClassePersonagem = .none
    var caracteristicasClasse: [CaracteristicaJSON] = []
    var subClasses: [SubClasseEscolha] = [] // aqui tem as subclasses e suas respectivas caracteristicas
    var dadoVida: String = ""
    var vidaInicial: Int = 0
    var vidasSeguintes: String = ""
    var riquezaInicial: Moeda = Moeda(quantidade: 0, tipo: .none)
    
    //MARK: MAGIAS
    var magiasConhecidas: [MagiasConhecidas] = []
    var espacosMagia: [EspacosDeMagias] = []
    
    //MARK: PROFICIENCIAS
    var profSalvaguardas: [AtributosSalvaguarda] = []
    var profArmas: [ArmaJSON] = []
    var profArmaduras: [ArmaduraJSON] = []
    var profFerramentas: [FerramentaJSON] = []
    var profPericias: [Pericia] = []
    
    //MARK: EQUIP INICIAIS
    var armasIniciais: [ArmaJSON] = []
    var armadurasIniciais: [ArmaduraJSON] = []
    var equipamentosIniciais: [EquipamentoJSON] = []
    var ferramentasIniciais: [FerramentaJSON] = []
    var pacotesIniciais: [PacoteEquipamento] = []
    
    //MARK: ESPECIFICOS
    var pontosEspecificosNumerico: [PontoEspecificoNumerico] = []
    var pontosEspecificosTexto: [PontoEspecificoTexto] = []
}
