//
//  Classe.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 21/09/22.
//

import Foundation

// MARK: Magias conhecidas de cada classe por nivel
struct MagiasConhecidas {
    var nivel: Int
    var quantiaTruques: Int
    var quantiaMagias: Int
}

// MARK: Espacos de magia de cada classe por nivel e nivel de circulo magico
struct EspacosDeMagias {
    var nivelPersonagem: Int
    var niveisCirculo: [CirculoMagico] // cada indice representa 1 nivel de circulo magico
}

struct CirculoMagico {
    var nivelCirculo: Int
    var limiteUsoMagia: Int?
    var magiasConhecidas: [String]
}

//MARK: Pontos especificos de classe (chi e furia por exemplo), mostrando um valor numerico ou textual
struct PontoEspecificoTexto {
    var nomeValor: String
    var valorTextural: String
}

struct PontoEspecificoNumerico {
    var nomeValor: String
    var valorNumerico: Int
}

//MARK: Enum ClassePersonagem
enum ClassePersonagem: String, Codable, Hashable {
    case barbaro = "Bárbaro"
    case bardo = "Bardo"
    case bruxo = "Bruxo"
    case clerigo = "Clérigo"
    case druida = "Druida"
    case feiticeiro = "Feiticeiro"
    case guerreiro = "Guerreiro"
    case ladino = "Ladino"
    case mago = "Mago"
    case monge = "Monge"
    case paladino = "Paladino"
    case patrulheiro = "Patrulheiro"
}

//MARK: Enum Subclasse
enum SubclassePersonagem : String {
    case BB_caminhoFurioso = "Caminho Furioso"
    case BB_caminhoGuerreiroTotemico = "Caminho do Guerreiro Totêmico"
    case BD_colegioConhecimento = "Colégio do Conhecimento"
    case BD_colegioBravura = "Colégio da Bravura"
    case BX_arquifada = "A Arquifada"
    case BX_corruptor = "O Corruptor"
    case BX_grandeAntigo = "O Grande Antigo"
    case CL_dominioConhecimento = "Domínio do Conhecimento"
    case CL_dominioEnganacao = "Domínio da Enganação"
    case CL_dominioGuerra = "Domínio da Guerra"
    case CL_dominioLuz = "Domínio da Luz"
    case CL_domonioNatureza = "Domínio da Natureza"
    case CL_dominioTempestade = "Domínio da Tempestade"
    case CL_dominioVida = "Domínio da Vida"
    case DR_circuloTerra = "Círculo da Terra"
    case DR_circuloLua = "Círculo da Lua"
    case FE_linhagemDraconica = "Linhagem Dracônica"
    case FE_magiaSelvagem = "Magia Selvagem"
    case GU_campeao = "Campeão"
    case GU_cavaleiroArcano = "Cavaleiro Arcano"
    case GU_mestreBatalha = "Mestre de Batalha"
    case LA_assassino = "Assassino"
    case LA_ladrao = "Ladrão"
    case LA_trapaceiroArcano = "Trapaceiro Arcano"
    case MA_escolaAbjuracao = "Escola de Abjuração"
    case MA_escolaAdivinhacao = "Escola de Adivinhação"
    case MA_escolaConjuracao = "Escola de Conjuração"
    case MA_escolaEvocacao = "Escola de Evocação"
    case MA_escolaIlusao = "Escola de Ilusão"
    case MA_escolaNecromancia = "Escola de Necromancia"
    case MA_escolaTransmutacao = "Escola de Transmutação"
    case MO_caminhoMaoAberta = "Caminho da Mão Aberta"
    case MO_caminhoSombra = "Caminho da Sombra"
    case MO_caminhoQuatroElementos = "Caminho dos Quatro Elementos"
    case PD_juramentoDevocao = "Juramento de Devoção"
    case PD_juramentoAncioes = "Juramento dos Anciões"
    case PD_juramentoVinganca = "Juramento de Vingança"
    case PT_conclaveBesta = "Conclave da Besta"
    case PT_conclaveCacador = "Conclave do Caçador"
    case PT_conclaveRastreadorSubterraneo = "Conclave do Rastreador Subterrâneo"
}

//MARK: Classe
public class Classe {
    var classe: ClassePersonagem // enum de classes
    var nomeClasse: String
    var caracteristicasClasse: [String] // COLOCAR CARACTERISTICAS AQUI
    var dadoVida: String
    var profSalvaguardas: [String]
    var profArmas: [ArmaJSON]?
    var profArmaduras: [ArmaduraJSON]?
    var profFerramentas: [FerramentaJSON]?
    var armasIniciais: [ArmaJSON]?
    var armadurasIniciais: [ArmaduraJSON]?
    var equipamentosIniciais: [EquipamentoJSON]?
    var ferramentasIniciais: [FerramentaJSON]?
    var vidaInicial: Int
    var profPericias: [String]
    var possuiMagias: Bool
    var magiasConhecidas: [MagiasConhecidas]?
    var espacosDeMagia: [EspacosDeMagias]?
    var pontosEspecificosNumerico: [PontoEspecificoNumerico]?
    var pontosEspecificosTexto: [PontoEspecificoTexto]?
    var riquezaInicial: Int
    
    init (classe: ClassePersonagem) {
        self.classe = classe
        self.nomeClasse = classe.rawValue
        self.caracteristicasClasse = []
        self.dadoVida = ""
        self.profSalvaguardas = []
        self.profArmas = nil
        self.profArmaduras = nil
        self.profFerramentas = nil
        self.armasIniciais = nil
        self.armasIniciais = nil
        self.armadurasIniciais = nil
        self.equipamentosIniciais = nil
        self.ferramentasIniciais = nil
        self.vidaInicial = 0
        self.profPericias = []
        self.possuiMagias = true
        self.magiasConhecidas = nil
        self.espacosDeMagia = nil
        self.pontosEspecificosNumerico = nil
        self.pontosEspecificosTexto = nil
        self.riquezaInicial = 0
    }
}

//MARK: SubClasse
public class SubClasse : Classe {
    var subclasse: SubclassePersonagem?
    var subclasseNome: String?
    var caracteristicasSubClasse: [String] // COLOCAR CARACTERISTICAS AQUI
    
    override init (classe: ClassePersonagem) {
        self.subclasse = nil
        self.subclasseNome = nil
        self.caracteristicasSubClasse = []
        super.init(classe: classe)
    }
}
