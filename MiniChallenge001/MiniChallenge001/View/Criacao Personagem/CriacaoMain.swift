//
//  CriacaoMain.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 24/09/22.
//

import SwiftUI

struct CriacaoMain: View {
    @State private var nomeFicha: String = ""
    @State private var nomePersonagem: String = ""
    @State private var selectedTendencia: TipoTendencia? = nil
    
    var body: some View {
        TelaPadrao {
            VStack() {
                Text("Para começarmos, preencha abaixo os dados de seu peronsagem")
                
                TemplateBackgroundInfo {
                    TextField("Nome da ficha", text: $nomeFicha)
                }.padding(.bottom, -5)
                
                TemplateBackgroundInfo {
                    TextField("Nome do personagem", text: $nomePersonagem)
                }
                
                NavigationLink {
                    EscolherRacaView()
                } label: {
                    TemplateBackgroundInfo {
                        DisplayTextoBotao(titulo: "Raça do personagem", descricao: "Toque para selecionar...")
                    }
                }.padding(.bottom, 8)
                
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
                
                PickerTendencia(selectedTendencia: $selectedTendencia)

                
                Spacer()
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        Text("Próximo")
                            .padding()
                            .foregroundColor(.white)
                    }
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 10, maxHeight: 40, alignment: .center)
                    .padding()
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
        }
        .padding(.vertical, 7)
    }
}

struct PickerTendencia: View {
    
    private var selectedTendencia: Binding<TipoTendencia?>
    @State private var options: [(TipoTendencia, Bool)]
    
    public init(selectedTendencia: Binding<TipoTendencia?>) {
        self.selectedTendencia = selectedTendencia
        var aux: [(TipoTendencia, Bool)] = []
        for i in TipoTendencia.allCases {
            aux.append((i, false))
        }
        options = aux
    }
    
    var body: some View {
        Menu {
            ForEach($options, id: \.0) { option in
                Button {
                    self.selectedTendencia.wrappedValue = option.wrappedValue.0
                } label: {
                    PickerTendenciaCell(title: option.wrappedValue.0.rawValue, isSelected: option.1)
                }
            }
        } label: {
            TemplateBackgroundInfo {
                HStack {
                    DisplayTextoBotao(titulo: "Tendência", descricao: selectedTendencia.wrappedValue?.rawValue ?? "Toque para selecionar...")
                    Spacer()
                    Image(systemName: "chevron.down")
                }
            }
        }.buttonStyle(.borderless)
    }
    
    func setSelectedItem(_ item: TipoTendencia) {
        self.selectedTendencia.wrappedValue = item
        for i in 0..<self.options.count {
            options[i].1 = options[i].0 == self.selectedTendencia.wrappedValue
        }
    }
}

struct PickerTendenciaCell: View {
    
    private var title: String
    private var isSelected: Binding<Bool>
    
    public init(title: String, isSelected: Binding<Bool>) {
        self.title = title
        self.isSelected = isSelected
    }
    
    var body: some View {
        HStack(alignment: .center) {
//            Image(systemName: "circle.fill")
//                .renderingMode(.template)
//                .foregroundColor(isSelected.wrappedValue ? Color("RedTheme") : Color(uiColor: .systemGray4))
            Text(title)
        }
    }
}
