//
//  DetalhesCaracteristicaClasse.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 07/10/22.
//

import SwiftUI

struct DetalhesCaracteristicaClasse: View {
    
    @Binding private var escolha: ClasseEscolha
    
    public init(escolha: Binding<ClasseEscolha>) {
        self._escolha = escolha
    }
    
    var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("IdentidadeIconOff"), title: "Descrição de Característica", subtitle: escolha.classePersonagem.rawValue)) {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(escolha.caracteristicasClasse, id: \.id) { caracteristica in
                        
                        TemplateDetalheCaracteristica(title: caracteristica.nome, subtitle: "\(getNiveis(niveis: caracteristica.nivel))", description: caracteristica.descricao)
                        
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
    
    private func getNiveis(niveis: [Int]) -> String {
        if niveis.count > 1 {
            var temp = "Níveis: "
            for i in 0..<niveis.count {
                temp += (i == niveis.count - 1) ? " \(niveis[i])" : " \(niveis[i]),"
            }
            return temp
        }
        return "Nível: \(niveis[0])"
    }
}
