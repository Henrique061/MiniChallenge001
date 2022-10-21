//
//  RacaViewModel.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 21/10/22.
//

import Foundation

class CriacaoRacaViewModel: ObservableObject {
    @Published public var raca: RacaEscolha
    @Published public var escolhasDefinidas: RacaEscolhasDefinidas
    @Published public var escolhasAtributos: [AtributosSalvaguarda]
    @Published public var escolhaProfFerramenta: String
    @Published public var escolhaMagia: String
    
    public var buttonIsDisabled: Bool {
        self.raca.tipoRaca == .none ||
        
        self.raca.possuiSubRaca && self.escolhasDefinidas.escolhaSubRaca.subraca == .none ||
        
        self.raca.possuiEscolhaProfPericias && self.escolhasDefinidas.escolhaProfPericias.count < self.raca.quantiaEscolhaPericia ||
        
        self.raca.possuiEscolhaIdioma && self.escolhasDefinidas.escolhaIdioma.idioma == .none ||
         
         self.raca.subracaPossuiEscolhaIdioma && self.escolhasDefinidas.escolhaIdioma.idioma == .none  && self.escolhasDefinidas.escolhaSubRaca.subraca != .elfoFloresta && self.escolhasDefinidas.escolhaSubRaca.subraca != .elfoNegro ||
        
        self.raca.possuiEscolhaProfFerramentas && self.escolhaProfFerramenta.isEmpty ||
        
        self.raca.possuiEscolhaAtributo && self.escolhasAtributos.count < raca.numEscolhaDeAtributos ||
        
        self.raca.possuiSubRaca && self.raca.subracaEscolhaMagias.subraca == self.escolhasDefinidas.escolhaSubRaca.subraca && escolhaMagia.isEmpty
    }
    
    public var proficienciaFerramentas: [FerramentaJSON] {
        var proficiencias: [FerramentaJSON] = raca.profFerramentas
        if raca.possuiSubRaca {
            proficiencias += raca.subracaProfFerramenta.filter({$0.subraca == self.escolhasDefinidas.escolhaSubRaca.subraca}).first?.ferramentasProficientes ?? []
        }
        return proficiencias
    }
    
    public var proficienciaArmas: [ArmaJSON] {
        var armas: [ArmaJSON] = raca.profArmas
        if raca.possuiSubRaca {
            armas += raca.subracaProfArma.filter({$0.subraca == self.escolhasDefinidas.escolhaSubRaca.subraca}).first?.armasProficientes ?? []
        }
        return armas
    }
    
    public var proficienciaArmaduras: [ArmaduraJSON] {
        var armaduras: [ArmaduraJSON] = raca.profArmaduras
        if raca.possuiSubRaca {
            armaduras += raca.subracaProfArmaduras.filter({$0.subraca == self.escolhasDefinidas.escolhaSubRaca.subraca}).first?.armadurasProficientes ?? []
        }
        return armaduras
    }
    
    public var atributos: String {
        var descricao = ""
        for i in self.raca.atributosGanhos {
            descricao += "+ \(i.pontosGanhos) \(i.atributo.rawValue) "
        }
        if self.escolhasDefinidas.escolhaSubRaca.subraca != .none {
            descricao += "+ \(self.escolhasDefinidas.escolhaSubRaca.atributoGanho.pontosGanhos) \(self.escolhasDefinidas.escolhaSubRaca.atributoGanho.atributo.rawValue)"
        }
        return descricao
    }
    
    public var deslocamento: String {
        if raca.deslocamentoSubraca.isEmpty {
            return "\(numberFormatter.string(from: NSNumber(value: raca.deslocamento)) ?? "ERROR") metros"
        }
        let conjunto = raca.deslocamentoSubraca.filter({$0.subraca == self.escolhasDefinidas.escolhaSubRaca.subraca})
        return "\(numberFormatter.string(from: NSNumber(value: conjunto[0].deslocamento)) ?? "ERROR") metros"
    }
    
    public var idiomas: String {
        var idiomas = ""
        for i in 0..<raca.idiomas.count {
            if i < raca.idiomas.count - 1 {
                idiomas += "\(raca.idiomas[i].idioma.rawValue), "
            } else {
                idiomas += "\(raca.idiomas[i].idioma.rawValue)"
            }
        }
        return idiomas
    }
    
    public var tracos: [TraitJSON] {
        let tracos = raca.tracos + self.escolhasDefinidas.escolhaSubRaca.tracosSubraca
        return tracos.sorted(by: {$0.nome < $1.nome})
    }
    
    public var magias: [MagiaJSON] {
        var magias: [MagiaJSON] = raca.magiasRecebidas
        if raca.magiasPorSubraca.subraca == escolhasDefinidas.escolhaSubRaca.subraca {
            magias += raca.magiasPorSubraca.magias
        }
        return magias.sorted(by: {$0.nome < $1.nome})
    }

    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = 1
        formatter.alwaysShowsDecimalSeparator = false
        return formatter
    }
    
    public init(racaFinal: RacaFinal) {
        self.raca = RacaClient.orderRaca(racaFinal.tipoRaca)
        self.escolhasDefinidas = RacaEscolhasDefinidas()
        self.escolhasAtributos = []
        self.escolhaMagia = ""
        self.escolhaProfFerramenta = ""
        
        if self.raca.possuiSubRaca {
            self.escolhasDefinidas.escolhaSubRaca = self.raca.subRacas.filter({$0.subraca == racaFinal.subRaca})[0]
        }
    }
    
    public func setRaca(tipoRaca: TipoRaca) {
        DispatchQueue.main.async {
            self.raca = RacaClient.orderRaca(tipoRaca)
            self.escolhasDefinidas = RacaEscolhasDefinidas()
            self.escolhasAtributos = []
            self.escolhaProfFerramenta = ""
            self.escolhaMagia = ""
            
            if self.raca.possuiSubRaca {
                self.escolhasDefinidas.escolhaSubRaca = self.raca.subRacas[0]
            }
        }
    }
    
    public func setSubraca(subraca: Subraca) {
        DispatchQueue.main.async {
            self.escolhasDefinidas = RacaEscolhasDefinidas()
            self.escolhasDefinidas.escolhaSubRaca = subraca
            self.escolhasAtributos = []
            self.escolhaProfFerramenta = ""
            self.escolhaMagia = ""
        }
    }
    
    public func prepareEscolhasDefinidas() {
        DispatchQueue.main.async {
            var atributosAux: [AtributosGanhosRaca] = []
            for i in self.escolhasAtributos {
                atributosAux.append(AtributosGanhosRaca(atributo: i, pontosGanhos: self.raca.valorGanhoEscolhaAtributos))
            }
            self.escolhasDefinidas.escolhaAtributos = atributosAux
            if !self.escolhaProfFerramenta.isEmpty {
                self.escolhasDefinidas.escolhaProfFerramentasAdicionais.append(BuscaJson.buscaFerramentaPorNome(nome: self.escolhaProfFerramenta))
            }
            if !self.escolhaMagia.isEmpty {
                self.escolhasDefinidas.escolhaMagia.append(BuscaJson.buscaMagiaPorNome(nome: self.escolhaMagia))
            }
        }
    }
}
