//
//  NovaFichaViewModel.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 21/10/22.
//

import Foundation

public class NovaFichaViewModel: ObservableObject {
    @Published var perfil: PerfilPersonagem
    @Published var racaFinal: RacaFinal
    @Published var classeFinal: ClasseFinal
    @Published var antecedenteFinal: AntecedenteFinal
    
    public init() {
        self.perfil = PerfilPersonagem()
        self.racaFinal = RacaFinal()
        self.classeFinal = ClasseFinal()
        self.antecedenteFinal = AntecedenteFinal()
    }
    
    public func setRaca(raca: RacaFinal) {
        DispatchQueue.main.async {
            self.racaFinal = raca
        }
    }
    
    public func setClasse(classe: ClasseFinal) {
        DispatchQueue.main.async {
            self.classeFinal = classe
        }
    }
    
    public func setAntecedente(antecedente: AntecedenteFinal) {
        DispatchQueue.main.async {
            self.antecedenteFinal = antecedente
        }
    }
    
    public func setTendencia(tendencia: TipoTendencia) {
        DispatchQueue.main.async {
            self.perfil.tendencia = tendencia
        }
    }
    
    public func createFicha(atributos: [Atributo], completion: @escaping (_ saved: Bool) -> Void) {
        DispatchQueue.main.async {
            do {
                var novaFicha = PersonagemClient.orderPersonagem(raca: self.racaFinal, classe: self.classeFinal, antecedente: self.antecedenteFinal, valoresAtributos: ValoresAtributos(atributos), perfilPersonagem: self.perfil)
                novaFicha.id = try JsonFileUtil.getNewIdForSheet()
                try JsonFileUtil.write(content: novaFicha)
                completion(true)
            } catch {
                completion(false)
            }
        }
    }
}
