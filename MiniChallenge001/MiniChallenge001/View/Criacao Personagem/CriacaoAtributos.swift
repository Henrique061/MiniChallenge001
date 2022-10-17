//
//  CriacaoAtributos.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 10/10/22.
//

import SwiftUI

enum TipoDistribuicao {
    case livre
    case padrao
    case none
}

enum AtributoIdentifier: String, Codable, Hashable, CaseIterable {
    case carisma = "Carisma"
    case constituicao = "Constituição"
    case destreza = "Destreza"
    case forca = "Força"
    case inteligencia = "Inteligência"
    case sabedoria = "Sabedoria"
    case none
}

struct CriacaoAtributos: View {
    
    @StateObject private var vmatributo: ViewModelAtributo
    @ObservedObject private var vmficha: NovaFichaViewModel
    @Binding private var popToRoot: Bool
    @State private var tipoDistribuicao: TipoDistribuicao
    @State private var selectedAtributo: Atributo
    
    public init(vmficha: NovaFichaViewModel, popToRoot: Binding<Bool>) {
        self._vmatributo = StateObject(wrappedValue: ViewModelAtributo(vmficha: vmficha))
        self.vmficha = vmficha
        self._popToRoot = popToRoot
        self.tipoDistribuicao = .livre
        self.selectedAtributo = Atributo(nome: .none, valor: 0)
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    Text("Os atributos de um personagem são muitos importantes. Distribua-os com sabedoria...")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                    
                    SelecaoDistribuirAtributo(tipoDistribuicao: $tipoDistribuicao, selectedAtributo: $selectedAtributo)
                    
                    if tipoDistribuicao == .livre {
                        ListaSelecaoLivreAtributos(selectedAtributo: $selectedAtributo, atributos: $vmatributo.atributos)
                    }
                    
                    if selectedAtributo.nome != .none {
                        LivreEditAtributo(atributo: $selectedAtributo) { value in
                            vmatributo.updateAtributoValor(value: value, name: selectedAtributo.nome)
                            selectedAtributo.valor += value
                        }
                    }
                    
                    Spacer()
                }
                
                Button("Criar Personagem") {
                    DispatchQueue.main.async {
                        self.vmficha.ficha.pontosAtributos.carisma = self.vmatributo.atributos[0].valor
                        self.vmficha.ficha.pontosAtributos.constituicao = self.vmatributo.atributos[1].valor
                        self.vmficha.ficha.pontosAtributos.destreza = self.vmatributo.atributos[2].valor
                        self.vmficha.ficha.pontosAtributos.forca = self.vmatributo.atributos[3].valor
                        self.vmficha.ficha.pontosAtributos.inteligencia = self.vmatributo.atributos[4].valor
                        self.vmficha.ficha.pontosAtributos.sabedoria = self.vmatributo.atributos[5].valor
                        
                        do {
                            vmficha.ficha.id = try JsonFileUtil.getNewIdForSheet()
                            try JsonFileUtil.write(content: vmficha.ficha)
                        } catch {
                            print("UNABLE TO CREATE A NEW ID TO SHEET: \(error.localizedDescription)")
                        }
                        self.popToRoot.toggle()
                    }
                }
                .buttonStyle(CustomButtonStyle5())
                
            }
            .padding(.horizontal, 10)
            
            .navigationTitle("Pontos de Atributos")
        }
    }
}

struct SelecaoDistribuirAtributo: View {
    
    @Binding private var tipoDistribuicao: TipoDistribuicao
    @Binding private var selectedAtributo: Atributo
    
    public init(tipoDistribuicao: Binding<TipoDistribuicao>, selectedAtributo: Binding<Atributo>) {
        self._tipoDistribuicao = tipoDistribuicao
        self._selectedAtributo = selectedAtributo
    }
    
    var body: some View {
        TemplateContentBackground {
            VStack(alignment: .leading, spacing: 10) {
                Text("Distribuição dos Pontos de Atributo")
                    .font(.system(size: 15, weight: .bold, design: .default))
                    .scaledToFill()
                
                Divider()
                    .padding(.horizontal, -10)
                
                HStack(alignment: .center, spacing: 20) {
                    //                    Button("Padrão") {
                    //                        withAnimation {
                    //                            self.tipoDistribuicao = .padrao
                    //                            self.selectedAtributo = Atributo(nome: .none, valor: 0)
                    //                        }
                    //                    }
                    //                    .buttonStyle(CustomButtonStyle4())
                    //                    .opacity(tipoDistribuicao == .padrao ? 1 : 0.4)
                    
                    Button("Livre") {
                        withAnimation {
                            //                            self.tipoDistribuicao = .livre
                            //                            self.selectedAtributo = Atributo(nome: .none, valor: 0)
                        }
                    }
                    .buttonStyle(CustomButtonStyle4())
                    .disabled(true) // remover mais para frente
                }
            }
            .padding(10)
        }
    }
}

struct ListaSelecaoLivreAtributos: View {
    
    @Binding private var selectedAtributo: Atributo
    @Binding private var atributos: Array<Atributo>
    
    public init(selectedAtributo: Binding<Atributo>, atributos: Binding<Array<Atributo>>) {
        self._selectedAtributo = selectedAtributo
        self._atributos = atributos
    }
    
    var body: some View {
        TemplateContentBackground {
            VStack(spacing: 0) {
                ForEach(atributos, id: \.nome) { atributo in
                    TemplateRadioButtonWithIdentifier(selectedID: $selectedAtributo, id: atributo) {
                        
                    } content: {
                        DisplayTextoBotao(titulo: "\(atributo.nome.rawValue) \(atributo.modificador < 0 ? "" : "+")\(atributo.modificador)", descricao: "\(atributo.valor)")
                    }.frame(height: 50)
                }
            }
        }
    }
}

struct LivreEditAtributo: View {
    
    @Binding private var atributo: Atributo
    private var completion: (_ value: Int) -> Void
    
    public init(atributo: Binding<Atributo>, completion: @escaping (_ value: Int) -> Void) {
        self._atributo = atributo
        self.completion = completion
    }
    
    var body: some View {
        TemplateContentBackground {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(atributo.nome.rawValue)")
                    .font(.system(size: 15, weight: .bold, design: .default))
                Divider().padding(.horizontal, -10)
                
                HStack {
                    Button("-1") { completion(-1) }
                        .buttonStyle(CustomButtonStyle4())
                        .frame(width: 90)
                    Spacer()
                    Text("\(atributo.valor)")
                        .font(.system(size: 18, weight: .bold, design: .default))
                    Spacer()
                    Button("+1") { completion(+1) }
                        .buttonStyle(CustomButtonStyle4())
                        .frame(width: 90)
                }
            }
            .padding(10)
        }
    }
}

struct Atributo: Hashable {
    
    public var nome: AtributosSalvaguarda
    public var valor: Int
    public var modificador: Int {
        let mod = (Float(self.valor) - 10.0) / 2
        return mod > 0 ? Int(mod) : Int(round(mod))
    }
    
}

private class ViewModelAtributo: ObservableObject {
    
    @Published public var atributos: Array<Atributo>
    
    public init() {
        self.atributos = [Atributo(nome: .carisma, valor: 0),
                          Atributo(nome: .constituicao, valor: 0),
                          Atributo(nome: .destreza, valor: 0),
                          Atributo(nome: .forca, valor: 0),
                          Atributo(nome: .inteligencia, valor: 0),
                          Atributo(nome: .sabedoria, valor: 0)]
    }
    
    public init(vmficha: NovaFichaViewModel) {
        self.atributos = [Atributo(nome: .carisma, valor: 0),
                          Atributo(nome: .constituicao, valor: 0),
                          Atributo(nome: .destreza, valor: 0),
                          Atributo(nome: .forca, valor: 0),
                          Atributo(nome: .inteligencia, valor: 0),
                          Atributo(nome: .sabedoria, valor: 0)]
        
        for i in 0..<self.atributos.count {
            atributos[i].valor = vmficha.racaFinal.atributosAdicionais.filter({$0.atributo == atributos[i].nome}).first?.pontosGanhos ?? 0
        }
    }
    
    public func updateAtributoValor(value: Int, name: AtributosSalvaguarda) {
        DispatchQueue.main.async {
            for i in 0..<self.atributos.count {
                if self.atributos[i].nome == name {
                    self.atributos[i].valor += value
                    return
                }
            }
        }
    }
}
