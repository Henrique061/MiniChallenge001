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
                    
                    SelecionarImagemCriacao(perfil: $vmficha.perfil)
                    AllTextFieldsCriação(perfil: $vmficha.perfil)
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
    
    @Binding private var perfil: PerfilPersonagem
    
    public init(perfil: Binding<PerfilPersonagem>) {
        self._perfil = perfil
    }
    
    var body: some View {
        IntegerTextFieldCriacao(title: "Idade (anos)", text: $perfil.idade)
        IntegerTextFieldCriacao(title: "Altura (cm)", text: $perfil.altura)
        IntegerTextFieldCriacao(title: "Peso (kg)", text: $perfil.peso)
        TextFieldCriacao(title: "Olhos", text: $perfil.olhos)
        TextFieldCriacao(title: "Pele", text: $perfil.pele)
        TextFieldCriacao(title: "Cabelo", text: $perfil.cabelo)
        TextFieldCriacao(title: "Outros", text: $perfil.outros)
        
        
        
    }
}



private struct IntegerTextFieldCriacao: View {
    
    @Binding private var text: String
    private let title: String
    
    public init(title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    
    var body: some View {
        TemplateContentBackground {
            VStack(alignment: .leading, spacing: 3) {
                Text(title).font(.system(size: 15, weight: .bold, design: .default))
                TextField("Toque para digitar...", text: $text)
                    .keyboardType(.numberPad)
            }
            .padding(10)
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
    
    @Binding private var perfil: PerfilPersonagem
    @State private var showImagePicker: Bool = false
    @State private var currentImage: Image
    
    public init(perfil: Binding<PerfilPersonagem>) {
        self._perfil = perfil
        if let data = perfil.foto.wrappedValue {
            self.currentImage = Image(uiImage: UIImage(data: data)!)
        } else {
            self.currentImage = Image("ProfilePicture")
        }
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Color.black
                if perfil.foto != nil {
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
                if let image = image, let data: Data = image.jpegData(compressionQuality: 1) {
                    DispatchQueue.main.async {
                        self.currentImage = Image(uiImage: image)
                        self.perfil.foto = data
                    }
                }
            }
        }
    }
    
    
    
}


