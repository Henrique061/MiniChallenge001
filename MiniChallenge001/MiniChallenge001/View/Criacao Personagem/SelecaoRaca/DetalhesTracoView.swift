//
//  DetalhesTracoView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 27/09/22.
//

import SwiftUI

struct DetalhesTracoView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var vmraca: CriacaoRacaViewModel
    
    public init(vmraca: CriacaoRacaViewModel) {
        self.vmraca = vmraca
    }
    
    var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("IdentidadeIconOff"), title: "Descrição de Traços Raciais", subtitle: vmraca.raca.possuiSubRaca ? vmraca.escolhasDefinidas.escolhaSubRaca.subracaNome : vmraca.raca.nomeRaca)) {
            ScrollView {
                ForEach(vmraca.tracos, id: \.id) { traco in
                    TemplateDetalheCaracteristica(title: traco.nome, subtitle: "Passiva", description: traco.descricao)
                }
                .padding(.horizontal, 10)
            }
        }
    }
}
