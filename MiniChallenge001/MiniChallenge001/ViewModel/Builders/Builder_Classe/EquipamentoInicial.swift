//
//  EquipamentoInicial.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 22/09/22.
//

import Foundation

class EquipamentoInicial {
    var opcoes: [OpcaoEquipamentoInicial]
    
    init(opcoes: [OpcaoEquipamentoInicial]) {
        self.opcoes = opcoes
    }
}

class OpcaoEquipamentoInicial {
    var numeroOpcao: Int
    var opcoes: [(nome: String, arquivo: String)]
    
    init(numeroOpcao: Int, opcoes: [(String, String)]) {
        self.numeroOpcao = numeroOpcao
        self.opcoes = opcoes
    }
}

// Pode ser um equipamento específico -> equipamento-###
// Pode ser a lista de equipamento -> equipamento

/**
 if string.contains("-") {
    equipamento único
        
        filtrar o tipo de equipamento (arma, armadura,...)
        pega o tipo de decoder
        adiciona na lista correta
 } else {
    a pasta de equipamentos
 
    encontrar o tipo de equipamento
    pegar o tipo de decoder
    mostrar a lista de equipamento
    escolher o equipamento
    adicionar na lista correta
 }
 */


