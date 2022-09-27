//
//  MainView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 23/09/22.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject private var fichas = PersonagemViewModel()
    
    @State private var mostrarFicha: Bool = false
    @State private var fichaSelecionada: PersonagemFicha?
    
    var body: some View {
        NavigationView {
            TelaPadrao {
                List {
                    ForEach($fichas.listaFichas, id: \.nome) { ficha in
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
                }
                .listStyle(.grouped)
            }
            
            .fullScreenCover(isPresented: $mostrarFicha) {
                ContentView()
            }
            
            
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
    private var classe: ClassePersonagem {
        if let classe = ficha.classeFinal?.classePersonagem {
            return classe
        }
        return .patrulheiro
    }
    private var nivel: Int
    
    private var formatClasseNivel: String {
        return "\(classe.rawValue) \(nivel)"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            DisplayTextoBotao(titulo: "Nome", descricao: ficha.nome)
            Divider()
            DisplayTextoBotao(titulo: "Classe e Nível", descricao: <#T##String#>)
            PadraoDisplayInformacao(titulo: .constant("Classe e Nível"), descricao: .constant(formatClasseNivel))
        }
    }
}

struct TesteFicha {
    var nome: String
    var classe: ClassePersonagem
    var nivel: Int
}

struct TemplateBackgroundInfo<Content:View>: View {
    
    var content: () -> Content
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color("ContentBackground"))
            content()
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: 35, alignment: .leading)
        .padding(.bottom, 10)
    }
}
