//
//  EscolherRacaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 25/09/22.
//

import SwiftUI

class CriacaoRacaViewModel: ObservableObject {
    @Published var raca: RacaEscolha
    @Published var subraca: Subraca
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = 1
        formatter.alwaysShowsDecimalSeparator = false
        return formatter
    }
    
    init() {
        self.raca = RacaEscolha()
        self.subraca = Subraca(subraca: .none, tracos: [], atributoGanho: .init())
    }
    
    public func gerarRacaFinal() -> RacaFicha {
        return RacaFicha(racaPersonagem: raca.tipoRaca, subracaPersonagem: subraca.subraca, tracos: raca.tracos, tracosSubraca: subraca.tracosSubraca)
    }
    
    public func setRaca(tipoRaca: TipoRaca) {
        DispatchQueue.main.async {
            self.raca = RacaClient.orderRaca(tipoRaca)
            if self.raca.possuiSubRaca {
                self.subraca = self.raca.subRacas[0]
            } else {
                self.subraca = Subraca(subraca: .none, tracos: [], atributoGanho: .init())
            }
        }
    }
    
    public func getAtributos() -> String {
        var descricao = ""
        for i in self.raca.atributosGanhos {
            descricao += "+ \(i.pontosGanhos) \(i.atributo.rawValue) "
        }
        if self.subraca.subraca != .none {
            descricao += "+ \(subraca.atributoGanho.pontosGanhos) \(subraca.atributoGanho.atributo.rawValue) "
        }
        return descricao
    }
    
    public func getDeslocamento() -> String {
        if raca.deslocamentoSubraca.isEmpty {
            return "\(numberFormatter.string(from: NSNumber(value: raca.deslocamento)) ?? "ERROR") metros"
        }
        
        let conjunto = raca.deslocamentoSubraca.filter({$0.subraca == subraca.subraca})
        return "\(numberFormatter.string(from: NSNumber(value: conjunto[0].deslocamento)) ?? "ERROR") metros"
    }
    
    public func getIdiomas() -> String {
        var aux = ""
        for i in 0..<raca.idiomas.count {
            if i < raca.idiomas.count - 1 {
                aux += "\(raca.idiomas[i].idioma.rawValue), "
            } else {
                aux += "\(raca.idiomas[i].idioma.rawValue)"
            }
        }
        return aux
    }
    
    public func getTracos() -> [TraitJSON] {
        return raca.tracos + subraca.tracosSubraca
    }
}

struct EscolherRacaView: View {
    
    @Environment(\.dismiss) private var dismiss
    private var novaFicha: Binding<PersonagemFicha>
    @ObservedObject var vmraca: CriacaoRacaViewModel
    
    public init(novaFicha: Binding<PersonagemFicha>) {
        self.novaFicha = novaFicha
        self.vmraca = CriacaoRacaViewModel()
    }
    
    var body: some View {
        TemplateTelaPadrao {
            ScrollView {
                VStack(spacing: 10) {
                    MenuEscolhaRaca().environmentObject(vmraca)
                    
                    MenuEscolhaSubraca().environmentObject(vmraca)
                    
                    AtributosRacaView().environmentObject(vmraca)
                    
                    DeslocamentoRacaView().environmentObject(vmraca)
                    
                    IdiomaRacaView().environmentObject(vmraca)
                    
                    BotaoMostrarTracosRaca().environmentObject(vmraca)
                    Spacer()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            
            Button {
                dismiss()
            } label: {
                Text("Salvar")
            }
            .buttonStyle(CustomButtonStyle3())
            .disabled(vmraca.raca.tipoRaca == .none)
            .padding(.horizontal, 10)
        }
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                NavigationBarTitle("Raça do Personagem")
            }
        }
    }
}

struct MenuEscolhaRaca: View {
    
    @EnvironmentObject var vmraca: CriacaoRacaViewModel
    @State private var showContent: Bool = false
    
    var body: some View {
        TemplateContentBackground {
            DisclosureGroup(isExpanded: $showContent) {
                VStack(spacing: 0) {
                    ForEach(TipoRaca.allCases, id: \.self) { raca in
                        if !(raca == .none) {
                            TemplateRadioButton(isMarked: vmraca.raca.tipoRaca == raca, title: raca.rawValue) {
                                withAnimation(.easeOut) {
                                    self.showContent.toggle()
                                    vmraca.setRaca(tipoRaca: raca)
                                }
                            }
                        }
                    }
                }
            } label: {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Raça do personagem")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                    Text(vmraca.raca.tipoRaca == .none ? "Toque para selecionar..." : vmraca.raca.tipoRaca.rawValue)
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }.buttonStyle(CustomButtonStyle2())
        }
    }
}

struct MenuEscolhaSubraca: View {
    
    @EnvironmentObject var vmraca: CriacaoRacaViewModel
    @State private var showContent: Bool = false
    
    var body: some View {
        if vmraca.raca.possuiSubRaca {
            TemplateContentBackground {
                DisclosureGroup(isExpanded: $showContent) {
                    VStack(spacing: 0) {
                        ForEach(vmraca.raca.subRacas, id: \.self) { subraca in
                            TemplateRadioButton(isMarked: vmraca.subraca.subraca == subraca.subraca, title: subraca.subraca.rawValue) {
                                withAnimation(.easeOut) {
                                    vmraca.subraca = subraca
                                    showContent.toggle()
                                }
                            }
                        }
                    }
                } label: {
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Sub-Raça do personagem")
                            .font(.system(size: 15, weight: .semibold, design: .default))
                        Text(vmraca.subraca.subraca == .none ? "Toque para selecionar..." : vmraca.subraca.subraca.rawValue)
                            .font(.system(size: 13, weight: .regular, design: .default))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }.buttonStyle(CustomButtonStyle2())
            }
        }
    }
}

struct AtributosRacaView: View {
    
    @EnvironmentObject var vmraca: CriacaoRacaViewModel
    
    var body: some View {
        if vmraca.raca.tipoRaca != .none  {
            TemplateContentBackground {
                DisplayTextoBotao(titulo: "Bônus de Atributos", descricao: vmraca.getAtributos())
                    .padding(10)
            }
        }
    }
}

struct DeslocamentoRacaView: View {
    
    @EnvironmentObject var vmraca: CriacaoRacaViewModel
    
    var body: some View {
        if vmraca.raca.tipoRaca != .none {
            TemplateContentBackground {
                DisplayTextoBotao(titulo: "Deslocamento", descricao: vmraca.getDeslocamento())
                    .padding(10)
            }
        }
    }
}

struct IdiomaRacaView: View {
    @EnvironmentObject var vmraca: CriacaoRacaViewModel
    
    var body: some View {
        if vmraca.raca.tipoRaca != .none {
            TemplateContentBackground {
                DisplayTextoBotao(titulo: "Idiomas", descricao: vmraca.getIdiomas())
                    .padding(10)
            }
        }
    }
}

struct BotaoMostrarTracosRaca: View {
    
    @EnvironmentObject var vmraca: CriacaoRacaViewModel
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        if vmraca.raca.tipoRaca != .none {
            Button {
                showSheet.toggle()
            } label: {
                DisplayTextoBotao(titulo: "Traços Raciais", descricao: "Toque para detalhes...")
            }.buttonStyle(CustomButtonStyle())
            
                .sheet(isPresented: $showSheet) {
                    DetalhesTracoView().environmentObject(vmraca)
                }
        }
    }
}
