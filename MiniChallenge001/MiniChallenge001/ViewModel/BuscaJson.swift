//
//  BuscaJson.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 25/09/22.
//

import Foundation

//MARK: ARMA
public class BuscaArma : Codable {
    public static func buscaArmaTipo(tipo: TipoArma, nomeExcluso: String) -> [String] {
        guard let armas = JsonFileUtil.getDataFromFiles(folder: "arma", decoder: ArmaJSON.self) as? [ArmaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        var armasNome: [String] = []
        
        for arma in armas {
            if arma.tipo == tipo && arma.nome != nomeExcluso {
                armasNome.append(arma.nome)
            }
        }
        
        return armasNome
    }
    
    public static func buscaArmaEstilo(estilo: EstiloArma, nomeExcluso: String) -> [String] {
        guard let armas = JsonFileUtil.getDataFromFiles(folder: "arma", decoder: ArmaJSON.self) as? [ArmaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        var armasNome: [String] = []
        
        for arma in armas {
            if arma.estilo == estilo && arma.nome != nomeExcluso {
                armasNome.append(arma.nome)
            }
        }
        
        return armasNome
    }
    
    public static func buscaArmaTipoEstilo(tipo: TipoArma, estilo: EstiloArma, nomeExcluso: String) -> [String] {
        guard let armas = JsonFileUtil.getDataFromFiles(folder: "arma", decoder: ArmaJSON.self) as? [ArmaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        var armasNome: [String] = []
        
        for arma in armas {
            if arma.tipo == tipo && arma.estilo == estilo && arma.nome != nomeExcluso {
                armasNome.append(arma.nome)
            }
        }
        
        return armasNome
    }
}

//MARK: JSON
public class BuscaJson : Codable {
    //MARK: ARMA JSON
    public static func buscaArmaTodos() -> [ArmaJSON] {
        guard let armas = JsonFileUtil.getDataFromFiles(folder: "arma", decoder: ArmaJSON.self) as? [ArmaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        return armas
    }
    
    public static func buscaArmaTipo(tipo: TipoArma) -> [ArmaJSON] {
        guard let armas = JsonFileUtil.getDataFromFiles(folder: "arma", decoder: ArmaJSON.self) as? [ArmaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        var armasRetorno: [ArmaJSON] = []
        
        for arma in armas {
            if arma.tipo == tipo {
                armasRetorno.append(arma)
            }
        }
        
        return armasRetorno
    }
    
    public static func buscaArmaPorNome(nome: String) -> ArmaJSON {
        guard let armas = JsonFileUtil.getDataFromFiles(folder: "arma", decoder: ArmaJSON.self) as? [ArmaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        for arma in armas {
            if arma.nome == nome {
                return arma
            }
        }
        
        return armas[0]
    }
    
    public static func buscaArmaPorNomes(nomes: [String]) -> [ArmaJSON] {
        guard let armas = JsonFileUtil.getDataFromFiles(folder: "arma", decoder: ArmaJSON.self) as? [ArmaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        var armasRetorno: [ArmaJSON] = []
        
        for arma in armas {
            if nomes.contains(arma.nome) {
                armasRetorno.append(arma)
            }
        }
        
        return armasRetorno
    }
    
    public static func buscaArmaPorNomeQuantidade(nome: String, quantidade: Int) -> [ArmaJSON] {
        guard let armas = JsonFileUtil.getDataFromFiles(folder: "arma", decoder: ArmaJSON.self) as? [ArmaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        var armasRetorno: [ArmaJSON] = []
        
        for arma in armas {
            if arma.nome == nome {
                for _ in 1 ... quantidade {
                    armasRetorno.append(arma)
                }
                return armasRetorno
            }
        }
        
        return armasRetorno
    }
    
    //MARK: ARMADURA JSON
    public static func buscaArmadurasTodos() -> [ArmaduraJSON] {
        guard let armaduras = JsonFileUtil.getDataFromFiles(folder: "armaduras", decoder: ArmaduraJSON.self) as? [ArmaduraJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        return armaduras
    }
    
    public static func buscaArmadurasSemEscudo() -> [ArmaduraJSON] {
        guard let armaduras = JsonFileUtil.getDataFromFiles(folder: "armaduras", decoder: ArmaduraJSON.self) as? [ArmaduraJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        var armadurasRetorno: [ArmaduraJSON] = []
        
        for armadura in armaduras {
            if armadura.nome != "Escudo" {
                armadurasRetorno.append(armadura)
            }
        }
        
        return armadurasRetorno
    }
    
    public static func buscaArmadurasPorTipo(tipo: TipoArmadura) -> [ArmaduraJSON] {
        guard let armaduras = JsonFileUtil.getDataFromFiles(folder: "armaduras", decoder: ArmaduraJSON.self) as? [ArmaduraJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        var armadurasRetorno: [ArmaduraJSON] = []
        
        for armadura in armaduras {
            if armadura.tipo == tipo {
                armadurasRetorno.append(armadura)
            }
        }
        
        return armadurasRetorno
    }
    
    public static func buscaArmadurasPorTipos(tipos: [TipoArmadura]) -> [ArmaduraJSON] {
        guard let armaduras = JsonFileUtil.getDataFromFiles(folder: "armaduras", decoder: ArmaduraJSON.self) as? [ArmaduraJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        var armadurasRetorno: [ArmaduraJSON] = []
        
        for armadura in armaduras {
            if tipos.contains(armadura.tipo) {
                armadurasRetorno.append(armadura)
            }
        }
        
        return armadurasRetorno
    }
    
    public static func buscaArmaduraPorNome(nome: String) -> ArmaduraJSON {
        guard let armaduras = JsonFileUtil.getDataFromFiles(folder: "armaduras", decoder: ArmaduraJSON.self) as? [ArmaduraJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        for armadura in armaduras {
            if armadura.nome == nome {
                return armadura
            }
        }
        
        return armaduras[0]
    }
    
    public static func buscaArmaduraPorNomes(nomes: [String]) -> [ArmaduraJSON] {
        guard let armaduras = JsonFileUtil.getDataFromFiles(folder: "armaduras", decoder: ArmaduraJSON.self) as? [ArmaduraJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        var armadurasRetorno: [ArmaduraJSON] = []
        
        for armadura in armaduras {
            if nomes.contains(armadura.nome) {
                armadurasRetorno.append(armadura)
            }
        }
        
        return armadurasRetorno
    }
    
    
    //MARK: EQUIPAMENTO JSON
    public static func buscaEquipamentoPorNome(nome: String) -> EquipamentoJSON {
        guard let equipamentos = JsonFileUtil.getDataFromFiles(folder: "equipamento", decoder: EquipamentoJSON.self) as? [EquipamentoJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        for equipamento in equipamentos {
            if equipamento.nome == nome {
                return equipamento
            }
        }
        
        return equipamentos[0]
    }
    
    public static func buscaEquipamentoPorNomeQuantidade(nome: String, quantidade: Int) -> [EquipamentoJSON] {
        guard let equipamentos = JsonFileUtil.getDataFromFiles(folder: "equipamento", decoder: EquipamentoJSON.self) as? [EquipamentoJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        var equipamentosRetorno: [EquipamentoJSON] = []
        
        for equipamento in equipamentos {
            if equipamento.nome == nome {
                for _ in 1 ... quantidade {
                    equipamentosRetorno.append(equipamento)
                }
                return equipamentosRetorno
            }
        }
        
        return equipamentosRetorno
    }
    
    //MARK: FERRAMENTA JSON
    public static func buscaFerramentaPorNome(nome: String) -> FerramentaJSON {
        guard let ferramentas = JsonFileUtil.getDataFromFiles(folder: "ferramenta", decoder: FerramentaJSON.self) as? [FerramentaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        for ferramenta in ferramentas {
            if ferramenta.nome == nome {
                return ferramenta
            }
        }
        
        return ferramentas[0]
    }
    
    public static func buscaFerramentaPorTipo(tipo: TipoFerramenta) -> [FerramentaJSON] {
        guard let ferramentas = JsonFileUtil.getDataFromFiles(folder: "ferramenta", decoder: FerramentaJSON.self) as? [FerramentaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        var ferramentasRetorno: [FerramentaJSON] = []
        
        for ferramenta in ferramentas {
            if ferramenta.tipo == tipo {
                ferramentasRetorno.append(ferramenta)
            }
        }
        
        return ferramentasRetorno
    }
    
    //MARK: MAGIA JSON
    public static func buscaMagiaPorNome(nome: String) -> MagiaJSON {
        guard let magias = JsonFileUtil.getDataFromFiles(folder: "magia", decoder: MagiaJSON.self) as? [MagiaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        for magia in magias {
            if magia.nome == nome {
                return magia
            }
        }
        
        return magias[0]
    }
    
    //MARK: CARACTERISTICAS JSON
    public static func buscaCaracteristicasPorClasse(classe: ClassePersonagem) -> [CaracteristicaJSON] {
        guard let caracteristicas = JsonFileUtil.getDataFromFiles(folder: "caracteristica", decoder: CaracteristicaJSON.self) as? [CaracteristicaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        var caracteristicasRetorno: [CaracteristicaJSON] = []
        
        for caracteristica in caracteristicas {
            if caracteristica.classe == classe {
                caracteristicasRetorno.append(caracteristica)
            }
        }
        
        return caracteristicasRetorno
    }
    
    public static func buscaCaracteristicasPorSubclasse(subclasse: SubclassePersonagem) -> [CaracteristicaJSON] {
        guard let caracteristicas = JsonFileUtil.getDataFromFiles(folder: "caracteristica", decoder: CaracteristicaJSON.self) as? [CaracteristicaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        var caracteristicasRetorno: [CaracteristicaJSON] = []
        
        for caracteristica in caracteristicas {
            if caracteristica.subclasse == subclasse {
                caracteristicasRetorno.append(caracteristica)
            }
        }
        
        return caracteristicasRetorno
    }
    
    //MARK: TRACOS JSON
    public static func buscaTracosPorRaca(raca: TipoRaca) -> [TraitJSON] {
        guard let tracos = JsonFileUtil.getDataFromFiles(folder: "trait", decoder: TraitJSON.self) as? [TraitJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        var tracosRetorno: [TraitJSON] = []
        
        for traco in tracos {
            if traco.raca == raca {
                tracosRetorno.append(traco)
            }
        }
        
        return tracosRetorno
    }
    
    public static func buscaTracosPorSubraca(subraca: TipoSubRaca) -> [TraitJSON] {
        guard let tracos = JsonFileUtil.getDataFromFiles(folder: "trait", decoder: TraitJSON.self) as? [TraitJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        var tracosRetorno: [TraitJSON] = []
        
        for traco in tracos {
            if traco.subraca == subraca {
                tracosRetorno.append(traco)
            }
        }
        
        return tracosRetorno
    }
}

//MARK: FERRAMENTA
public class BuscaFerramenta : Codable {
    public static func buscaFerramentaTipo(tipo: TipoFerramenta, nomeExcluso: String) -> [String] {
        guard let ferramentas = JsonFileUtil.getDataFromFiles(folder: "ferramenta", decoder: FerramentaJSON.self) as? [FerramentaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        var ferramentasNome: [String] = []
        
        for ferramenta in ferramentas {
            if ferramenta.tipo == tipo && ferramenta.nome != nomeExcluso {
                ferramentasNome.append(ferramenta.nome)
            }
        }
        
        return ferramentasNome
    }
}

//MARK: EQUIPAMENTO
public class BuscaEquipamento : Codable {
    public static func buscaEquipamentoCategoria(categoria: CategoriaEquipamento, nomeExcluso: String) -> [String] {
        guard let equipamentos = JsonFileUtil.getDataFromFiles(folder: "equipamento", decoder: EquipamentoJSON.self) as? [EquipamentoJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        var equipamentosNome: [String] = []
        
        for equipamento in equipamentos {
            if equipamento.categoria == categoria && equipamento.nome != nomeExcluso {
                equipamentosNome.append(equipamento.nome)
            }
        }
        
        return equipamentosNome
    }
}

//MARK: MAGIA
public class BuscaMagia : Codable {
    public static func buscaMagiaClasseNivel(classe: ClassePersonagem, nivel: Int) -> [String] {
        guard let magias = JsonFileUtil.getDataFromFiles(folder: "magia", decoder: MagiaJSON.self) as? [MagiaJSON] else {
            fatalError("Erro ao tentar converter magias")
        }
        
        var magiasNome: [String] = []
        
        for magia in magias {
            if magia.classes.contains(classe) && magia.nivel == nivel{
                magiasNome.append(magia.nome)
            }
        }
        
        return magiasNome
    }
}
