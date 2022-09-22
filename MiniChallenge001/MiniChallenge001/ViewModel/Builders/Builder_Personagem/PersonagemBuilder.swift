//
//  PersonagemBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 21/09/22.
//

import Foundation
import SwiftUI

//MARK: Enum Tendencia
enum TipoTendencia : String {
    case lealBom = "Leal e Bom"
    case neutroBom = "Neutro e Bom"
    case caoticoBom = "Caótico e Bom"
    case lealNeutro = "Leal e Neutro"
    case neutro = "Neutro"
    case caoticoNeutro = "Caótico e Neutro"
    case lealMau = "Leal e Mau"
    case neutroMau = "Neutro e Mau"
    case caoticoMau = "Caótico e Mau"
}

//MARK: Struct Tendencia
struct Tendencia {
    var tipoTendencia: TipoTendencia
    var descricao: String
}

//MARK: Struct ValoresAtributos
struct ValoresAtributos {
    var forca: Int
    var destreza: Int
    var constituicao: Int
    var inteligencia: Int
    var sabedoria: Int
    var carisma: Int
}

//MARK: PersonagemBuilder
protocol PersonagemBuilder {
    func resetBuilder() -> Void
    func buildRaca() -> Raca
    func buildClasse() -> ClasseEscolha
    func buildAntecedente() -> Antecedente
    func buildNome() -> String
    func buildTendencia() -> Tendencia
    func buildFoto() -> Image
    func buildIdade() -> Int
    func buildAltura() -> Float
    func buildPeso() -> Float
    func buildOlhos() -> String
    func buildPele() -> String
    func buildCabelo() -> String
    func buildOutros() -> String
    func buildValoresAtributos() -> ValoresAtributos
    func buildNomeFicha() -> String
}
