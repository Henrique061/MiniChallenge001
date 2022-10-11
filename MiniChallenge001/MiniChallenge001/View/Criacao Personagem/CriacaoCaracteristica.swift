//
//  CriacaoCaracteristica.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 10/10/22.
//

import SwiftUI

//extension TextEditor {
//
//    UITextView.appearance().textContainerInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
//
//}

struct CriacaoCaracteristica: View {
    
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    Text("Todo herói (ou vilão) possui uma história por trás de seus feitos. Conte-nos um pouco sobre a sua...")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                    
                    
                    CriacaoCaracteristicaButton(title: "Traços de Personalidade", content: $ficha.tracosPersonalidadePersonagem)
                    CriacaoCaracteristicaButton(title: "Ideais", content: $ficha.ideaisPersonagem)
                    CriacaoCaracteristicaButton(title: "Vínculo", content: $ficha.vinculoPersonagem)
                    CriacaoCaracteristicaButton(title: "Defeitos", content: $ficha.defeitosPersonagem)
                    
                    EstiloVidaPicker(estiloVida: $ficha.estiloVida)
                    
                    Spacer()
                }
                
                NavigationLink {
                    CriacaoDescricao(ficha: $ficha)
                } label: {
                    Text("Próximo")
                }.buttonStyle(CustomButtonStyle5())
            }
            .padding(.horizontal, 10)
            
            .navigationTitle("Criação de Personagem")
            
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    NavigationBarTitle("Criação de Personagem")
//                }
//            }
        }
    }
}

struct CriacaoCaracteristicaButton: View {
    
    @Binding private var content: String
    @State private var showSheet: Bool
    private let title: String
    
    public init(title: String, content: Binding<String>) {
        self.title = title
        self._content = content
        self.showSheet = false
    }
    
    var body: some View {
        Button {
            self.showSheet.toggle()
        } label: {
            DisplayTextoBotao(titulo: title, descricao: "Toque para digitar")
        }
        .buttonStyle(CustomButtonStyle())
        
        .sheet(isPresented: $showSheet) {
            TextEditorSheetCaracteristicaPersonagem(title: self.title, content: self.$content)
        }
    }
}

struct TextEditorSheetCaracteristicaPersonagem: View {
    
    private let title: String
    @Binding private var content: String
    
    public init(title: String, content: Binding<String>) {
        self.title = title
        self._content = content
        UITextView.appearance().textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("IdentidadeIconOff"), title: "Descrição de Identidade", subtitle: "Traços de Personalidade")) {
            TextEditor(text: $content)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
        }
    }
}

private struct EstiloVidaPicker: View {
    
    @State private var isExpanded: Bool
    @Binding private var selectedValue: EstiloDeVida
    
    public init(estiloVida: Binding<EstiloDeVida>) {
        self.isExpanded = false
        self._selectedValue = estiloVida
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(EstiloDeVida.allCases, id: \.self) { estilo in
                if estilo != .none {
                    TemplateRadioButton(isMarked: selectedValue == estilo, title: estilo.rawValue) {
                        withAnimation {
                            self.selectedValue = estilo
                            self.isExpanded.toggle()
                        }
                    }
                }
            }
        } header: {
            DisplayTextoBotao(titulo: "Estilo de Vida", descricao: selectedValue == .none ? "Toque para selecionar..." : selectedValue.rawValue)
        }
    }
}
