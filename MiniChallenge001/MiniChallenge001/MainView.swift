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
                            Text("Nome da ficha")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        }
                    }
                    .onDelete(perform: fichas.delete)
                }
                .listStyle(.grouped)
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
//                template.classeFinal = ClasseFinal(classePersonagem: .monge)
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
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .foregroundColor(Color.black)
                Image("IdentidadeIconOff")
                    .renderingMode(.template)
                    .foregroundColor(Color.white)
            }
                
            VStack(alignment: .leading) {
                DisplayTextoBotao(titulo: "Nome", descricao: ficha.nome)
                Divider()
                DisplayTextoBotao(titulo: "Classe e Nível", descricao: formatClasseNivel)
            }
        }
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
                .padding(.horizontal)
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
            VStack() {
                Divider()
                content()
                Divider()
            }
        }
        .frame(alignment: .top)
    }
    
}
