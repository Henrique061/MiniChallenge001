//
//  DetalhesTracoView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 27/09/22.
//

import SwiftUI

struct DetalhesTracoView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var vmraca: CriacaoRacaViewModel
    
    var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("IdentidadeIconOff"), title: "Descrição de Traços Raciais", subtitle: vmraca.subraca.subraca == .none ? vmraca.raca.tipoRaca.rawValue : vmraca.subraca.subraca.rawValue)) {
            ScrollView {
                ForEach(vmraca.getTracos(), id: \.id) { traco in
                    TemplateDetalheCaracteristica(title: traco.nome, subtitle: "Passiva", description: traco.descricao)
                }
                .padding(.horizontal, 10)
            }
        }
    }
}
