//
//  PacoteFactory.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 26/09/22.
//

import Foundation

public enum PacoteEquipamento : String, Codable {
    case pacoteArtista = "Pacote de Artista"
    case pacoteAssaltante = "Pacote de Assaltante"
    case pacoteAventureiro = "Pacote de Aventureiro"
    case pacoteDiplomata = "Pacote de Diplomata"
    case pacoteEstudioso = "Pacote de Estudioso"
    case pacoteExplorador = "Pacote de Explorador"
    case pacoteSacerdote = "Pacote de Sacerdote"
    
    case none = "Nenhum"
}

public class PacoteFactory {
    public func orderPacote(_ pacote: PacoteEquipamento) -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = []
        
        switch pacote {
        case .pacoteArtista:
            equipamentos = self.makePacoteArtista()
            break
            
        case .pacoteAssaltante:
            equipamentos = self.makePacoteAssaltante()
            break
            
        case .pacoteAventureiro:
            equipamentos = self.makePacoteAventureiro()
            break
            
        case .pacoteDiplomata:
            equipamentos = self.makePacoteDiplomata()
            break
            
        case .pacoteEstudioso:
            equipamentos = self.makePacoteEstudioso()
            break
            
        case .pacoteExplorador:
            equipamentos = self.makePacoteExplorador()
            break
            
        case .pacoteSacerdote:
            equipamentos = self.makePacoteSacerdote()
            break
            
        default:
            break
        }
        
        return equipamentos
    }
    
    private func makePacoteArtista() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Mochila", "Saco de dormir", "Cantil"])
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Vela", quantidade: 5))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 5))
        
        return equipamentos
    }
    
    private func makePacoteAssaltante() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Mochila", "Esferas (sacola com 1.000)", "Sino", "Pé de cabra", "Martelo", "Lanterna coberta", "Cantil", "Caixa de fogo", "Corda de cânhamo (15 metros)"])
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Óleo", quantidade: 2))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Vela", quantidade: 5))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 5))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Píton", quantidade: 10))
        
        
        return equipamentos
    }
    
    private func makePacoteAventureiro() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Mochila", "Pé de cabra", "Martelo", "Caixa de fogo", "Cantil", "Corda de cânhamo (15 metros)"])
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Píton", quantidade: 10))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Tocha", quantidade: 10))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 10))
        

        return equipamentos
    }
    
    private func makePacoteDiplomata() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Baú", "Roupas finas", "Tinta", "Caneta tinteiro", "Lâmpada", "Perfume", "Parafina", "Sabão"])
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Óleo", quantidade: 2))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Papel", quantidade: 5))

        return equipamentos
    }
    
    private func makePacoteEstudioso() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Mochila", "Livro", "Tinta", "Caneta tinteiro"])
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Pergaminho", quantidade: 5))
        
        return equipamentos
    }
    
    private func makePacoteExplorador() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Mochila", "Saco de dormir", "Caixa de fogo", "Cantil", "Corda de cânhamo (15 metros)"])
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Tocha", quantidade: 10))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 10))
        
        return equipamentos
    }
    
    private func makePacoteSacerdote() -> [EquipamentoJSON] {
        var equipamentos: [EquipamentoJSON] = BuscaJson.buscaEquipamentoPorNomes(nomes: ["Mochila", "Cobertor de inverno", "Caixa de fogo", "Roupas comuns", "Cantil"])
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Vela", quantidade: 10))
        equipamentos.append(BuscaJson.buscaEquipamentoPorNomeQuantidade(nome: "Rações de viagem", quantidade: 2))


        return equipamentos
    }
}
