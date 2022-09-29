//
//  EscolherRacaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 25/09/22.
//

import SwiftUI

struct EscolherRacaView: View {
    
    @Environment(\.dismiss) private var dismiss
    private var novaFicha: Binding<PersonagemFicha>
    @State private var racaEscolha = RacaEscolha()
    @State private var subRacaEscolha = Subraca(subraca: .none, tracos: [], atributoGanho: .init())
    
    public init(novaFicha: Binding<PersonagemFicha>) {
        self.novaFicha = novaFicha
    }
    
    var body: some View {
        VStack {
            TemplateTelaPadrao {
                VStack(spacing: 10) {
                    MenuEscolhaRaca(racaEscolha: $racaEscolha, subRacaEscolha: $subRacaEscolha)
                    MenuEscolhaSubraca(racaEscolha: $racaEscolha, escolhaSubraca: $subRacaEscolha)
                    AtributosRacaView(racaEscolha: $racaEscolha, subRacaEscolha: $subRacaEscolha)
                    DeslocamentoRacaView(racaEscolha: $racaEscolha, subRacaEscolha: $subRacaEscolha)
                    IdiomaRacaView(racaEscolha: $racaEscolha, subRacaEscolha: $subRacaEscolha)
                    BotaoMostrarTracosRaca(racaEscolha: $racaEscolha, subRacaEscolha: $subRacaEscolha)
                    Spacer()
                    Button {
                        novaFicha.wrappedValue.racaFinal = RacaFinalFactory.create(
                            raca: racaEscolha.tipoRaca,
                            subraca: subRacaEscolha.subraca,
                            tracosRaca: racaEscolha.tracos,
                            tracosSubraca: subRacaEscolha.tracosSubraca)
                        dismiss()
                    } label: {
                        TemplateBotaoConfirmacao("Salvar")
                    }
                    .disabled(racaEscolha.tipoRaca == .none)
                }
                .padding(.horizontal)
                .tint(.black)
            }
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("Raça do Personagem")
                }
            }
        }
    }
}

struct MenuEscolhaRaca: View {
    
    @Binding var racaEscolha: RacaEscolha
    @Binding var subRacaEscolha: Subraca
    
    var body: some View {
        Menu {
            ForEach(TipoRaca.allCases, id:\.self) { raca in
                Button(raca.rawValue) {
                    DispatchQueue.main.async {
                        self.racaEscolha = RacaClient.orderRaca(raca)
                        if !racaEscolha.subRacas.isEmpty {
                            self.subRacaEscolha = racaEscolha.subRacas[0]
                        } else {
                            self.subRacaEscolha = Subraca(subraca: .none, tracos: [], atributoGanho: .init())
                        }
                    }
                }
            }
        } label: {
            TemplateBackgroundInfo {
                DisplayTextoBotao(titulo: "Raça", descricao: racaEscolha.tipoRaca == .none ? "Toque para selecionar" : racaEscolha.tipoRaca.rawValue)
            }
        }
    }
}

struct MenuEscolhaSubraca: View {
    
    @Binding var racaEscolha: RacaEscolha
    @Binding var escolhaSubraca: Subraca
    
    var body: some View {
        if !racaEscolha.subRacas.isEmpty {
            Menu {
                ForEach(racaEscolha.subRacas, id: \.self) { subraca in
                    Button(subraca.subracaNome) {
                        escolhaSubraca = subraca
                    }
                }
            } label: {
                TemplateBackgroundInfo {
                    DisplayTextoBotao(titulo: "Sub-Raça do Personagem", descricao: escolhaSubraca.subraca == .none ? "Toque para selecionar..." : escolhaSubraca.subraca.rawValue)
                }
            }
        }
    }
}

struct AtributosRacaView: View {
    
    @Binding var racaEscolha: RacaEscolha
    @Binding var subRacaEscolha: Subraca
    
    private var descricaoAtributos: String {
        var descricao = ""
        for i in racaEscolha.atributosGanhos {
            descricao += "+ \(i.pontosGanhos) \(i.atributo.rawValue) "
        }
        if subRacaEscolha.subraca != .none {
            descricao += "+ \(subRacaEscolha.atributoGanho.pontosGanhos) \(subRacaEscolha.atributoGanho.atributo.rawValue) "
        }
        return descricao
    }
    
    var body: some View {
        if racaEscolha.tipoRaca != .none  {
            TemplateBackgroundInfo {
                DisplayTextoBotao(titulo: "Bônus de Atributos", descricao: descricaoAtributos)
            }
        }
    }
}

struct DeslocamentoRacaView: View {
    
    @Binding var racaEscolha: RacaEscolha
    @Binding var subRacaEscolha: Subraca
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = 1
        formatter.alwaysShowsDecimalSeparator = false
        return formatter
    }
    
    private var deslocamentoFinal: String {
        if racaEscolha.deslocamentoSubraca.isEmpty {
            return "\(numberFormatter.string(from: NSNumber(value: racaEscolha.deslocamento)) ?? "<<ERROR>>") metros"
        }
        
        let conjunto = racaEscolha.deslocamentoSubraca.filter({$0.subraca == subRacaEscolha.subraca})
        return "\(numberFormatter.string(from: NSNumber(value: conjunto[0].deslocamento)) ?? "<<ERROR>>") metros"
    }
    
    var body: some View {
        if racaEscolha.tipoRaca != .none {
            TemplateBackgroundInfo {
                DisplayTextoBotao(titulo: "Deslocamento", descricao: deslocamentoFinal)
            }
        }
    }
    
}

struct IdiomaRacaView: View {
    @Binding var racaEscolha: RacaEscolha
    @Binding var subRacaEscolha: Subraca
    
    private var idiomasFinal: String {
        var aux = ""
        for i in 0..<racaEscolha.idiomas.count {
            if i < racaEscolha.idiomas.count - 1 {
                aux += "\(racaEscolha.idiomas[i].idioma.rawValue), "
                } else {
                    aux += "\(racaEscolha.idiomas[i].idioma.rawValue)"
                }
            return aux
        }
        
        return "NULL"
    }
    
    var body: some View {
        if racaEscolha.tipoRaca != .none {
            TemplateBackgroundInfo {
                DisplayTextoBotao(titulo: "Idiomas", descricao: idiomasFinal)
            }
        }
    }
}

struct BotaoMostrarTracosRaca: View {
    
    @Binding var racaEscolha: RacaEscolha
    @Binding var subRacaEscolha: Subraca
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        if racaEscolha.tipoRaca != .none {
            Button {
                showSheet.toggle()
            } label: {
                TemplateBackgroundInfo {
                    DisplayTextoBotao(titulo: "Traços Raciais", descricao: "Toque para detalhes...")
                }
            }
            
            .sheet(isPresented: $showSheet) {
                DetalhesTracoView(racaEscolha: $racaEscolha, subRacaEscolha: $subRacaEscolha)
            }
        }
    }
}
