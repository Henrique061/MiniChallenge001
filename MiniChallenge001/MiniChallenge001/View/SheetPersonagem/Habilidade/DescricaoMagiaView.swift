//
//  DescricaoMagiaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 22/09/22.
//

import SwiftUI


public struct DetalhesMagia: View {
    
    @Environment(\.dismiss) private var dismiss
    private var completion: () -> Void
    private let title: String
    private let magia: MagiaJSON
    
    public init(magia: MagiaJSON, title: String, completion: @escaping () -> Void) {
        self.magia = magia
        self.completion = completion
        self.title = title
    }
    
    public var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("Habilidades Detalhado"), title: "Descrição da Habilidade", subtitle: (magia.nivel > 0) ? "\(magia.nivel)º Círculo" : "Truque")) {
            ScrollView {
                TemplateContentBackground {
                    VStack(alignment: .leading, spacing: 10) {
                        DisplayTextoBotao(titulo: magia.nome, descricao: magia.escola.rawValue)
                        Divider()
                        CorpoDetalheView(magia: magia)
                    }
                    .padding(10)
                }
                .padding(.horizontal, 10)
            }
            Button(title) {
                completion()
                dismiss()
            }
            .buttonStyle(CustomButtonStyle5())
            .padding(.bottom, 10)
            .padding(.horizontal, 10)
        }
    }
}

struct CorpoDetalheView: View {
    private let magia: MagiaJSON
    
    init(magia: MagiaJSON) {
        self.magia = magia
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            DisplayTextoBotao(titulo: "Tempo Conjuração", descricao: magia.tempoConjuracao)
            DisplayTextoBotao(titulo: "Alcance:", descricao: magia.alcance)
            DisplayTextoBotao(titulo: "Componentes", descricao: magia.componentes)
            DisplayTextoBotao(titulo: "Descrição", descricao: magia.descricao)
        }
    }
}
