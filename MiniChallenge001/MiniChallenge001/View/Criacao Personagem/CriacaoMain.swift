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
    
    @ViewBuilder private var label: () -> Label
    private var destination: () -> Destination
    
    public init(destination: @escaping () -> Destination, @ViewBuilder label: @escaping () -> Label) {
        self.label = label
        self.destination = destination
    }
    
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
    
    @Binding private var ficha: PersonagemFicha
    @State private var showContent: Bool
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
        self.showContent = false
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $showContent) {
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
        } header: {
            VStack(alignment: .leading, spacing: 3) {
                Text("Tendência")
                    .font(.system(size: 15, weight: .semibold, design: .default))
                Text(ficha.tendenciaPersonagem == .none ? "Toque para selecionar..." : ficha.tendenciaPersonagem.rawValue)
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct TemplateRadioButton: View {
    
    @State private var isMarked: Bool
    private let title: String
    private var completion: () -> Void
    
    public init(isMarked: Bool = false, title: String, completion: @escaping () -> Void) {
        self.isMarked = isMarked
        self.title = title
        self.completion = completion
    }
    
    var body: some View {
        Button {
            self.isMarked.toggle()
            completion()
        } label: {
            HStack {
                Image(systemName: "circle.fill")
                    .renderingMode(.template)
                    .foregroundColor(isMarked ? Color("RedTheme") : Color(uiColor: .systemGray4))
                Text(title)
                    .font(.system(size: 15, weight: .regular, design: .default))
            }
        }
        .buttonStyle(CustomButtonStyle2())
        .frame(height: 40)
    }
    
}

struct TemplateCustomDisclosureGroup<Content, Header>: View where Content: View, Header: View {
    
    @Binding private var isExpanded: Bool
    @ViewBuilder private var content: () -> Content
    @ViewBuilder private var header: () -> Header
    
    
    public init(isExpanded: Binding<Bool>, @ViewBuilder content: @escaping () -> Content, @ViewBuilder header: @escaping () -> Header) {
        self._isExpanded = isExpanded
        self.content = content
        self.header = header
    }
    
    var body: some View {
        TemplateContentBackground {
            DisclosureGroup(isExpanded: $isExpanded) {
                VStack(spacing: 0) {
                    Divider()
                    content()
                }
            } label: {
                header()
            }.buttonStyle(CustomButtonStyle2())
        }
    }
}
