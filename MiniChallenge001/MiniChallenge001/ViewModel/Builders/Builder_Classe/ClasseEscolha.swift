//
//  Classe.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 21/09/22.
//

import Foundation

// MARK: Magias conhecidas de cada classe por nivel
public struct MagiasConhecidas : Codable {
    var nivel: Int
    var quantiaTruques: Int
    var quantiaMagias: Int
}

// MARK: Espacos de magia de cada classe por nivel e nivel de circulo magico
public struct EspacosDeMagias : Codable {
    var nivelPersonagem: Int
    var niveisCirculo: CirculoMagico // cada indice representa 1 nivel de circulo magico
}

public struct CirculoMagico : Codable {
    var nivelCirculo: [Int]
    var limiteUsoMagia: [Int]
}

//MARK: Pontos especificos de classe (chi e furia por exemplo), mostrando um valor numerico ou textual
struct PontoEspecificoTexto : Codable {
    var nomeValor: String
    var textoPorNivel: [String]
}

struct PontoEspecificoNumerico : Codable {
    var nomeValor: String
    var valorPorNivel: [Int]
}

//MARK: Enum ClassePersonagem
public enum ClassePersonagem: String, Codable, Hashable, CaseIterable {
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
    
    case none = "Nenhum"
}

//MARK: Enum Subclasse
public enum SubclassePersonagem : String, Codable {
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
    
    case none = "Nenhum"
}

enum AtributosSalvaguarda : String, Codable {
    case forca = "Força"
    case destreza = "Destreza"
    case constituicao = "Constituição"
    case inteligencia = "Inteligência"
    case sabedoria = "Sabedoria"
    case carisma = "Carisma"
    
    case none = "Nenhum"
}

enum Pericia : String, CaseIterable, Codable {
    case acrobacia = "Acrobacia (DES)"
    case adestrarAnimais = "Adestrar Animais (SAB)"
    case arcanismo = "Arcanismo (INT)"
    case atletismo = "Atletismo (FOR)"
    case atuacao = "Atuação (CAR)"
    case enganacao = "Enganação (CAR)"
    case furtividade = "Furtividade (DES)"
    case historia = "História (INT)"
    case intimidacao = "Intimidação (CAR)"
    case intuicao = "Intuição (SAB)"
    case investigacao = "Investigação (INT)"
    case medicina = "Medicina (SAB)"
    case natureza = "Natureza (INT)"
    case percepcao = "Percepção (SAB)"
    case persuasao = "Persuasão (CAR)"
    case prestidigitacao = "Prestidigitação (DES)"
    case religiao = "Religião (INT)"
    case sobrevivencia = "Sobrevivência (SAB)"
    
    case none = "Nenhum"
}

//MARK: Classe
public class ClasseEscolha {
    var classePersonagem: ClassePersonagem = .none // enum de classes
    var nomeClasse: String = ""
    var caracteristicasClasse: [CaracteristicaJSON] = [] // COLOCAR CARACTERISTICAS AQUI
    var subClasses: [SubClasseEscolha] = []
    var dadoVida: String = ""
    var profSalvaguardas: [AtributosSalvaguarda] = []
    var profArmas: [ArmaJSON] = []
    var profArmaduras: [ArmaduraJSON] = []
    var profFerramentas: [FerramentaJSON] = []
    var escolhasProficienciaFerramenta: [EscolhaOpcao] = []
    
    var opcoesEquipamento: [OpcaoEquipamento] = []
    var armasIniciais: [ArmaJSON] = []
    var armadurasIniciais: [ArmaduraJSON] = []
    var equipamentosIniciais: [EquipamentoJSON] = []
    var ferramentasIniciais: [FerramentaJSON] = []
    var pacotesIniciais: [PacoteEquipamento] = []
    
    var profPericias: [Pericia] = []
    var quantiaProfPericias: Int = 0
    var possuiMagias: Bool = false
    var magiaApenasSubclasse: Bool = false
    var subclasseComMagia: SubclassePersonagem = .none
    var magiasConhecidas: [MagiasConhecidas] = []
    var espacosDeMagia: [EspacosDeMagias] = []
    var pontosEspecificosNumerico: [PontoEspecificoNumerico] = []
    var pontosEspecificosTexto: [PontoEspecificoTexto] = []
}

//MARK: SubClasse
struct SubClasseEscolha : Codable{
    var subclasse: SubclassePersonagem = .none
    var subclasseNome: String = ""
    var caracteristicasSubClasse: [CaracteristicaJSON] = [] // COLOCAR CARACTERISTICAS AQUI
    
    init (subclase: SubclassePersonagem, caracteristicas: [CaracteristicaJSON]) {
        self.subclasse = subclase
        self.subclasseNome = subclase.rawValue
        self.caracteristicasSubClasse = caracteristicas
    }
}
