//
//  PacoteFactory.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 26/09/22.
//

import Foundation

public class PacoteFactory {
    public static func makePacoteArtista() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = []
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Mochila"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Saco de dormir"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Cantil"))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Vela", quantidade: 5))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 5))
        
        return equipamentos
    }
    
    public static func makePacoteAssaltante() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = []
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Mochila"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Esferas (sacola com 1.000)"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Sino"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Pé de cabra"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Martelo"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Lanterna coberta"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Cantil"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Caixa de fogo"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Corda de cânhamo (15 metros)"))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Óleo", quantidade: 2))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Vela", quantidade: 5))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 5))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Píton", quantidade: 10))
        
        
        return equipamentos
    }
    
    public static func makePacoteAventureiro() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = []
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Mochila"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Pé de cabra"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Martelo"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Caixa de fogo"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Cantil"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Corda de cânhamo (15 metros)"))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Píton", quantidade: 10))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Tocha", quantidade: 10))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 10))
        

        return equipamentos
    }
    
    public static func makePacoteDiplomata() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = []
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Baú"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas finas"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Tinta"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Caneta tinteiro"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Lâmpada"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Perfume"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Parafina"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Sabão"))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Óleo", quantidade: 2))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Papel", quantidade: 5))

        return equipamentos
    }
    
    public static func makePacoteEstudioso() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = []
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Mochila"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Livro"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Tinta"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Caneta tinteiro"))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Pergaminho", quantidade: 5))
        
        return equipamentos
    }
    
    public static func makePacoteExplorador() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = []
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Mochila"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Saco de dormir"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Caixa de fogo"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Cantil"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Corda de cânhamo (15 metros)"))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Tocha", quantidade: 10))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 10))
        
        return equipamentos
    }
    
    public static func makePacoteSacerdote() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = []
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Mochila"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Cobertor de inverno"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Caixa de fogo"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Roupas comuns"))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNome(nome: "Cantil"))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Vela", quantidade: 10))
        equipamentos.append(contentsOf: BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 2))


        return equipamentos
    }
}
