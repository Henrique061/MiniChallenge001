//
//  AtributoViewModel.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 21/10/22.
//

import Foundation

public class AtributoViewModel: ObservableObject {
    
    @Published public var atributos: Array<Atributo>
    
    public init() {
        self.atributos = [Atributo(nome: .forca, valor: 0),
                          Atributo(nome: .destreza, valor: 0),
                          Atributo(nome: .constituicao, valor: 0),
                          Atributo(nome: .inteligencia, valor: 0),
                          Atributo(nome: .sabedoria, valor: 0),
                          Atributo(nome: .carisma, valor: 0)]
    }
    
    public init(ficha: PersonagemFicha) {
        self.atributos = [Atributo(nome: .forca, valor: ficha.pontosAtributos.forca.valor),
                          Atributo(nome: .destreza, valor: ficha.pontosAtributos.destreza.valor),
                          Atributo(nome: .constituicao, valor: ficha.pontosAtributos.constituicao.valor),
                          Atributo(nome: .inteligencia, valor: ficha.pontosAtributos.inteligencia.valor),
                          Atributo(nome: .sabedoria, valor: ficha.pontosAtributos.sabedoria.valor),
                          Atributo(nome: .carisma, valor: ficha.pontosAtributos.carisma.valor)]
    }
    
    public init(vmficha: NovaFichaViewModel) {
        self.atributos = [Atributo(nome: .forca, valor: 0),
                          Atributo(nome: .destreza, valor: 0),
                          Atributo(nome: .constituicao, valor: 0),
                          Atributo(nome: .inteligencia, valor: 0),
                          Atributo(nome: .sabedoria, valor: 0),
                          Atributo(nome: .carisma, valor: 0)]
        
        for i in 0..<self.atributos.count {
            atributos[i].valor = vmficha.racaFinal.atributosAdicionais.filter({$0.atributo == atributos[i].nome}).first?.pontosGanhos ?? 0
        }
    }
    
    public func updateAtributoValor(value: Int, name: AtributosSalvaguarda) {
        DispatchQueue.main.async {
            for i in 0..<self.atributos.count {
                if self.atributos[i].nome == name {
                    
                    if (self.atributos[i].valor + value) > 20 || (self.atributos[i].valor + value) < 0{
                        return
                    }
                    
                    self.atributos[i].valor += value
                    return
                }
            }
        }
    }
}
