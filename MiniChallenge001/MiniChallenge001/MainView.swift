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
            
            .onAppear {
                let caracteristicas = BuscaJson.buscaCaracteristicasPorClasse(classe: .bardo)
                let subcaracteristicas = BuscaJson.buscaCaracteristicasPorSubclasse(subclasse: .BD_colegioConhecimento)
                let tracos = BuscaJson.buscaTracosPorRaca(raca: .gnomo)
                let subtracos = BuscaJson.buscaTracosPorSubraca(subraca: .gnomoFloresta)
                
                let template = PersonagemFicha()
                template.id = 1
                template.nome = "Ficha Teste"
                template.nivel = 1
                template.experiencica = 0
                template.classeFinal = ClasseFinal(classePersonagem: .bardo, caracteristicasPersonagem: ["Tocador de violão"], subclassesPersonagem: [.init(subclase: .BD_colegioConhecimento, caracteristicas: caracteristicas + subcaracteristicas)], espacosDeMagia: [EspacosDeMagias(nivelPersonagem: 1, niveisCirculo: .init(nivelCirculo: [1], limiteUsoMagia: [10]))], pontosEspecificosNumerico: nil, pontosEspecificosTexto: nil)
                template.racaFinal = RacaFinal(racaPersonagem: .gnomo, subracaPersonagem: TipoSubRaca.gnomoFloresta, tracos: tracos, tracosSubraca: subtracos)
                template.antecedenteFinal = .criminoso
                template.magias = BuscaJson.buscaMagiaPorClasse(classe: .bardo)
                print(JsonFileUtil.DOCUMENTS_PATH.path)
                fichas.createNewFicha(ficha: template)
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
    
    private var nivel: Int {
        return ficha.nivel
    }
    
    private var formatClasseNivel: String {
        return "\(classe.rawValue) \(nivel)"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            DisplayTextoBotao(titulo: "Nome", descricao: ficha.nome)
            Divider()
            DisplayTextoBotao(titulo: "Classe e Nível", descricao: formatClasseNivel)
        }
    }
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
        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
        .padding(.bottom, 10)
    }
}

struct TemplateTelaPadrao<Content: View>: View {
    
    var content: () -> Content
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea(.all)
            VStack() {
                Divider()
                content()
            }
        }
        .frame(alignment: .top)
    }
    
}
