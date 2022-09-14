//
//  JSONObject.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 12/09/22.
//

import Foundation

protocol Item: Codable {
    var id: Int { get }
    var nome: String { get }
}

// MARK: Struct Moeda
enum TipoMoeda: String, Codable {
    case cobre = "Cobre"
    case prata = "Prata"
    case electro = "Electro"
    case ouro = "Ouro"
    case platina = "Platina"
}

struct Moeda: Codable {
    var quantidade: Int
    var tipo: TipoMoeda
}

// MARK: Struct Arma
enum TipoDano: String, Codable {
    case perfurante = "Perfurante"
    case cortante = "Cortante"
    case concussao = "Concussão"
    case none = "Nenhum"
}

enum EstiloArma: String, Codable {
    case distancia = "Distância"
    case cac = "Corpo a Corpo"
}

enum TipoArma: String, Codable {
    case simples = "Simples"
    case marcial = "Marcial"
}

struct Dano: Codable {
    var dano: String
    var tipo: TipoDano
}

struct ArmaJSON: Item {
    var id: Int
    var nome: String
    var tipo: TipoArma
    var estilo: EstiloArma
    var preco: Moeda
    var dano: Dano
    var peso: Float
    var propriedades: String
}

// MARK: Struct Bugiganga

struct BugigangaJSON: Item {
    var id: Int
    var nome: String
    var valor: Int
}

// MARK: Struct Armadura

enum TipoArmadura: String, Codable {
    case leve = "Leve"
    case media = "Média"
    case pesada = "Pesada"
    case escudo = "Escudo"
}

struct ArmaduraJSON: Item {
    var id: Int
    var nome: String
    var tipo: TipoArmadura
    var preco: Moeda
    var valorCA: Int
    var modCA: Int
    var forca: Int
    var desv_furtividade: Bool
    var peso: Float
    var descricao: String
}

// MARK: Struct Equipamento

enum CategoriaEquipamento: String, Codable {
    case focoArcano = "Foco Arcano"
    case focoDruidico = "Foco Druídico"
    case municao = "Munição"
    case simboloSagrado = "Símbolo Sagrado"
    case none = "Sem Categoria"
}

struct EquipamentoJSON: Item {
   var id: Int
   var nome: String
   var categoria: CategoriaEquipamento
   var preco: Moeda
   var peso: Float
   var quantidade: Int
   var descricao: String
}

// MARK: Ferramenta

enum TipoFerramenta: String, Codable {
    case artesao = "Ferramenta de artesão"
    case navegacao = "Ferramenta de navegador"
    case ladrao = "Ferramenta de ladrão"
    case musical = "Instrumento musical"
    case disfarce = "Kit de disfarce"
    case falsificacao = "Kit de falsificação"
    case herbalismo = "Kit de herbalismo"
    case jogo = "Kit de jogo"
    case veneno = "Kit de venenos"
}

struct FerramentaJSON: Item {
    var id: Int
    var nome: String
    var tipo: TipoFerramenta
    var preco: Moeda
    var peso: Float
    var descricao: String
}

// MARK: Magia

enum ClassePersonagem: String, Codable {
    case bardo = "Bardo"
    case bruxo = "Bruxo"
    case clerigo = "Clérigo"
    case druida = "Druida"
    case feiticeiro = "Feiticeiro"
    case mago = "Mago"
    case paladino = "Paladino"
    case patrulheiro = "Patrulheiro"
}

enum EscolaMagia: String, Codable {
    case abjuracao = "Abjuração"
    case adivinhacao = "Adivinhação"
    case conjuracao = "Conjuração"
    case encantamento = "Encantamento"
    case evocacao = "Evocação"
    case ilusao = "Ilusão"
    case necromancia = "Necromancia"
    case transmutacao = "Transmutação"
}

struct MagiaJSON: Item {
    var id: Int
    var nome: String
    var nivel: Int
    var classes: [ClassePersonagem]
    var escola: EscolaMagia
    var ritual: Bool
    var tempoConjuracao: String
    var alcance: String
    var componentes: String
    var duracao: String
    var descricao: String
}

// MARK: Montaria

struct MontariaJSON: Item {
    var id: Int
    var nome: String
    var preco: Moeda
    var delocamento: Float
    var capacidadeCarga: Float
}

// MARK: Equipameto Montaria

struct EquipamentoMontariaJSON: Item {
    var id: Int
    var nome: String
    var preco: Moeda
    var peso: Float
}

// MARK: Veiculo Aquáitico

struct VeiculoAquaticoJSON: Item {
    var id: Int
    var nome: String
    var preco: Moeda
    var velocidade: Float
}
