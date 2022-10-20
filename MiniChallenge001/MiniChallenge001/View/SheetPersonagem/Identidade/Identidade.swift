//
//  Identidade.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 15/09/22.
//

// Só para atualizar

import Foundation
import SwiftUI

struct Identidade: View {
    
    @ObservedObject private var sheet: SheetsViewModel
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
    }
    
    var body: some View {
        CustomNavigationView {
            TemplateTelaPadrao(withPaddings: false){
                ScrollView{
                    VStack{
                        HStack{
                            IdentidadeSuperior(ficha: $sheet.fichaSelecionada)
                            .padding(.horizontal, 10)
                            
                        }
                        IdentidadeInferior(ficha: $sheet.fichaSelecionada)
                            .padding(.horizontal, 10)
                        EstiloVidaPicker(estiloVida: $sheet.fichaSelecionada.estiloVida)
                            .padding(.horizontal, 10)
                        IdiomasIdentidade(idiomas: $sheet.fichaSelecionada.idiomas)
                            .padding(.horizontal, 10)
                        BotaoInformacoesProficiencias(tituloBotao: "Proficiências", ficha: $sheet.fichaSelecionada)
                            .padding(.horizontal, 10)
                        InformacoesPerfil(subtituloSheet: "Traços de Personalidade", descricao: $sheet.fichaSelecionada.tracosPersonalidadePersonagem)
                            .padding(.horizontal, 10)
                        InformacoesPerfil(subtituloSheet: "Ideais", descricao: $sheet.fichaSelecionada.ideaisPersonagem)
                            .padding(.horizontal, 10)
                        InformacoesPerfil(subtituloSheet: "Vínculo", descricao: $sheet.fichaSelecionada.vinculoPersonagem)
                            .padding(.horizontal, 10)
                        InformacoesPerfil(subtituloSheet: "Defeitos", descricao: $sheet.fichaSelecionada.defeitosPersonagem)
                            .padding(.horizontal, 10)
                        InformacoesPerfil(subtituloSheet: "Outros", descricao: $sheet.fichaSelecionada.outrosPersonagem)
                            .padding(.horizontal, 10)
                    }
                    
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .principal) {
                            NavigationBarTitle("Perfil")
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            Caracteristicas(ficha: $sheet.fichaSelecionada)
                            } label: {
                                Image("Aprimoramento")
                            }
                        }
                    }
                }
            }
        }
    }
}




struct IdentidadeSuperior: View{
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    var body: some View{
        TemplateContentBackground{
            HStack{
            VStack(alignment: .leading, spacing: 3){
                DisplayTextoBotao(titulo: "Nome", descricao: ficha.nomePersonagem)
                    .padding(.vertical, 5)
                    .padding(.horizontal,10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                ClasseNivel(titulo: "Classe e Nível", descricao: ficha.classeFinal.classePersonagem.rawValue, nivel: "\(ficha.nivel)")
                    .padding(.vertical, 5)
                    .padding(.horizontal,10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
            }
                ImagemPerfilEditavel(ficha: $ficha)
                    .padding(.horizontal,10)
            }
        }
        
    }
    
}

struct ClasseNivel: View{
    
    private var titulo: String
    private var descricao: String
    private var nivel: String
    
    public init(titulo: String, descricao: String, nivel:String) {
        self.titulo = titulo
        self.descricao = descricao
        self.nivel = nivel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(titulo)
                .font(.system(size: 15, weight: .semibold, design: .default))
            
            HStack{
                Text(descricao)
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .fixedSize(horizontal: false, vertical: true)
                Divider()
                Text(nivel)
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .foregroundColor(Color("BlackAndWhite"))
    }
}

struct IdentidadeInferior: View{
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var nomeRaca: String {
        if ficha.racaFinal.subracaPersonagem == .none {
            return ficha.racaFinal.racaPersonagem.rawValue
        } else {
            return ficha.racaFinal.subracaPersonagem.rawValue
        }
    }
    
    var body:some View{
        TemplateContentBackground{
            VStack(alignment: .leading, spacing: 3){
                HStack{
                    DisplayTextoBotao(titulo: "Raça", descricao: nomeRaca)
                        .padding(.vertical, 5)
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    DisplayTextoBotao(titulo: "Tendência", descricao: ficha.tendenciaPersonagem.rawValue)
                        .padding(.vertical, 5)
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Divider()
                HStack{
                    DisplayTextoBotao(titulo: "Antecedente", descricao: ficha.antecedenteFinal.rawValue)
                        .padding(.vertical, 5)
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    DisplayTextoBotao(titulo: "Pontos de Experiência", descricao: "\(ficha.experiencica)")
                        .padding(.vertical, 5)
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}
  
private struct IdiomasIdentidade: View {
    @Binding private var idiomas: [IdiomaAlfabeto]
    
    public init(idiomas: Binding<[IdiomaAlfabeto]>) {
        self._idiomas = idiomas
    }
    
    var idiomasNomes: String {
        return ArrayUtils<Any>.formatarIdiomaString(idiomasAlfabeto: idiomas)
    }
    
    var body:some View{
        
        TemplateContentBackground {
            DisplayTextoBotao(titulo: "Idiomas", descricao: idiomasNomes)
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
        }
    }
}

private struct InformacoesPerfil: View {
    @State private var mostrarDetalhes: Bool = false
    private var subtituloBotao: String = "Toque para abrir..."
    
    @Binding private var descricao: String
    private var subtituloSheet: String
    
    public init(subtituloSheet: String, descricao: Binding<String>) {
        self._descricao = descricao
        self.subtituloSheet = subtituloSheet
    }
    
    var body: some View {
        Button {
            mostrarDetalhes.toggle()
        } label: {
            DisplayTextoBotao(titulo: subtituloSheet, descricao: subtituloBotao)
                .padding(.vertical, 5)
        }.buttonStyle(CustomButtonStyle2())
        .sheet(isPresented: $mostrarDetalhes) {
            TextEditorSheetCaracteristicaPersonagem(title: subtituloSheet, content: $descricao)
        }
    }
}

private struct BotaoInformacoesProficiencias: View {
    private var subtituloBotao: String = "Toque para abrir..."
    
    @Binding private var ficha: PersonagemFicha
    private var tituloBotao: String
    
    public init(tituloBotao: String, ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
        self.tituloBotao = tituloBotao
    }
    
    var body: some View {
        NavigationLink {
            Proficiencias(ficha: $ficha)
        } label: {
            DisplayTextoBotao(titulo: tituloBotao, descricao: subtituloBotao)
                .padding(.vertical, 5)
        }.buttonStyle(CustomButtonStyle2())
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

struct ImagemPerfilEditavel: View {
    
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
                if let image = image, let data: Data = image.jpegData(compressionQuality: 1) {
                    DispatchQueue.main.async {
                        self.currentImage = Image(uiImage: image)
                        self.ficha.fotoPersonagem = data
                    }
                }
            }
        }
    }
}
