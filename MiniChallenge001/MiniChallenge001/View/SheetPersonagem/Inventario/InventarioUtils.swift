//
//  InventarioUtils.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 18/10/22.
//

import Foundation
import SwiftUI

struct ItemTabela<Item> where Item: Json {
    var item: Item
    var quantidade: Int
}

class InventarioUtils<Item> where Item: Json {
    
    public static func formatListEquipamentos(equipamentos: [EquipamentoJSON]) -> [EquipamentoJSON] {
        if equipamentos.isEmpty { return [] }
        
        var temp: [EquipamentoJSON] = []
        
        for i in equipamentos {
            if temp.contains(where: { $0.id == i.id }) {
                temp[temp.firstIndex(where: {$0.id == i.id }) ?? 0].quantidade += i.quantidade
            } else {
                temp.append(i)
            }
        }
        
        return temp.sorted(by: {$0.nome < $1.nome})
    }
    
    public static func formatListItem(itens: [Item]) -> [ItemTabela<Item>] {
        if itens.isEmpty { return [] }
        var temp: [ItemTabela<Item>] = []
        for i in itens {
            if temp.contains(where: {$0.item.id == i.id }) {
                temp[temp.firstIndex(where: { $0.item.id == i.id }) ?? 0].quantidade += 1
            } else {
                temp.append(ItemTabela(item: i, quantidade: 1))
            }
        }
        return temp.sorted(by: {$0.item.nome < $1.item.nome})
    }
}

