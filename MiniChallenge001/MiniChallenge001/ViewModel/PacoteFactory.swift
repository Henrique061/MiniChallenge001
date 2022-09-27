//
//  PacoteFactory.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 26/09/22.
//

import Foundation

public class PacoteFactory {
    public static func makePacoteArtista() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Mochila", "Saco de dormir", "Cantil"])
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Vela", quantidade: 5))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 5))
        
        return equipamentos
    }
    
    public static func makePacoteAssaltante() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Mochila", "Esferas (sacola com 1.000)", "Sino", "Pé de cabra", "Martelo", "Lanterna coberta", "Cantil", "Caixa de fogo", "Corda de cânhamo (15 metros)"])
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Óleo", quantidade: 2))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Vela", quantidade: 5))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 5))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Píton", quantidade: 10))
        
        
        return equipamentos
    }
    
    public static func makePacoteAventureiro() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Mochila", "Pé de cabra", "Martelo", "Caixa de fogo", "Cantil", "Corda de cânhamo (15 metros)"])
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Píton", quantidade: 10))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Tocha", quantidade: 10))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 10))
        

        return equipamentos
    }
    
    public static func makePacoteDiplomata() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Baú", "Roupas finas", "Tinta", "Caneta tinteiro", "Lâmpada", "Perfume", "Parafina", "Sabão"])
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Óleo", quantidade: 2))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Papel", quantidade: 5))

        return equipamentos
    }
    
    public static func makePacoteEstudioso() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Mochila", "Livro", "Tinta", "Caneta tinteiro"])
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Pergaminho", quantidade: 5))
        
        return equipamentos
    }
    
    public static func makePacoteExplorador() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Mochila", "Saco de dormir", "Caixa de fogo", "Cantil", "Corda de cânhamo (15 metros)"])
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Tocha", quantidade: 10))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 10))
        
        return equipamentos
    }
    
    public static func makePacoteSacerdote() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Mochila", "Cobertor de inverno", "Caixa de fogo", "Roupas comuns", "Cantil"])
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Vela", quantidade: 10))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 2))


        return equipamentos
    }
}
