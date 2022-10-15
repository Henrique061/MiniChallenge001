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
    var sucesso: Int = 0
    var falha: Int = 0
}

//MARK: ESTILO DE VIDA
public enum EstiloDeVida: String, Codable, CaseIterable {
    case miseravel = "Miserável"
    case esqualido = "Esquálido"
    case pobre = "Pobre"
    case modesto = "Modesto"
    case confortavel = "Confortável"
    case rico = "Rico"
    case aristocratico = "Aristocrático"
    
    case none = "Nenhum"
}

//MARK: ENUM TENDENCIA
public enum TipoTendencia : String, Codable, CaseIterable {
    case lealBom = "Leal e Bom"
    case neutroBom = "Neutro e Bom"
    case caoticoBom = "Caótico e Bom"
    case lealNeutro = "Leal e Neutro"
    case neutro = "Neutro"
    case caoticoNeutro = "Caótico e Neutro"
    case lealMau = "Leal e Mau"
    case neutroMau = "Neutro e Mau"
    case caoticoMau = "Caótico e Mau"
    
    case none = "Nenhum"
}

//MARK: STRICT TENDENCIA
struct Tendencia : Codable {
    var tipoTendencia: TipoTendencia
    var descricao: String
}

//MARK: VALORES ATRIBUTOS
struct ValoresAtributos : Codable {
    var forca: Int = 0
    var destreza: Int = 0
    var constituicao: Int = 0
    var inteligencia: Int = 0
    var sabedoria: Int = 0
    var carisma: Int = 0
}

//MARK: PERSONAGEM FICHA
public struct PersonagemFicha: Json {
    var id: Int = 0
    var nome: String = ""
    
    init() {

    }
    
    //MARK: NÍVEIS
    var nivel: Int = 1
    var experiencica: Int = 0
    
    //MARK: CLASSES
    var classeFinal: ClasseFicha = ClasseFicha()
    var racaFinal: RacaFicha = RacaFicha()
    var antecedenteFinal: AntecedentePersonagem = .none
    
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
    var carteira: [Moeda] = [
        .init(quantidade: 0, tipo: .cobre),
        .init(quantidade: 0, tipo: .prata),
        .init(quantidade: 0, tipo: .electro),
        .init(quantidade: 0, tipo: .ouro),
        .init(quantidade: 0, tipo: .platina)
    ]
    
    //MARK: PONTOS
    var classeArmadura: Int = 0
    var iniciativa: Int = 0
    var deslocamento: Float = 0
    var pontosVida: Int = 0
    var pontosVidaTemporário: Int = 0
    var dadoVida: String = ""
    var quantiaDadoVida: Int = 0
    var resistenciaMorte: ResistenciaMorte = ResistenciaMorte()
    
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
    var tendenciaPersonagem: TipoTendencia = .none // leal e bom, essas parada
    var estiloVida: EstiloDeVida = .none
    
    //MARK: PONTOS ATRIBUTOS
    var pontosAtributos: ValoresAtributos = ValoresAtributos()
    
    //MARK: PROFICIENCIAS
    var profSalvaguardas: [AtributosSalvaguarda] = []
    var profPericias: [Pericia] = []
    var profArmas: [ArmaJSON] = [] // ou string, dependendo de como a gente resolvar trabalhar as proficiencias
    var profArmaduras: [ArmaduraJSON] = []
    var profFerramentas: [FerramentaJSON] = []
}
