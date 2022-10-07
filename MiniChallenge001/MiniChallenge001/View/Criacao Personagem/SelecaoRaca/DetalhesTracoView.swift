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
                    CelulaDetalheTraco(nomePassiva: traco.nome, descricaoPassiva: traco.descricao)
                }
                .padding(10)
            }
        }
    }
}

struct CelulaDetalheTraco: View {
    
    private var nomePassiva: String
    private var descricaoPassiva: String
    @State private var showContent: Bool = false
    
    public init(nomePassiva: String, descricaoPassiva: String) {
        self.nomePassiva = nomePassiva
        self.descricaoPassiva = descricaoPassiva
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $showContent) {
            DisplayTextoBotao(titulo: "Descrição:", descricao: descricaoPassiva)
                .padding(10)
        } header: {
            DisplayTextoBotao(titulo: nomePassiva, descricao: "Passiva")
        }
    }
}
