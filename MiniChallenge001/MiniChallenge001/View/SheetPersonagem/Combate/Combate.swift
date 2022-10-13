//
//  Combate.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 15/09/22.
//

// Só para atualizar

import Foundation
import SwiftUI

struct Combate: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View {
        NavigationView {
            TemplateTelaPadrao {
                AreaImagemPerfil(ficha: $ficha)
                
                VStack(alignment: .center, spacing: 10) {
                    Text("\(ficha.nomePersonagem)")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .padding(.bottom, -8)
                    Text("\(ficha.classeFinal.classePersonagem.rawValue)")
                        .font(.system(size: 15, weight: .regular, design: .default))
                    Button("Alterar Nível") {
                        
                    }
                    .buttonStyle(CustomButtonStyle5())
                    
                    AreaInformacoesGerais(ficha: $ficha)
                    AreaPontosVida(ficha: $ficha)
                    AreaPontosVidaTemporarios(ficha: $ficha)
                    HStack {
                        AreaDadoVida(ficha: $ficha)
                        AreaResistenciaMorte(ficha: $ficha)
                    }
                }
                .padding(.horizontal, 10)
                
                Spacer()
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("\(ficha.nome)")
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Fichas")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button() {
                        print("Pressed")
                    } label: {
                        Image("Temporizador").accentColor(.black)
                    }
                }
            }
        }
    }
}

private struct AreaResistenciaMorte: View {
    
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Resistência à Morte")
                .font(.system(size: 15, weight: .bold, design: .default))
                .frame(maxWidth: .infinity, alignment: .center)
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "xmark.circle")
                        .renderingMode(.template)
                        .foregroundColor(Color("BlackAndWhite"))
                        .frame(width: 35, height: 35)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "checkmark.circle")
                        .renderingMode(.template)
                        .foregroundColor(Color("BlackAndWhite"))
                        .frame(width: 35, height: 35)
                }
            }
        }
    }
}

private struct AreaDadoVida: View {
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View {
        
        TemplateContentBackground {
            VStack(spacing: 10) {
                Text("Dado de Vida")
                    .font(.system(size: 15, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack(alignment: .center, spacing: 10) {
                    Button {
                        
                    } label: {
                        Image(systemName: "minus.circle")
                            .renderingMode(.template)
                            .foregroundColor(Color("BlackAndWhite"))
                            .frame(width: 35, height: 35)
                    }
                    Text("\(ficha.quantiaDadoVida)")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .padding(.horizontal, 5)
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .renderingMode(.template)
                            .foregroundColor(Color("BlackAndWhite"))
                            .frame(width: 35, height: 35)
                    }
                }
                Divider().padding(.horizontal, -10)
                Text("Total: \(ficha.quantiaDadoVida)")
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(10)
        }
    }
}

private struct AreaPontosVidaTemporarios: View {
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View {
        
        TemplateContentBackground {
            VStack(spacing: 10) {
                Text("Pontos de Vida Temporários")
                    .font(.system(size: 15, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack(alignment: .center, spacing: 10) {
                    Button {
                        
                    } label: {
                        Image(systemName: "minus.circle")
                            .renderingMode(.template)
                            .foregroundColor(Color("BlackAndWhite"))
                            .frame(width: 35, height: 35)
                    }
                    Text("\(ficha.pontosVidaTemporário)")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .padding(.horizontal, 5)
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .renderingMode(.template)
                            .foregroundColor(Color("BlackAndWhite"))
                            .frame(width: 35, height: 35)
                    }
                }
            }
            .padding(10)
        }
    }
}

private struct AreaPontosVida: View {
    
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View {
        
        TemplateContentBackground {
            VStack(spacing: 10) {
                Text("Pontos de Vida")
                    .font(.system(size: 15, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack(alignment: .center, spacing: 10) {
                    Button {
                        
                    } label: {
                        Image(systemName: "minus.circle")
                            .renderingMode(.template)
                            .foregroundColor(Color("BlackAndWhite"))
                            .frame(width: 35, height: 35)
                    }
                    Text("\(ficha.pontosVida)")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .padding(.horizontal, 15)
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .renderingMode(.template)
                            .foregroundColor(Color("BlackAndWhite"))
                            .frame(width: 35, height: 35)
                    }
                }
                Divider()
                    .padding(.horizontal, -10)
                Text("Máximo de Pontos de Vida: \(ficha.pontosVida)")
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(10)
        }
        
    }
}

private struct AreaInformacoesGerais: View {
    
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            TemplateInformacao(title: "Armadura", content: "\(ficha.classeArmadura)")
            TemplateInformacao(title: "Iniciativa", content: "\(ficha.iniciativa)")
            TemplateInformacao(title: "Deslocamento", content: "\(ficha.deslocamento) m")
        }
    }
}

private struct TemplateInformacao: View {
    
    private let title: String
    private let content: String
    
    public init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        TemplateContentBackground {
            VStack(alignment: .center, spacing: 10) {
                Text(title)
                    .font(.system(size: 15, weight: .bold, design: .default))
                Text(content)
                    .font(.system(size: 18, weight: .semibold, design: .default))
            }
            .scaledToFill()
            .frame(maxWidth: .infinity, alignment: .center)
            .fixedSize(horizontal: false, vertical: true)
            .padding(10)
        }
    }
}

private struct AreaImagemPerfil: View {
    
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View {
        VStack() {
            Rectangle()
                .foregroundColor(Color("InverseButton"))
                .frame(height: 60)
                .padding(.top, -10)
                .padding(.bottom, 50)
                .overlay(alignment: .bottom) {
                    ImagemPerfil(ficha: $ficha)
                        .frame(width: 100, height: 100)
                        .overlay(alignment: .bottomTrailing) {
                            ZStack(alignment: .center) {
                                Circle()
                                    .foregroundColor(Color("InverseButton"))
                                Text("\(ficha.nivel)")
                                    .foregroundColor(Color("InverseBlackAndWhite"))
                                    .font(.system(size: 15, weight: .bold, design: .default))
                            }
                            .frame(width: 30, height: 30, alignment: .center)
                            .padding(.trailing, 5)
                            .padding(.bottom, 5)
                        }
                }
        }
    }
}
