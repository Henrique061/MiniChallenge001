//
//  Inventario.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 15/09/22.
//

import Foundation
import SwiftUI

// Só para atualizar

struct Atributos: View {
    
    @State private var toggleIsOn: Bool = false
    @State private var showProficiencias: Bool = false
    
    @State var teste = true
    var body: some View {
        NavigationView{
            TemplateTelaPadrao(withPaddings: false){
            ScrollView{
                VStack{
                        ToggleVista(toggleIsOn: $toggleIsOn)
                        AtributosVista(toggleIsOn: $toggleIsOn)
                        SalvaguardaVista(toggleIsOn: $toggleIsOn)
                        PericiasVista(toggleIsOn: $toggleIsOn)
                    }
                    .padding(.horizontal, 10)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            NavigationBarTitle("Atributos")
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink {
                                condicoes()
                            } label: {
                                Image("Penalidade")
                            }
                        }
                    }
                }
            }
        }
    }
}




struct TemplateAtributos: View{
    //private var atributos: Binding<[AtributosSalvaguarda]?>
    private var toggleIsOn: Binding<Bool>
    private var titulo1: String
    private var descricao1: String
    
    public init(titulo1: String, descricao1: String, toggleIsOn: Binding<Bool>) {
        self.titulo1 = titulo1
        self.descricao1 = descricao1
        self.toggleIsOn = toggleIsOn
        
    }
    
    var body: some View {
        HStack{
            if toggleIsOn.wrappedValue {
                Circle()
                    .accentColor(Color("RedTheme"))
                    .frame(width: 15, height: 15, alignment: .leading)
            }
            
            VStack(alignment: .leading, spacing: 3) {
                DisplayTextoBotao(titulo: titulo1, descricao: descricao1)
                    .padding(.vertical, 5)
            }
        }
        .padding(.horizontal,10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


struct TemplateTabelaAtributo<Content>: View where Content: View {
    
    @ViewBuilder private var content: () -> Content
    private var title: String
    
    public init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
            TemplateContentBackground {
                VStack(spacing: 0) {
                    content()
                }
            }.padding(.vertical, 10)
        }
    }
}

struct AtributosVista: View{
    @Binding private var toggleIsOn: Bool
    
    public init(toggleIsOn: Binding<Bool>) {
        self._toggleIsOn = toggleIsOn
    }
    
    var body: some View{
        TemplateTabelaAtributo(title: "Atributos") {
            HStack{
                TemplateAtributos(titulo1: "Força", descricao1: "08", toggleIsOn: $toggleIsOn)
                TemplateAtributos(titulo1: "Inteligência", descricao1: "16", toggleIsOn: $toggleIsOn )
            }
            
            Divider()
            HStack{
                TemplateAtributos(titulo1: "Destreza", descricao1: "14", toggleIsOn: $toggleIsOn)
                TemplateAtributos(titulo1: "Sabedoria", descricao1: "10", toggleIsOn: $toggleIsOn )
            }
            Divider()
            HStack{
                TemplateAtributos(titulo1: "Constituição", descricao1: "12", toggleIsOn: $toggleIsOn)
                TemplateAtributos(titulo1: "Carisma", descricao1: "15", toggleIsOn: $toggleIsOn )
            }
        }
            Button {
                print("Button tapped!")
            } label: {
                Text("Editar Atributos")
                    
            }
            .buttonStyle(CustomButtonStyle5())
        }
    }






struct SalvaguardaVista: View{
    @Binding private var toggleIsOn: Bool
    
    public init(toggleIsOn: Binding<Bool>) {
        self._toggleIsOn = toggleIsOn
    }
    var body: some View{
        
        VStack{
            Text("Salva-Guarda")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(alignment: .leading)
            
            
            TemplateContentBackground{
                VStack{
                    
                    
                    HStack{
                        TemplateAtributos(titulo1: "Força", descricao1: "+0", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                        TemplateAtributos(titulo1: "Inteligência", descricao1: "+4", toggleIsOn: $toggleIsOn ).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Divider()
                    HStack{
                        TemplateAtributos(titulo1: "Destreza", descricao1: "+2", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                        TemplateAtributos(titulo1: "Sabedoria", descricao1: "+0", toggleIsOn: $toggleIsOn ).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Divider()
                    HStack{
                        TemplateAtributos(titulo1: "Constituição", descricao1: "+1", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                        TemplateAtributos(titulo1: "Carisma", descricao1: "+2", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }
}

struct PericiasVista: View{
    @Binding private var toggleIsOn: Bool
    public init(toggleIsOn: Binding<Bool>) {
        self._toggleIsOn = toggleIsOn
    }
    var body: some View{
        
        
        VStack{
            Text("Perícias")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(alignment: .leading)
            TemplateContentBackground{
                VStack{
                    HStack{
                        TemplateAtributos(titulo1: "Acrobacia", descricao1: "+0", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                        TemplateAtributos(titulo1: "Lidar com Animais", descricao1: "+4", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack{
                        TemplateAtributos(titulo1: "Arcanismo", descricao1: "+2", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                        TemplateAtributos(titulo1: "Medicina", descricao1: "+0", toggleIsOn: $toggleIsOn ).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack{
                        TemplateAtributos(titulo1: "Atletismo", descricao1: "+1", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                        TemplateAtributos(titulo1: "Natureza", descricao1: "+2", toggleIsOn: $toggleIsOn ).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    HStack{
                        TemplateAtributos(titulo1: "Enganação", descricao1: "+0", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                        TemplateAtributos(titulo1: "Percepcão", descricao1: "+4", toggleIsOn: $toggleIsOn ).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack{
                        TemplateAtributos(titulo1: "Furtividade", descricao1: "+2", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                        TemplateAtributos(titulo1: "Performace", descricao1: "+0", toggleIsOn: $toggleIsOn ).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack{
                        TemplateAtributos(titulo1: "História", descricao1: "+1", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                        TemplateAtributos(titulo1: "Persuasão", descricao1: "+2", toggleIsOn: $toggleIsOn ).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    HStack{
                        TemplateAtributos(titulo1: "Intuição", descricao1: "+0", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                        TemplateAtributos(titulo1: "Prestidigitação", descricao1: "+4", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack{
                        TemplateAtributos(titulo1: "Intimidação", descricao1: "+2", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                        TemplateAtributos(titulo1: "Religião", descricao1: "+0", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack{
                        TemplateAtributos(titulo1: "Investigação", descricao1: "+1", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                        TemplateAtributos(titulo1: "Sobrevivência", descricao1: "+2", toggleIsOn: $toggleIsOn).frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }
    
}
struct ToggleVista: View{
    // @ObservedObject var vmclasse = TemplateFichaPronta()
    @Binding private var toggleIsOn: Bool
    @State private var showProficiencias: Bool = false
    
    public init(toggleIsOn: Binding<Bool>) {
        self._toggleIsOn = toggleIsOn
    }
    
    var body: some View{
                VStack{
                    TemplateTabelaAtributo(title: "Bônus de Proeficiência"){
            
            
            HStack{
                
                DisplayTextoBotao(titulo: "Pontos Adicionais", descricao: "02").padding(.vertical,5)
                    .padding(.horizontal,10)
                Spacer()
                Toggle("", isOn: $showProficiencias)
                    .padding(.vertical,5)
                    .padding(.horizontal,5)
                    .labelsHidden()
                    .tint(Color("RedTheme"))
                    .onChange(of: showProficiencias, perform: { newValue in
                        withAnimation {
                            toggleIsOn = showProficiencias
                        }
                    })
            }
                    }.padding(.vertical, 10)
        }
    }
}




struct fragPericias: View{
    @Binding private var mostrarBolinha: Bool
    public init(mostrarBolinha: Binding<Bool>) {
        self._mostrarBolinha = mostrarBolinha
    }
    
//    private var textoss = [
//
//    //TemplateAtributos(titulo1: "sss", descricao1: "sss", mostrarBolinha: $mostrarBolinha)
//    ]
     
    
    
    
    
    var body: some View{
        TemplateContentBackground{
            
        }
    }
}
