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
    @ObservedObject private var sheet: SheetsViewModel
    @State private var showAlterarNivel: Bool = false
    @State private var showTimerButton: Bool = false
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
    }
    
    var body: some View {
        NavigationView {
            TemplateTelaPadrao(withPaddings: false) {
                AreaImagemPerfil(ficha: $sheet.fichaSelecionada)

                VStack(alignment: .center, spacing: 10) {
                    Text("\(sheet.fichaSelecionada.nomePersonagem)")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .padding(.bottom, -8)
                    Text("\(sheet.fichaSelecionada.classeFinal.classePersonagem.rawValue)")
                        .font(.system(size: 15, weight: .regular, design: .default))

                    Button("Alterar Nível") {
                        self.showAlterarNivel.toggle()
                    }
                    .buttonStyle(CustomButtonStyle5())
                    .sheet(isPresented: $showAlterarNivel) {
                        AlterarNivelView(sheet: self.sheet)
                    }

                    ScrollView {
                        VStack {
                            AreaInformacoesGerais(ficha: $sheet.fichaSelecionada)
                                .frame(minHeight: 80)
                            AreaPontosVida(sheet: self.sheet)
                                .frame(minHeight: 100)
                            AreaPontosVidaTemporarios(sheet: self.sheet)
                                .frame(minHeight: 80 )
                            HStack {
                                AreaDadoVida(sheet: self.sheet)
                                AreaResistenciaMorte(sheet: self.sheet)
                            }
                            .frame(minHeight: 100)
                        }.padding(.horizontal, 10)
                    }.padding(.horizontal, -10)
                }
                .padding(.horizontal, 10)

                
                .navigationTitle(self.sheet.fichaSelecionada.nome)
                
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            DispatchQueue.main.async {
                                let _ = self.sheet.saveFicha()
                            }
                            dismiss()
                        } label: {
                            Text("Fichas")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button() {
                            self.showTimerButton.toggle()
                        } label: {
                            Image("Temporizador").accentColor(.black)
                        }
                        .confirmationDialog("Descanso", isPresented: $showTimerButton) {
                            Button("Descansar") {
                                DispatchQueue.main.async {
                                    self.sheet.fichaSelecionada.pontosVida = self.sheet.fichaSelecionada.pontosVidaMaximo
                                    self.sheet.fichaSelecionada.quantiaDadoVida = self.sheet.fichaSelecionada.pontosVidaMaximo
                                    self.sheet.resetResistenciaMorte()
                                }
                            }
                            Button("Cancelar", role: .cancel) {}
                        }
                    }
                }
                .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
            }
        }
    }
}

private struct AreaResistenciaMorte: View {
    
    @ObservedObject private var sheet: SheetsViewModel
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
    }
    
    var body: some View {
        TemplateContentBackground {
            VStack(spacing: 10) {
                Text("Resistência à Morte")
                    .font(.system(size: 15, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack {
                    TemplateSheetButton(image: Image(systemName: "xmark.circle")) {
                        self.sheet.setResistenciaMorteFalha()
                    }
                    
                    EstruturaResistenciaMorte(resistenciaMorte: $sheet.fichaSelecionada.resistenciaMorte)
                    
                    TemplateSheetButton(image: Image(systemName: "checkmark.circle")) {
                        self.sheet.setResistenciaMorteSucesso()
                    }
                }
                Divider().padding(.horizontal, -10)
                Button("Resetar") {
                    sheet.resetResistenciaMorte()
                }
                .buttonStyle(CustomButtonStyle6())
                .padding(-10)
            }
            .padding(10)
        }
    }
}

private struct EstruturaResistenciaMorte: View {
    
    @Binding private var resistencia: ResistenciaMorte
    
    public init(resistenciaMorte: Binding<ResistenciaMorte>) {
        self._resistencia = resistenciaMorte
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("InverseButton"))
            HStack(alignment: .center, spacing: 10) {
                LosangoEstruturaResistenciaMorte(activeColor: .red, condition: resistencia.falha >= 1)
                LosangoEstruturaResistenciaMorte(activeColor: .red, condition: resistencia.falha >= 2)
                MainLosangoEstruturaResistenciaMorte(size: 16, resistencia: $resistencia)
                    .padding(.horizontal, 5)
                LosangoEstruturaResistenciaMorte(activeColor: .green, condition: resistencia.sucesso >= 2)
                LosangoEstruturaResistenciaMorte(activeColor: .green, condition: resistencia.sucesso >= 1)
            }
        }
        .fixedSize()
    }
}

private struct MainLosangoEstruturaResistenciaMorte: View {
    
    @Binding private var resistencia: ResistenciaMorte
    private var size: CGFloat
    
    private var currentColor: Color {
        
        if resistencia.sucesso >= 3 {
            return Color("GreenSuccess")
        }
        
        if resistencia.falha >= 3 {
            return Color("RedTheme")
        }
        
        return Color("ContentBackground")
    }
    
    public init(size: CGFloat, resistencia: Binding<ResistenciaMorte>) {
        self._resistencia = resistencia
        self.size = size
    }
    
    var body: some View {
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(currentColor)
            .rotationEffect(Angle(degrees: 45))
            .overlay {
                Rectangle()
                    .stroke(Color("InverseButton"), lineWidth: 2)
                    .rotationEffect(Angle(degrees: 45))
            }
    }
    
}

private struct LosangoEstruturaResistenciaMorte: View {
    
    enum ActiveColorOptions {
        case red
        case green
    }
    
    private var size: CGFloat
    private var condition: Bool
    private var activeColor: ActiveColorOptions
    
    private var getActiveColor: Color {
        switch activeColor {
        case .red:
            return Color("RedTheme")
        case .green:
            return Color("GreenSuccess")
        }
    }
    
    public init(size: CGFloat = 8, activeColor: ActiveColorOptions, condition: Bool) {
        self.size = size
        self.activeColor = activeColor
        self.condition = condition
    }
    
    var body: some View {
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(condition ? getActiveColor : Color("ContentBackground"))
            .rotationEffect(Angle(degrees: 45))
            .overlay {
                Rectangle()
                    .stroke(Color("InverseButton"), lineWidth: 2)
                    .rotationEffect(Angle(degrees: 45))
            }
    }
    
}

private struct AreaDadoVida: View {
    @ObservedObject private var sheet: SheetsViewModel
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
    }
    
    var body: some View {
        
        TemplateContentBackground {
            VStack(spacing: 10) {
                Text("Dado de Vida")
                    .font(.system(size: 15, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack(alignment: .center, spacing: 10) {
                    TemplateSheetButton(image: Image(systemName: "minus.circle")) {
                        sheet.setDadosVida(value: -1)
                    }
                    
                    Text("\(self.sheet.fichaSelecionada.quantiaDadoVida)")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .padding(.horizontal, 10)
                    
                    TemplateSheetButton(image: Image(systemName: "plus.circle")) {
                        sheet.setDadosVida(value: +1)
                    }
                }
                Divider().padding(.horizontal, -10)
                Text("Total: \(sheet.maximoDadoVida)")
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(10)
        }
    }
}

private struct AreaPontosVidaTemporarios: View {
    @ObservedObject private var sheet: SheetsViewModel
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
    }
    
    var body: some View {
        
        TemplateContentBackground {
            VStack(spacing: 10) {
                Text("Pontos de Vida Temporários")
                    .font(.system(size: 15, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack(alignment: .center, spacing: 10) {
                    TemplateSheetButton(image: Image(systemName: "minus.circle")) {
                        sheet.setPontosVidaTemp(value: -1)
                    }
                    
                    Text("\(sheet.fichaSelecionada.pontosVidaTemporário)")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .padding(.horizontal, 10)
                    
                    TemplateSheetButton(image: Image(systemName: "plus.circle")) {
                        sheet.setPontosVidaTemp(value: +1)
                    }
                }
            }
            .padding(10)
        }
    }
}

private struct AreaPontosVida: View {
    
    @ObservedObject private var sheet: SheetsViewModel
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
    }
    
    var body: some View {
        
        TemplateContentBackground {
            VStack(spacing: 10) {
                Text("Pontos de Vida")
                    .font(.system(size: 15, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack(alignment: .center, spacing: 10) {
                    TemplateSheetButton(image: Image(systemName: "minus.circle")) {
                        self.sheet.setPontosVida(value: -1)
                    }
                    
                    Text("\(sheet.fichaSelecionada.pontosVida)")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .padding(.horizontal, 10)
                    
                    TemplateSheetButton(image: Image(systemName: "plus.circle")) {
                        self.sheet.setPontosVida(value: +1)
                    }
                }
                Divider()
                    .padding(.horizontal, -10)
                Text("Máximo de Pontos de Vida: \(sheet.fichaSelecionada.pontosVidaMaximo)")
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
            
            Menu {
                ForEach(-10..<31) { num in
                    Button {
                        self.ficha.iniciativa  = num
                    } label: {
                        Text("\(num)")
                    }
                }
            } label: {
                ZStack(alignment: .bottom) {
                    TemplateInformacao(title: "Iniciativa", content: "\(ficha.iniciativa < 0 ? "\(ficha.iniciativa)" : "+\(ficha.iniciativa)")")
                    Color("InverseButton")
                        .frame(height: 5)
                }
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .foregroundColor(Color("BlackAndWhite"))
            }
            
            
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

private struct TemplateSheetButton: View {
    
    private var image: Image
    private var completion: () -> Void
    
    public init(image: Image, completion: @escaping () -> Void) {
        self.image = image
        self.completion = completion
    }
    
    var body: some View {
        
        Button {
            self.completion()
        } label: {
            self.image
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
        }
        .buttonStyle(CustomButtonStyle7())
    }
}

