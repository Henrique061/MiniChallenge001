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
        NavigationView {
            TemplateTelaPadrao(withPaddings: false){
                ScrollView{
                    VStack{
                        HStack{
                            identidadeSuperior(ficha: $sheet.fichaSelecionada)
                            .padding(.horizontal, 10)
                            
                        }
                        identidadeInferior()
                            .padding(.horizontal, 10)
                        EstiloVidaPicker(estiloVida: $sheet.fichaSelecionada.estiloVida)
                            .padding(.horizontal, 10)
                        idiomasIdentidade()
                            .padding(.horizontal, 10)
                    }
                    
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .principal) {
                            NavigationBarTitle("Perfil")
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                                Caracteristicas()
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




struct identidadeSuperior: View{
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    var body: some View{
        TemplateContentBackground{
            HStack{
            VStack(alignment: .leading, spacing: 3){
                DisplayTextoBotao(titulo: "Nome", descricao: "isso")
                    .padding(.vertical, 5)
                    .padding(.horizontal,10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                classeNivel(titulo: "Classe e Nível", descricao: "Patrulheiro", nivel: "03")
                    .padding(.vertical, 5)
                    .padding(.horizontal,10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
            }
                ImagemPerfil(ficha: $ficha)
                    .padding(.horizontal,10)
            }
        }
        
    }
    
}

struct classeNivel: View{
    
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

struct identidadeInferior: View{
    var body:some View{
        TemplateContentBackground{
            VStack(alignment: .leading, spacing: 3){
                HStack{
                    DisplayTextoBotao(titulo: "Raça", descricao: "Gnomo das Rochas")
                        .padding(.vertical, 5)
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    DisplayTextoBotao(titulo: "Tendência", descricao: "Caótico Neutro")
                        .padding(.vertical, 5)
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Divider()
                HStack{
                    DisplayTextoBotao(titulo: "Antecedente", descricao: "Criminal")
                        .padding(.vertical, 5)
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    DisplayTextoBotao(titulo: "Pontos de Experiência", descricao: "3456789")
                        .padding(.vertical, 5)
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
    }
}
}
  

  struct idiomasIdentidade: View{
//    @ObservedObject private var sheet: SheetsViewModel
//
//
//    public init(ficha: SheetsViewModel) {
//        self._sheet = ObservedObject(initialValue: ficha)
//    }
    var body:some View{
        TemplateContentBackground {
            
        
        DisplayTextoBotao(titulo: "Idiomas", descricao: "COMUN E GNOMICO")
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
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
