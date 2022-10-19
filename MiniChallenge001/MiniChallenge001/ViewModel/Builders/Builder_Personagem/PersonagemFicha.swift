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
public struct ValoresAtributos : Codable, Hashable {
    var forca: Atributo
    var destreza: Atributo
    var constituicao: Atributo
    var inteligencia: Atributo
    var sabedoria: Atributo
    var carisma: Atributo
    
    public init() {
        self.forca = Atributo(nome: .forca, valor: 0)
        self.destreza = Atributo(nome: .destreza, valor: 0)
        self.constituicao = Atributo(nome: .constituicao, valor: 0)
        self.inteligencia = Atributo(nome: .inteligencia, valor: 0)
        self.sabedoria = Atributo(nome: .sabedoria, valor: 0)
        self.carisma = Atributo(nome: .carisma, valor: 0)
    }
    
    public init(_ valores: [Atributo]) {
        let indexForca: Int = valores.firstIndex(where: { $0.nome == .forca } ) ?? 3
        let indexDestreza: Int = valores.firstIndex(where: { $0.nome == .destreza } ) ?? 2
        let indexConstituicao: Int = valores.firstIndex(where: { $0.nome == .constituicao } ) ?? 1
        let indexInteligencia: Int = valores.firstIndex(where: { $0.nome == .inteligencia } ) ?? 4
        let indexSabedoria: Int = valores.firstIndex(where: { $0.nome == .sabedoria } ) ?? 5
        let indexCarisma: Int = valores.firstIndex(where: { $0.nome == .carisma } ) ?? 0
        
        self.forca = Atributo(nome: .forca, valor: valores[indexForca].valor)
        self.destreza = Atributo(nome: .destreza, valor: valores[indexDestreza].valor)
        self.constituicao = Atributo(nome: .constituicao, valor: valores[indexConstituicao].valor)
        self.inteligencia = Atributo(nome: .inteligencia, valor: valores[indexInteligencia].valor)
        self.sabedoria = Atributo(nome: .sabedoria, valor: valores[indexSabedoria].valor)
        self.carisma = Atributo(nome: .carisma, valor: valores[indexCarisma].valor)
    }
}

//MARK: STRUCT PERFIL
public struct PerfilPersonagem : Codable, Hashable {
    var foto: Data?
    var nomeFicha: String = ""
    var nomePersonagem: String = ""
    var idade: String = ""
    var altura: String = ""
    var peso: String = ""
    var olhos: String = ""
    var pele: String = ""
    var cabelo: String = ""
    var outros: String = ""
    var tracosPersonalidade: String = ""
    var ideais: String = ""
    var vinculo: String = ""
    var defeitos: String = ""
    var tendencia: TipoTendencia = .none
    var estiloVida: EstiloDeVida = .none
}

//MARK: PERSONAGEM FICHA
public struct PersonagemFicha: Json {
    public var id: Int = 0
    public var nome: String = ""
    
    init() {

    }
    
    //MARK: NÍVEIS
    public var nivel: Int = 1
    public var experiencica: Int = 0
    
    //MARK: CLASSES
    public var classeFinal: ClasseFicha = ClasseFicha()
    public var racaFinal: RacaFicha = RacaFicha()
    public var antecedenteFinal: AntecedentePersonagem = .none
    
    //MARK: INVENTARIO JSON
    public var magias: [MagiaJSON] = []
    public var armas: [ArmaJSON] = []
    public var armaduras: [ArmaduraJSON] = []
    public var equipamentos: [EquipamentoJSON] = []
    public var ferramentas: [FerramentaJSON] = []
    public var montarias: [MontariaJSON] = []
    public var equipamentosMontaria: [EquipamentoMontariaJSON] = []
    public var veiculosAquaticos: [VeiculoAquaticoJSON] = []
    public var bugigangas: [BugigangaJSON] = []
    public var carteira: [Moeda] = [
        .init(quantidade: 0, tipo: .cobre),
        .init(quantidade: 0, tipo: .prata),
        .init(quantidade: 0, tipo: .electro),
        .init(quantidade: 0, tipo: .ouro),
        .init(quantidade: 0, tipo: .platina)
    ]
    
    //MARK: PONTOS
    public var classeArmadura: Int = 0
    public var iniciativa: Int = 0
    public var deslocamento: Float = 0
    public var pontosVidaMaximo: Int = 0
    public var pontosVida: Int = 0
    public var pontosVidaTemporário: Int = 0
    public var dadoVidaMaximo: Int = 0
    public var quantiaDadoVida: Int = 0
    public var resistenciaMorte: ResistenciaMorte = ResistenciaMorte()
    public var condicoes: [Condicao] = []
    public var exaustao: Exaustao = .none
    
    //MARK: PERFIL
    public var fotoPersonagem: Data?
    public var nomePersonagem: String = ""
    public var idadePersonagem: Int = 0
    public var alturaPersonagem: Float = 0
    public var pesoPersonagem: Float = 0
    public var olhosPersonagem: String = ""
    public var pelePersonagem: String = ""
    public var cabeloPersonagem: String = ""
    public var outrosPersonagem: String = ""
    public var tracosPersonalidadePersonagem: String = ""
    public var ideaisPersonagem: String = ""
    public var vinculoPersonagem: String = ""
    public var defeitosPersonagem: String = ""
    public var tendenciaPersonagem: TipoTendencia = .none // leal e bom, essas parada
    public var estiloVida: EstiloDeVida = .none
    
    //MARK: ATRIBUTOS E IDIOMAS
    public var pontosAtributos: ValoresAtributos = ValoresAtributos()
    public var idiomas: [IdiomaAlfabeto] = []
    
    //MARK: PROFICIENCIAS
    public var profSalvaguardas: [AtributosSalvaguarda] = []
    var profPericias: [Pericia] = []
    public var profArmas: [ArmaJSON] = [] // ou string, dependendo de como a gente resolvar trabalhar as proficiencias
    public var profArmaduras: [ArmaduraJSON] = []
    public var profFerramentas: [FerramentaJSON] = []
}
