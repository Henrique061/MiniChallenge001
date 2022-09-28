//
//  CriacaoMain.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 24/09/22.
//

import SwiftUI

struct CriacaoMain: View {
    
    @State private var novaFicha: PersonagemFicha
    
    public init() {
        novaFicha = PersonagemFicha()
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack() {
                Text("Para começarmos, preencha abaixo os dados de seu peronsagem")
                
                TemplateBackgroundInfo {
                    TextField("Nome da ficha", text: $novaFicha.nome)
                }.padding(.bottom, -5)
                
                TemplateBackgroundInfo {
                    TextField("Nome do personagem", text: $novaFicha.nomePersonagem)
                }
                
                NavigationLink {
                    EscolherRacaView(novaFicha: $novaFicha)
                } label: {
                    TemplateBackgroundInfo {
                        DisplayTextoBotao(titulo: "Raça do personagem", descricao: novaFicha.racaFinal?.racaPersonagem.rawValue ?? "Toque para selecionar...")
                    }
                }
                .padding(.bottom, 8)
                
                
                NavigationLink {
                    
                } label: {
                    TemplateBackgroundInfo {
                        DisplayTextoBotao(titulo: "Classe do personagem", descricao: "Toque para selecionar...")
                    }
                }.padding(.bottom, 8)
                
                NavigationLink {
                    
                } label: {
                    TemplateBackgroundInfo {
                        DisplayTextoBotao(titulo: "Antecedente", descricao: "Toque para selecionar...")
                    }
                }.padding(.bottom, 8)
                
                MenuSelecaoTendencia(selectedItem: $novaFicha.tendenciaPersonagem)
                Spacer()
                Button {
                    
                } label: {
                    TemplateBotaoConfirmacao("Próximo")
                }
            }
            .tint(.black)
            .padding(.horizontal)
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

struct TemplateBotaoConfirmacao: View {
    private var titulo: String
    
    init(_ titulo: String) {
        self.titulo = titulo
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
            Text(titulo)
                .padding()
                .foregroundColor(.white)
        }
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 10, maxHeight: 40, alignment: .center)
        .padding()
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
        .padding(.vertical, 7)
    }
}

struct MenuSelecaoTendencia: View {
    
    private var selectedItem: Binding<TipoTendencia?>
    
    init(selectedItem: Binding<TipoTendencia?>) {
        self.selectedItem = selectedItem
    }
    
    var body: some View {
        Menu {
            ForEach(TipoTendencia.allCases, id:\.self) { tendencia in
                Button(tendencia.rawValue) {
                    selectedItem.wrappedValue = tendencia
                }
            }
        } label: {
            TemplateBackgroundInfo {
                DisplayTextoBotao(titulo: "Tendência", descricao: selectedItem.wrappedValue?.rawValue ?? "Toque para selecionar...")
            }
        }
    }
}
