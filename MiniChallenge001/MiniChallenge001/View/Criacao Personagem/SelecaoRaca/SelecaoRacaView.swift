//
//  EscolherRacaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 25/09/22.
//

import SwiftUI

class CriacaoRacaViewModel: ObservableObject {
    @Published public var raca: RacaEscolha
    @Published public var subraca: Subraca
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = 1
        formatter.alwaysShowsDecimalSeparator = false
        return formatter
    }
    
    public init() {
        self.raca = RacaEscolha()
        self.subraca = Subraca(subraca: .none, tracos: [], atributoGanho: .init())
    }
    
    public init(ficha: PersonagemFicha) {
        self.raca = RacaClient.orderRaca(ficha.racaFinal.racaPersonagem)
        self.subraca = Subraca(subraca: .none, tracos: [], atributoGanho: .init())
        if self.raca.possuiSubRaca {
            self.subraca = self.raca.subRacas.filter({$0.subraca == ficha.racaFinal.subracaPersonagem})[0]
        }
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

struct SelecaoRacaView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var vmficha: NovaFichaViewModel
    @StateObject private var vmraca: CriacaoRacaViewModel
    
    public init(ficha: PersonagemFicha) {
        self._vmraca = StateObject(wrappedValue: CriacaoRacaViewModel(ficha: ficha))
    }
    
    var body: some View {
        TemplateTelaPadrao {
            ScrollView {
                VStack(spacing: 10) {
                    RacaPickView().environmentObject(vmraca)
                    SubracaPickView().environmentObject(vmraca)
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
                self.vmficha.setRaca(raca: vmraca.gerarRacaFinal())
                dismiss()
            } label: {
                Text("Salvar")
            }
            .buttonStyle(CustomButtonStyle5())
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

private struct RacaPickView: View {
    
    @EnvironmentObject private var vmraca: CriacaoRacaViewModel
    @State private var showContent: Bool = false
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $showContent) {
            ForEach(TipoRaca.allCases, id: \.self) { raca in
                if !(raca == .none) {
                    TemplateRadioButton(isMarked: vmraca.raca.tipoRaca == raca, title: raca.rawValue) {
                        withAnimation(.easeOut) {
                            vmraca.setRaca(tipoRaca: raca)
                            self.showContent.toggle()
                        }
                    }
                }
            }
        } header: {
            DisplayTextoBotaoCondicao(titulo: "Raça", descricaoTrue: "Toque para selecionar...", descricaoFalse: vmraca.raca.tipoRaca.rawValue, condicao: vmraca.raca.tipoRaca == .none)
        }
    }
}

private struct SubracaPickView: View {
    
    @EnvironmentObject private var vmraca: CriacaoRacaViewModel
    @State private var showContent: Bool = false
    
    var body: some View {
        if vmraca.raca.possuiSubRaca {
            TemplateCustomDisclosureGroup(isExpanded: $showContent) {
                ForEach(vmraca.raca.subRacas, id: \.self) { subraca in
                    TemplateRadioButton(isMarked: vmraca.subraca.subraca == subraca.subraca, title: subraca.subraca.rawValue) {
                        withAnimation(.easeOut) {
                            vmraca.subraca = subraca
                            showContent.toggle()
                        }
                    }
                }
            } header: {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Sub-Raça do personagem")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                    Text(vmraca.subraca.subraca == .none ? "Toque para selecionar..." : vmraca.subraca.subraca.rawValue)
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }
}

private struct AtributosRacaView: View {
    
    @EnvironmentObject private var vmraca: CriacaoRacaViewModel
    
    var body: some View {
        if vmraca.raca.tipoRaca != .none  {
            TemplateContentBackground {
                DisplayTextoBotao(titulo: "Bônus de Atributos", descricao: vmraca.getAtributos())
                    .padding(10)
            }
        }
    }
}

private struct DeslocamentoRacaView: View {
    
    @EnvironmentObject private var vmraca: CriacaoRacaViewModel
    
    var body: some View {
        if vmraca.raca.tipoRaca != .none {
            TemplateContentBackground {
                DisplayTextoBotao(titulo: "Deslocamento", descricao: vmraca.getDeslocamento())
                    .padding(10)
            }
        }
    }
}

private struct IdiomaRacaView: View {
    @EnvironmentObject private var vmraca: CriacaoRacaViewModel
    
    var body: some View {
        if vmraca.raca.tipoRaca != .none {
            TemplateContentBackground {
                DisplayTextoBotao(titulo: "Idiomas", descricao: vmraca.getIdiomas())
                    .padding(10)
            }
        }
    }
}

private struct BotaoMostrarTracosRaca: View {
    
    @EnvironmentObject private var vmraca: CriacaoRacaViewModel
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
