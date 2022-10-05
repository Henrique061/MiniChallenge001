//
//  CriacaoMain.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 24/09/22.
//

import SwiftUI

public class NovaFichaViewModel: ObservableObject {
    @Published var ficha: PersonagemFicha
    
    init() {
        self.ficha = PersonagemFicha()
    }
}

struct CriacaoMain: View {
    
    @ObservedObject private var novaFicha: NovaFichaViewModel = NovaFichaViewModel()
    
    var body: some View {
        TemplateTelaPadrao {
            ScrollView {
                VStack(spacing: 10) {
                    Text("Para começarmos, preencha abaixo os dados de seu peronsagem")
                    
                    TextField("Nome da ficha", text: $novaFicha.ficha.nome)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    TextField("Nome do personagem", text: $novaFicha.ficha.nomePersonagem)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                    CustomNavigationLink {
                        SelecaoRacaView(ficha: $novaFicha.ficha)
                    } label: {
                        DisplayTextoBotao(titulo: "Raça do personagem", descricao: "Toque para selecionar...")
                    }
                    
                    CustomNavigationLink {
                        SelecaoClasseView(ficha: $novaFicha.ficha)
                    } label: {
                        DisplayTextoBotao(titulo: "Classe do personagem", descricao: "Toque para selecionar...")
                    }
                    
                    CustomNavigationLink {
                        EmptyView()
                    } label: {
                        DisplayTextoBotao(titulo: "Antecedente", descricao: "Toque para selecionar...")
                    }
                    
                    MenuSelecaoTendencia(ficha: $novaFicha.ficha)
                    Spacer()
                }
                .tint(.black)
                .padding(.horizontal)
            }
            
            Button {
                
            } label: {
                Text("Próximo")
            }
            .buttonStyle(CustomButtonStyle3())
            .padding(.horizontal, 10)
        }
        
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                NavigationBarTitle("Criação de Personagem")
            }
        }
    }
}


struct CriacaoMain_Previews: PreviewProvider {
    static var previews: some View {
        CriacaoMain()
    }
}

struct CustomNavigationLink<Destination, Label>: View where Destination: View, Label: View {
    
    public var destination: () -> Destination
    public var label: () -> Label
    
    var body: some View {
        NavigationLink {
            destination()
        } label: {
            label()
        }
        .buttonStyle(CustomButtonStyle())
    }
}

struct DisplayTextoBotao: View {
    private var titulo: String
    private var descricao: String
    
    public init(titulo: String, descricao: String) {
        self.titulo = titulo
        self.descricao = descricao
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(titulo)
                .font(.system(size: 15, weight: .semibold, design: .default))
            Text(descricao)
                .font(.system(size: 13, weight: .regular, design: .default))
                .fixedSize(horizontal: false, vertical: true)
        }
        .foregroundColor(Color("BlackAndWhite"))
    }
}

struct MenuSelecaoTendencia: View {
    
    @Binding var ficha: PersonagemFicha
    @State private var showContent: Bool = false
    
    var body: some View {
        TemplateContentBackground {
            DisclosureGroup(isExpanded: $showContent) {
                VStack(spacing: 0) {
                    Divider()
                    ForEach(TipoTendencia.allCases, id: \.self) { tendencia in
                        if tendencia != .none {
                            TemplateRadioButton(isMarked: ficha.tendenciaPersonagem == tendencia ,title: tendencia.rawValue) {
                                ficha.tendenciaPersonagem = tendencia
                                withAnimation(.easeOut, {
                                    self.showContent.toggle()
                                })
                            }
                        }
                    }
                }
            } label: {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Tendência")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                    Text(ficha.tendenciaPersonagem == .none ? "Toque para selecionar..." : ficha.tendenciaPersonagem.rawValue)
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .buttonStyle(CustomButtonStyle2())
        }
    }
}

struct TemplateRadioButton: View {
    
    @State var isMarked: Bool = false
    let title: String
    var completion: () -> Void
    
    var body: some View {
        Button {
            self.isMarked.toggle()
            completion()
        } label: {
            HStack {
                Text(title)
                    .font(.system(size: 15, weight: .regular, design: .default))
                Spacer()
                Image(systemName: "circle.fill")
                    .renderingMode(.template)
                    .foregroundColor(isMarked ? Color("RedTheme") : Color(uiColor: .systemGray4))
            }
        }
        .buttonStyle(CustomButtonStyle2())
        .frame(height: 40)
    }
    
}


