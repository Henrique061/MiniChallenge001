//
//  Item.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 15/09/22.
//

import Foundation

protocol Item: Codable {
    var id: Int { get }
    var nome: String { get }
}