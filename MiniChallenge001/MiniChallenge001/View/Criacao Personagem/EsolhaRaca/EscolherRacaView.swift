//
//  EscolherRacaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 25/09/22.
//

import SwiftUI

struct EscolherRacaView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var racaEscolha: RacaEscolha? = nil
    @State private var subRacaEscolha: Subraca? = nil
    private var completion: (_ raca: RacaEscolha, _ subraca: Subraca?) -> Void
    
    public init(completion: @escaping (_ raca: RacaEscolha, _ subraca: Subraca?) -> Void) {
        self.completion = completion
    }
    
    var body: some View {
        VStack {
            TelaPadrao {
                VStack(spacing: 10) {
                    MenuEscolhaRaca(racaEscolha: $racaEscolha, subRacaEscolha: $subRacaEscolha)
                        .padding(.top, 10)
                    MenuEscolhaSubraca(racaEscolha: $racaEscolha, escolhaSubraca: $subRacaEscolha)
                    AtributosRacaView(racaEscolha: $racaEscolha, subRacaEscolha: $subRacaEscolha)
                    DeslocamentoRacaView(racaEscolha: $racaEscolha, subRacaEscolha: $subRacaEscolha)
                    IdiomaRacaView(racaEscolha: $racaEscolha, subRacaEscolha: $subRacaEscolha)
                    BotaoMostrarTracosRaca(racaEscolha: $racaEscolha, subRacaEscolha: $subRacaEscolha)
                    Spacer()
                    Button {
                        completion(racaEscolha!, subRacaEscolha)
                        dismiss()
                    } label: {
                        Text("Salvar")
                    }.disabled(racaEscolha == nil)
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
    
    @Binding var racaEscolha: RacaEscolha?
    @Binding var subRacaEscolha: Subraca?
    
    var body: some View {
        Menu {
            ForEach(TipoRaca.allCases, id:\.self) { raca in
                Button(raca.rawValue) {
                    DispatchQueue.main.async {
                        self.racaEscolha = RacaClient.orderRaca(raca)
                        if let subracas = racaEscolha?.subRacas {
                            self.subRacaEscolha = subracas[0]
                        } else {
                            self.subRacaEscolha = nil
                        }
                    }
                }
            }
        } label: {
            TemplateBackgroundInfo {
                DisplayTextoBotao(titulo: "Raça", descricao: racaEscolha?.tipoRaca?.rawValue ?? "Toque para escolher...")
            }
        }
    }
}

struct MenuEscolhaSubraca: View {
    
    @Binding var racaEscolha: RacaEscolha?
    @Binding var escolhaSubraca: Subraca?
    
    var body: some View {
        if let subracas = racaEscolha?.subRacas {
            Menu {
                ForEach(subracas, id: \.self) { subraca in
                    Button(subraca.subracaNome) {
                        escolhaSubraca = subraca
                    }
                }
            } label: {
                TemplateBackgroundInfo {
                    DisplayTextoBotao(titulo: "Sub-Raça do Personagem", descricao: escolhaSubraca?.subracaNome ?? "Toque para selecionar...")
                }
            }
        } else {
            Text("Não possui sub-raça").hidden()
        }
    }
}

struct AtributosRacaView: View {
    
    @Binding var racaEscolha: RacaEscolha?
    @Binding var subRacaEscolha: Subraca?
    
    private var descricaoAtributos: String {
        var descricao = ""
        if let raca = racaEscolha {
            for i in raca.atributosGanhos! {
                descricao += "+ \(i.pontosGanhos) \(i.atributo.rawValue) "
            }
        }
        if let subRacaEscolha = subRacaEscolha {
            descricao += "+ \(subRacaEscolha.atributoGanho.pontosGanhos) \(subRacaEscolha.atributoGanho.atributo.rawValue) "
        }
        return descricao
    }
    
    var body: some View {
        if let _ = racaEscolha {
            TemplateBackgroundInfo {
                DisplayTextoBotao(titulo: "Bônus de Atributos",
                                  descricao: descricaoAtributos)
            }
        }
    }
}

struct DeslocamentoRacaView: View {
    
    @Binding var racaEscolha: RacaEscolha?
    @Binding var subRacaEscolha: Subraca?
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = 1
        formatter.alwaysShowsDecimalSeparator = false
        return formatter
    }
    
    private var deslocamentoFinal: String {
        if let raca = racaEscolha, let deslocamento = raca.deslocamento {
            let aux = NSNumber(value: deslocamento)
            return "\(numberFormatter.string(from: aux) ?? "<<ERROR>>") metros"
        }
        
        if let raca = racaEscolha, let deslocamentos = raca.deslocamentoSubraca {
            var aux: Float = 0.0
            
            for i in deslocamentos {
                aux = i.subraca == subRacaEscolha?.subraca ? i.deslocamento : aux
            }
            return "\(numberFormatter.string(from: NSNumber(value: aux)) ?? "<<ERROR>>") metros"
        }
        
        return "NULL"
    }
    
    
    
    var body: some View {
        if let _ = racaEscolha {
            TemplateBackgroundInfo {
                DisplayTextoBotao(titulo: "Deslocamento", descricao: deslocamentoFinal)
            }
        }
    }
    
}

struct IdiomaRacaView: View {
    @Binding var racaEscolha: RacaEscolha?
    @Binding var subRacaEscolha: Subraca?
    
    private var idiomasFinal: String {
        var aux = ""
        if let idiomas = racaEscolha?.idiomas {
            for i in 0..<idiomas.count {
                if i < idiomas.count - 1 {
                    aux += "\(idiomas[i].idioma.rawValue), "
                } else {
                    aux += "\(idiomas[i].idioma.rawValue)"
                }
            }
            return aux
        }
        
        return "NULL"
    }
    
    var body: some View {
        if let _ = racaEscolha {
            TemplateBackgroundInfo {
                DisplayTextoBotao(titulo: "Idiomas", descricao: idiomasFinal)
            }
        }
    }
}

struct BotaoMostrarTracosRaca: View {
    
    @Binding var racaEscolha: RacaEscolha?
    @Binding var subRacaEscolha: Subraca?
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        if let _ = racaEscolha {
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
        } else {
            Text("Qualquer coisa").hidden()
        }
    }
}
