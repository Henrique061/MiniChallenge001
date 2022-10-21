//
//  ClasseViewModel.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 21/10/22.
//

import Foundation

class CriacaoClasseViewModel: ObservableObject {
    @Published var escolha: ClasseEscolha
    @Published var definidas: ClasseEscolhasDefinidas
    
    public init() {
        self.escolha = ClasseClient.orderClasse(classePersonagem: .none)
        self.definidas = ClasseEscolhasDefinidas()
    }
    
    public init(classe: ClassePersonagem) {
        self.escolha = ClasseClient.orderClasse(classePersonagem: classe)
        self.definidas = ClasseEscolhasDefinidas()
    }
    
    public func setClasse(classe: ClassePersonagem) {
        DispatchQueue.main.async {
            self.escolha = ClasseClient.orderClasse(classePersonagem: classe)
            self.definidas = ClasseEscolhasDefinidas()
        }
    }
    
    public func getCaracteristicas() -> [String] {
        var nomes: [String] = []
        for i in self.escolha.caracteristicasClasse {
            nomes.append(i.nome)
        }
        return nomes
    }
    
    public func setProficienciaPericias(pericias: [Pericia]) {
        DispatchQueue.main.async {
            self.definidas.escolhaProfPericias = pericias
        }
    }
    
    public func setProficientaFerramentas(ferramentas: [FerramentaJSON]) {
        DispatchQueue.main.async {
            self.definidas.escolhaProfFerramentas = ferramentas
        }
    }
    
    public func setRiqueza(moeda: Moeda) {
        DispatchQueue.main.async {
            self.definidas.escolhaRiqueza = moeda
        }
    }
    
    public func setEscolhaEquipamentos(escolhas: [EscolhaUnica]) {
        DispatchQueue.main.async {
            self.definidas.escolhasOpcoesEquip = escolhas
        }
    }
}
