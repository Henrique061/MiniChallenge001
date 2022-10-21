//
//  AntecedenteViewModel.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 21/10/22.
//

import Foundation

class ViewModelEscolhaAntecedente: ObservableObject {
    
    @Published public var escolha: AntecedenteEscolha
    @Published public var definidas: AntecedenteEscolhasDefinidas
    @Published public var escolhaIdiomas: [Idioma]
    @Published public var escolhaEquipamento: String
    @Published public var escolhaProfFerramenta: String
    @Published public var escolhaFerramenta: String
    
    public var buttonIsDisabled: Bool {
        self.escolha.tipoAntecedente == .none ||
        self.escolha.possuiEscolhaIdioma && self.escolhaIdiomas.isEmpty ||
        self.escolha.possuiEscolhaEquipamentoInicial && self.escolhaEquipamento.isEmpty ||
        self.escolha.possuiEscolhaProfFerramentas && self.escolhaProfFerramenta.isEmpty ||
        self.escolha.possuiEscolhaFerramentaInicial && self.escolhaFerramenta.isEmpty
    }
    
    public init(antecedente: AntecedentePersonagem) {
        self.escolha = AntecedenteClient.orderAntecedente(antecedente)
        self.definidas = AntecedenteEscolhasDefinidas()
        self.escolhaIdiomas = []
        self.escolhaEquipamento = ""
        self.escolhaProfFerramenta = ""
        self.escolhaFerramenta = ""
    }
    
    public func setAntecedente(_ antecedente: AntecedentePersonagem) {
        DispatchQueue.main.async {
            self.escolha = AntecedenteClient.orderAntecedente(antecedente)
            self.definidas = AntecedenteEscolhasDefinidas()
            self.escolhaIdiomas = []
            self.escolhaEquipamento = ""
            self.escolhaProfFerramenta = ""
            self.escolhaFerramenta = ""
        }
    }
    
    public func setEscolhaProfFerramenta() {
        DispatchQueue.main.async {
            self.definidas.escolhaProfFerramenta.append(BuscaJson.buscaFerramentaPorNome(nome: self.escolhaProfFerramenta))
        }
    }
    
    public func setEscolhaEquipamento() {
        DispatchQueue.main.async {
            self.definidas.escolhaEquipamentosIniciais.append(BuscaJson.buscaEquipamentoPorNome(nome: self.escolhaEquipamento))
        }
    }
    
    public func setEscolhaFerramenta() {
        DispatchQueue.main.async {
            self.definidas.escolhaFerramentasIniciais.append(BuscaJson.buscaFerramentaPorNome(nome: self.escolhaFerramenta))
        }
    }
    
    public func setIdiomas() {
        DispatchQueue.main.async {
            self.escolhaIdiomas.forEach({self.definidas.escolhaIdiomas.append(IdiomaAlfabeto(idioma: $0, alfabeto: .none, isPadrao: false))})
        }
    }
    
    public func buildAntecedenteFinal() -> AntecedenteFinal {
        setEscolhaProfFerramenta()
        setEscolhaEquipamento()
        setEscolhaFerramenta()
        setIdiomas()
        
        return AntecedenteClient.orderAntecedenteFinal(self.escolha, self.definidas)
    }
}
