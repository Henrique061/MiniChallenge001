//
//  PersonagemBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 21/09/22.
//

import Foundation

protocol PersonagemBuilder {
    func resetBuilder() -> Void
    func setClasse() -> Classe
    func setRaca() -> Void
    func setAntecedente() -> Void
    func setNome() -> String
    func setTendencia() -> Void
}
