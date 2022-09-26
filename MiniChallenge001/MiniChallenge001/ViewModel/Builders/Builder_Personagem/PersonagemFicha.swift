//
//  PersonagemFicha.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 26/09/22.
//

import Foundation
import SwiftUI

//MARK: RESISTENCIA MORTE
public struct ResistenciaMorte : Codable {
    var sucesso: [Int]
    var falha: [Int]
}

//MARK: ENUM TENDENCIA
enum TipoTendencia : String, Codable, CaseIterable {
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

//MARK: STRICT TENDENCIA
struct Tendencia : Codable {
    var tipoTendencia: TipoTendencia
    var descricao: String
}

//MARK: VALORES ATRIBUTOS
struct ValoresAtributos : Codable {
    var forca: Int
    var destreza: Int
    var constituicao: Int
    var inteligencia: Int
    var sabedoria: Int
    var carisma: Int
}

//MARK: PERSONAGEM FICHA
public class PersonagemFicha: Json {
    var id: Int = 0
    var nome: String = ""
    
    init() {

    }
    
    //MARK: CLASSES
    var classeFinal: ClasseFinal?
    var racaFinal: RacaFinal?
    var antecedenteFinal: AntecedentePersonagem?
    
    //MARK: INVENTARIO JSON
    var magias: [MagiaJSON] = []
    var armas: [ArmaJSON] = []
    var armaduras: [ArmaduraJSON] = []
    var equipamentos: [EquipamentoJSON] = []
    var ferramentas: [FerramentaJSON] = []
    var montarias: [MontariaJSON] = []
    var equipamentosMontaria: [EquipamentoMontariaJSON] = []
    var veiculosAquaticos: [VeiculoAquaticoJSON] = []
    var bugigangas: [BugigangaJSON] = []
    var carteira: [Moeda] = []
    
    //MARK: PONTOS
    var classeArmadura: Int = 0
    var iniciativa: Int = 0
    var deslocamento: Float = 0
    var pontosVida: Int = 0
    var pontosVidaTemporário: Int = 0
    var dadoVida: String = ""
    var quantiaDadoVida: Int = 0
    var resistenciaMorte: ResistenciaMorte?
    
    //MARK: PERFIL
    var fotoPersonagem: Data?
    var nomePersonagem: String = ""
    var idadePersonagem: Int = 0
    var alturaPersonagem: Float = 0
    var pesoPersonagem: Float = 0
    var olhosPersonagem: String = ""
    var pelePersonagem: String = ""
    var cabeloPersonagem: String = ""
    var outrosPersonagem: String = ""
    var tracosPersonalidadePersonagem: String = ""
    var ideaisPersonagem: String = ""
    var vinculoPersonagem: String = ""
    var defeitosPersonagem: String = ""
    var tendenciaPersonagem: TipoTendencia? = nil // leal e bom, essas parada
    
    //MARK: PONTOS ATRIBUTOS
    var pontosAtributos: ValoresAtributos?
    
    //MARK: PROFICIENCIAS
    var profSalvaguardas: [AtributosSalvaguarda] = []
    var profPericias: [Pericia] = []
    var profArmas: [ArmaJSON] = [] // ou string, dependendo de como a gente resolvar trabalhar as proficiencias
    var profArmaduras: [ArmaduraJSON] = []
    var profFerramentas: [FerramentaJSON] = []
}
