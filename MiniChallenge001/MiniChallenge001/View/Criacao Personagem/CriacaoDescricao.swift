//
//  CriacaoDescricao.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 10/10/22.
//

import PhotosUI
import SwiftUI

struct CriacaoDescricao: View {
    
    @ObservedObject private var vmficha: NovaFichaViewModel
    @Binding private var popToRoot: Bool
    
    public init(vmficha: NovaFichaViewModel, popToRoot: Binding<Bool>) {
        self.vmficha = vmficha
        self._popToRoot = popToRoot
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    Text("Por fim, mas não menos importante, diga-nos como é esse personagem...")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                    
                    SelecionarImagemCriacao(ficha: $vmficha.ficha)
                    AllTextFieldsCriação(ficha: $vmficha.ficha)
                    Spacer()
                }
                
                NavigationLink {
                    CriacaoAtributos(vmficha: vmficha, popToRoot: $popToRoot)
                } label: {
                    Text("Próximo")
                }
                .isDetailLink(false)
                .buttonStyle(CustomButtonStyle5())
                
            }
            .padding(.horizontal, 10)
            
            .navigationTitle("Criação de Personagem")
        }
    }
}

private struct AllTextFieldsCriação: View {
    
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View {
        IntegerTextFieldCriacao(title: "Idade", content: $ficha.idadePersonagem)
        FloatTextFieldCriacao(title: "Altura", content: $ficha.alturaPersonagem)
        FloatTextFieldCriacao(title: "Peso", content: $ficha.pesoPersonagem)
        TextFieldCriacao(title: "Olhos", text: $ficha.olhosPersonagem)
        TextFieldCriacao(title: "Pele", text: $ficha.pelePersonagem)
        TextFieldCriacao(title: "Cabelo", text: $ficha.cabeloPersonagem)
        TextFieldCriacao(title: "Outros", text: $ficha.outrosPersonagem)
    }
}

private struct IntegerTextFieldCriacao: View {
    
    @Binding private var content: Int
    @State private var text: String
    private let title: String
    
    public init(title: String, content: Binding<Int>) {
        self.title = title
        self._content = content
        self.text = "\(content.wrappedValue)"
    }
    
    
    var body: some View {
        TemplateContentBackground {
            VStack(alignment: .leading, spacing: 3) {
                Text(title).font(.system(size: 15, weight: .bold, design: .default))
                TextField("Toque para digitar...", text: $text)
                    .keyboardType(.numberPad)
            }
            .padding(10)
            
            .onChange(of: text) { newValue in
                content = Int(newValue) ?? 0
            }
        }
    }
}

private struct FloatTextFieldCriacao: View {
    
    @Binding private var content: Float
    @State private var text: String
    private let title: String
    
    public init(title: String, content: Binding<Float>) {
        self.title = title
        self._content = content
        self.text = "\(content.wrappedValue)"
    }
    
    
    var body: some View {
        TemplateContentBackground {
            VStack(alignment: .leading, spacing: 3) {
                Text(title).font(.system(size: 15, weight: .bold, design: .default))
                TextField("Toque para digitar...", text: $text)
                    .keyboardType(.decimalPad)
            }
            .padding(10)
            
            .onChange(of: text) { newValue in
                content = Float(newValue) ?? 0
            }
        }
    }
}

struct TextFieldCriacao: View {
    
    @Binding private var text: String
    private let title: String
    
    public init(title: String, text: Binding<String>) {
        self._text = text
        self.title = title
    }
    
    var body: some View {
        TemplateContentBackground {
            VStack(alignment: .leading, spacing: 3) {
                Text(title).font(.system(size: 15, weight: .bold, design: .default))
                TextField("Toque para digitar...", text: $text)
            }.padding(10)
        }
    }
}

private struct SelecionarImagemCriacao: View {
    
    @Binding private var ficha: PersonagemFicha
    @State private var showImagePicker: Bool = false
    @State private var currentImage: Image
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
        if let data = ficha.fotoPersonagem.wrappedValue {
            self.currentImage = Image(uiImage: UIImage(data: data)!)
        } else {
            self.currentImage = Image("ProfilePicture")
        }
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Color.black
                if ficha.fotoPersonagem != nil {
                    currentImage
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFill()
                } else {
                    Image("ProfilePicture")
                        .resizable()
                        .scaledToFit()
                        .padding(8)
                }
            }
            .frame(width: 80, height: 80, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color("BlackAndWhite"), lineWidth: 1))
            .overlay(alignment: .bottomTrailing) {
                Button {
                    self.showImagePicker.toggle()
                } label: {
                    ZStack(alignment: .center) {
                        Color.black
                        Image(systemName: "plus.circle")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 13, height: 13)
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 26, height: 26, alignment: .center)
                    .clipShape(Circle())
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        
        
        
        .sheet(isPresented: $showImagePicker) {
            ImagePicker { image in
                if let image = image, let data: Data = image.pngData() {
                    DispatchQueue.main.async {
                        self.currentImage = Image(uiImage: image)
                        self.ficha.fotoPersonagem = data
                    }
                }
            }
        }
    }
    
    
    
}


