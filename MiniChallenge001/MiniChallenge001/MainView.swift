//
//  MainView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 23/09/22.
//

import SwiftUI

struct MainView: View {
    //
    
    @State var fichas: [TesteFicha] = [
        TesteFicha(nome: "Levesleves", classe: .mago, nivel: 5),
        TesteFicha(nome: "Henrique", classe: .clerigo, nivel: 8),
        TesteFicha(nome: "Thiago", classe: .bardo, nivel: 6)
    ]
    @State private var imagemPerfil: UIImage?
    @State private var mostrarFicha: Bool = false
    @State private var fichaSelecionada: TesteFicha?
    
    var body: some View {
        NavigationView {
            TelaPadrao {
                List {
                    ForEach($fichas, id: \.nome) { ficha in
                        Section {
                            Button {
                                fichaSelecionada = ficha.wrappedValue
                                mostrarFicha.toggle()
                            } label: {
                                LabelFicha(nome: ficha.nome, classe: ficha.classe, nivel: ficha.nivel)
                                    .tint(Color(uiColor: .black))
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
                            Text("Nova Fica")
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
    @Binding var nome: String
    @Binding var classe: ClassePersonagem
    @Binding var nivel: Int
    
    private var formatClasseNivel: String {
        return "\(classe.rawValue) \(nivel)"
    }
    
    var body: some View {
        HStack(alignment: .center) {
            ImagemPerfil(userImage: $imagemPerfil)
            VStack(alignment: .leading) {
                PadraoDisplayInformacao(titulo: .constant("Nome"), descricao: $nome)
                Divider()
                PadraoDisplayInformacao(titulo: .constant("Classe e Nível"), descricao: .constant(formatClasseNivel))
            }
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
                .foregroundColor(Color(uiColor: .white))
            content()
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: 35, alignment: .leading)
        .padding(.bottom, 10)
    }
}

struct ImagemPerfil: View {
    
    @Binding var userImage: UIImage?
    
    var body: some View {
        if let userImage = userImage {
            Image(uiImage: userImage)
        } else {
            ZStack {
                Color.black
                Image("IdentidadeIconOff")
                    .renderingMode(.template)
                    .foregroundColor(.white)
            }
            .clipShape(Circle())
        }
    }
}
