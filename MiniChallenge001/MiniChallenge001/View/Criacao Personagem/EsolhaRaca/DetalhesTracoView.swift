//
//  DetalhesTracoView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 27/09/22.
//

import SwiftUI

struct DetalhesTracoView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var racaEscolha: RacaEscolha?
    @Binding var subRacaEscolha: Subraca?
    
    private var racaFinal: String {
        if let temSub = racaEscolha?.possuiSubRaca {
            if temSub {
                return subRacaEscolha?.subracaNome ?? "<<ERROR>>"
            } else {
                return racaEscolha?.nomeRaca ?? "<<ERROR>>"
            }
        }
        return "NULL"
    }
    
    private var passivasRaca: [TraitJSON] {
        var aux: [TraitJSON] = []
        
        if let tracosRaca = racaEscolha?.tracos {
            aux += tracosRaca
        }
        if let tracosSubraca = subRacaEscolha?.tracosSubraca {
            aux += tracosSubraca
        }
        return aux
    }
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
            VStack {
                HStack(alignment: .center) {
                    Image("IdentidadeIconOff")
                    DisplayTextoBotao(titulo: "Descrição de Traços Raciais", descricao: racaFinal)
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        CustomBotaoFechar()
                            .frame(width: 30, height: 30)
                    }
                }.padding(.horizontal, 12)
                Divider()
                
                ScrollView {
                    ForEach(passivasRaca, id: \.id) { traco in
                        HStack {
                            CelulaDetalheTraco(nomePassiva: traco.nome, descricaoPassiva: traco.descricao)
                        }
                        .padding(.vertical, 2)
                        .padding(.horizontal, 10)
                    }
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
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("ContentBackground"))
            VStack(alignment: .leading, spacing: 4)  {
                DisclosureGroup(isExpanded: $showContent) {
                    VStack(alignment: .leading) {
                        Divider()
                        DisplayTextoBotao(titulo: "Descrição:", descricao: descricaoPassiva)
                    }
                } label: {
                    DisplayTextoBotao(titulo: nomePassiva, descricao: "Passiva")
                }
            }
            .accentColor(Color("BlackAndWhite"))
            .padding(.horizontal, 10)
        }
    }
}
