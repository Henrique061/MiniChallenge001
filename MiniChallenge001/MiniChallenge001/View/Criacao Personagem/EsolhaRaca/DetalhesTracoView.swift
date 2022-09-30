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
        ZStack {
            Color("ScreenBackground")
                .ignoresSafeArea()
            VStack {
                HStack(alignment: .center) {
                    Image("IdentidadeIconOff")
                    DisplayTextoBotao(titulo: "Descrição de Traços Raciais", descricao: vmraca.subraca.subraca == .none ? vmraca.raca.tipoRaca.rawValue : vmraca.subraca.subraca.rawValue)
                    Button {
                        dismiss()
                    } label: {
                        CustomBotaoFechar()
                            .frame(width: 30, height: 30)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.top, 10)
                Divider()
                
                ScrollView {
                    ForEach(vmraca.getTracos(), id: \.id) { traco in
                        CelulaDetalheTraco(nomePassiva: traco.nome, descricaoPassiva: traco.descricao)
                    }.padding(.horizontal, 10)
                }
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
        TemplateContentBackground {
            DisclosureGroup(isExpanded: $showContent) {
                VStack(alignment: .leading, spacing: 4) {
                    Divider().padding(.horizontal, -10)
                    DisplayTextoBotao(titulo: "Descrição:", descricao: descricaoPassiva)
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            } label: {
                DisplayTextoBotao(titulo: nomePassiva, descricao: "Passiva")
            }
            .accentColor(Color("RedTheme"))
            .buttonStyle(CustomButtonStyle2())
            
        }
    }
}
