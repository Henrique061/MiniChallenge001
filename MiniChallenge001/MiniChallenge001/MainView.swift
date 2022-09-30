//
//  MainView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 23/09/22.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject private var fichas = PersonagemViewModel()
    
    @State private var fichaSelecionada: PersonagemFicha?
    @State private var mostrarFicha: Bool = false
    
    var body: some View {
        NavigationView {
            TemplateTelaPadrao {
                List {
                    ForEach($fichas.listaFichas, id: \.id) { ficha in
                        Section {
                            Button {
                                fichaSelecionada = ficha.wrappedValue
                                mostrarFicha.toggle()
                            } label: {
                                LabelFicha(ficha: ficha)
                            }
                        } header: {
                            Text(ficha.wrappedValue.nome)
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color("BlackAndWhite"))
                                .padding(.leading, -20)
                                .padding(.bottom, 10)
                        }
                        
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button {
                                withAnimation(.easeOut) {
                                    fichas.delete(ficha: ficha.wrappedValue)
                                }
                            } label: {
                                Text("Delete")
                                    .foregroundColor(Color.white)
                            }.tint(Color("RedTheme"))
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            
            .fullScreenCover(isPresented: $mostrarFicha) {
                ContentView()
            }
            
            //            .onAppear {
            //                let template = PersonagemFicha()
            //                do { try template.id = JsonFileUtil.getNewIdForSheet() }
            //                catch {}
            //                template.nome = "Ficha Manhattan"
            //                template.nomePersonagem = "Manhattan The Great"
            //                template.classeFinal = ClasseFicha(classePersonagem: .monge)
            //                template.nivel = 18
            //                fichas.createNewFicha(ficha: template)
            //            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Fichas")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    NavigationLink {
                        CriacaoMain()
                    } label: {
                        HStack {
                            Text("Nova Ficha")
                            Image(systemName: "square.and.pencil")
                        }
                    }
                }
            }
        }
        .accentColor(Color("RedTheme"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct LabelFicha: View {
    @Binding var ficha: PersonagemFicha
    
    private var formatClasseNivel: String {
        return "\(ficha.classeFinal.classePersonagem.rawValue) \(ficha.nivel)"
    }
    
    private var fotoPersonagem: Image {
        if let data = ficha.fotoPersonagem, let foto = UIImage(data: data) {
            return Image(uiImage: foto)
        }
        return Image("IdentidadeIconOff")
    }
    
    var body: some View {
        HStack(spacing: 10) {
            fotoPersonagem
                .renderingMode(.template)
                .resizable()
                .foregroundColor(Color.white)
                .scaledToFill()
                .background(Color.black)
                .clipShape(Circle())
                .frame(width: 80, height: 80, alignment: .center)
            
            VStack(alignment: .leading) {
                DisplayTextoBotao(titulo: "Nome", descricao: ficha.nomePersonagem)
                Divider()
                DisplayTextoBotao(titulo: "Classe e Nível", descricao: formatClasseNivel)
            }
        }
        .padding(.leading, -10)
        .padding(.trailing, -20)
    }
}

struct TemplateBackgroundInfo<Content> : View where Content: View {
    
    @ViewBuilder private var content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color("ContentBackground"))
            content()
        }
        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
        .padding(.bottom, 10)
    }
}

struct TemplateTelaPadrao<Content> : View where Content: View {
    
    @ViewBuilder private var content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            Color("ScreenBackground")
                .ignoresSafeArea(.all)
            VStack(spacing: 0) {
                Divider()
                content()
                Divider()
            }
        }
        .frame(alignment: .top)
    }
}

struct TemplateContentBackground<Content>: View where Content: View{
    
    @ViewBuilder private var content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color("ContentBackground"))
            content()
        }
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
            .foregroundColor(Color("BlackAndWhite"))
            .background(configuration.isPressed ? Color(uiColor: .systemGray3) : Color("ContentBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 5 ))
    }
}

struct CustomButtonStyle2: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
            .foregroundColor(Color("BlackAndWhite"))
            .background(configuration.isPressed ? Color(uiColor: .systemGray3) : Color("ContentBackground"))
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
            .foregroundColor(Color("BlackAndWhite"))
            .background(Color("ContentBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 5 ))
    }
}
