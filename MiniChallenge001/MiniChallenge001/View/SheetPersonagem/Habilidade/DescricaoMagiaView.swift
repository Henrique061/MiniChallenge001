//
//  DescricaoMagiaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 22/09/22.
//

import SwiftUI


public struct DetalhesMagia: View {
    
    @Environment(\.dismiss) private var dismiss
    private let magia: MagiaJSON
    
    init(magia: MagiaJSON) {
        self.magia = magia
    }
    
    public var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
            VStack {
                HeaderDetalhesMagia(circulo: (magia.nivel > 0) ? "\(magia.nivel)º Círculo" : "Truque") { dismiss in
                    if dismiss {
                        self.dismiss()
                    }
                }
                Divider()
                Form {
                    TituloDetalheView(titulo: magia.nome, descricao: magia.escola.rawValue)
                    CorpoDetalheView(magia: magia)
                        .padding(.bottom, 10)
                }
            }
        }
    }
}

struct HeaderDetalhesMagia: View {
    
    private let circulo: String
    private var completion: (_ dismiss: Bool) -> Void
    
    init(circulo: String, completion: @escaping (_ dismiss: Bool) -> Void) {
        self.circulo = circulo
        self.completion = completion
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Image("Habilidades Detalhado")
                .padding(.horizontal, 10)
            VStack(alignment: .leading) {
                Text("Descrição da Habilidade")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                Text(circulo)
                    .font(.system(size: 13, weight: .regular, design: .rounded))
            }
            Spacer()
            Button {
                self.completion(true)
            } label: {
                CustomBotaoFechar()
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding(.trailing, 10)
            }
        }
        .padding(.horizontal, 10)
        .padding(.top, 10)
    }
}

struct TituloDetalheView: View {
    private let titulo: String
    private let descricao: String
    
    init(titulo: String, descricao: String) {
        self.titulo = titulo
        self.descricao = descricao
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(titulo)
                .font(.system(size: 15, weight: .bold, design: .rounded))
            Text(descricao)
                .font(.system(size: 13, weight: .regular, design: .rounded))
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
            TituloDetalheView(titulo: "Tempo Conjuração", descricao: magia.tempoConjuracao)
            TituloDetalheView(titulo: "Alcance:", descricao: magia.alcance)
            TituloDetalheView(titulo: "Componentes", descricao: magia.componentes)
            TituloDetalheView(titulo: "Descrição", descricao: magia.descricao)
        }
    }
}

struct CustomBotaoFechar: View {
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .foregroundColor(Color(uiColor: .systemGray5))
            Image(systemName: "xmark")
                .foregroundColor(.black)
        }
    }
}
