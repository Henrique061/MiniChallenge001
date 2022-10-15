//
//  CriacaoMain.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 24/09/22.
//

import SwiftUI

public class NovaFichaViewModel: ObservableObject {
    @Published var ficha: PersonagemFicha
    @Published var racaFinal: RacaFinal
    @Published var classeFinal: ClasseFinal
    @Published var antecedenteFinal: AntecedenteFinal
    
    public init() {
        self.ficha = PersonagemFicha()
        self.racaFinal = RacaFinal()
        self.classeFinal = ClasseFinal()
        self.antecedenteFinal = AntecedenteFinal()
    }
    
    public func setRaca(raca: RacaFicha) {
        DispatchQueue.main.async {
            self.ficha.racaFinal = raca
            self.objectWillChange.send()
        }
    }
    
    public func setClasse(classe: ClasseFicha, escolhas: ClasseEscolhasDefinidas) {
        DispatchQueue.main.async {
            self.ficha.classeFinal = classe
            self.adicionarOuro(quantidade: escolhas.escolhaRiqueza.quantidade)
            self.ficha.profPericias += escolhas.escolhaProfPericias
            self.ficha.profFerramentas += escolhas.escolhaProfFerramentas
            self.objectWillChange.send()
        }
    }
    
    public func setAntecedente(antecedente: AntecedentePersonagem) {
        DispatchQueue.main.async {
            self.ficha.antecedenteFinal = antecedente
            self.objectWillChange.send()
        }
    }
    
    public func setTendencia(tendencia: TipoTendencia) {
        DispatchQueue.main.async {
            self.ficha.tendenciaPersonagem = tendencia
            self.objectWillChange.send()
        }
    }
    
    private func adicionarOuro(quantidade: Int) {
        for i in 0..<self.ficha.carteira.count {
            if self.ficha.carteira[i].tipo == .ouro {
                self.ficha.carteira[i].quantidade += quantidade
            }
        }
    }
}

struct CriacaoMain: View {
    
    @StateObject private var novaFicha: NovaFichaViewModel = NovaFichaViewModel()
    @Binding private var popToRoot: Bool
    
    public init(popToRoot: Binding<Bool>) {
        self._popToRoot = popToRoot
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    Text("Para começarmos, preencha abaixo os dados de seu peronsagem")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                    
                    TextFieldCriacao(title: "Nome da ficha", text: $novaFicha.ficha.nome)
                    TextFieldCriacao(title: "Nome do personagem", text: $novaFicha.ficha.nomePersonagem)
                    
                    CustomNavigationLink {
                        SelecaoRacaView(vmficha: self.novaFicha)
                    } label: {
                        DisplayTextoBotaoCondicao(titulo: "Raça", descricaoTrue: "Toque para selecionar...", descricaoFalse: novaFicha.ficha.racaFinal.racaPersonagem.rawValue, condicao: novaFicha.ficha.racaFinal.racaPersonagem == .none)
                    }
                    
                    CustomNavigationLink {
                        SelecaoClasseView(ficha: novaFicha.ficha)
                            .environmentObject(novaFicha)
                    } label: {
                        DisplayTextoBotaoCondicao(titulo: "Classe", descricaoTrue: "Toque para selecionar...", descricaoFalse: novaFicha.ficha.classeFinal.classePersonagem.rawValue, condicao: novaFicha.ficha.classeFinal.classePersonagem == .none)
                    }
                    
                    CustomNavigationLink {
                        SelecaoAntecedenteView(vmficha: novaFicha)
                    } label: {
                        DisplayTextoBotaoCondicao(titulo: "Antecedente", descricaoTrue: "Toque para selecionar...", descricaoFalse: novaFicha.ficha.antecedenteFinal.rawValue, condicao: novaFicha.ficha.antecedenteFinal == .none)
                    }
                    
                    MenuSelecaoTendencia()
                        .environmentObject(novaFicha)
                }
                .frame(maxHeight: .infinity)
                
                NavigationLink {
                    CriacaoCaracteristica(vmficha: self.novaFicha, popToRoot: $popToRoot)
                } label: {
                    Text("Próximo")
                }
                .isDetailLink(false)
                .buttonStyle(CustomButtonStyle5())
                .disabled(novaFicha.ficha.nome.isEmpty ||
                          novaFicha.ficha.nomePersonagem.isEmpty ||
                          novaFicha.ficha.racaFinal.racaPersonagem == .none ||
                          novaFicha.ficha.classeFinal.classePersonagem == .none ||
                          novaFicha.ficha.antecedenteFinal == .none ||
                          novaFicha.ficha.tendenciaPersonagem == .none)
                
            }
            .padding(.horizontal, 10)
        }
        
        .navigationTitle("Criação de Personagem")
    }
}

struct MenuSelecaoTendencia: View {
    
    @EnvironmentObject private var vmficha: NovaFichaViewModel
    @State private var showContent: Bool
    
    public init() {
        self.showContent = false
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $showContent) {
            ForEach(TipoTendencia.allCases, id: \.self) { tendencia in
                if tendencia != .none {
                    TemplateRadioButton(isMarked: vmficha.ficha.tendenciaPersonagem == tendencia ,title: tendencia.rawValue) {
                        vmficha.setTendencia(tendencia: tendencia)
                        withAnimation(.easeOut) {
                            self.showContent.toggle()
                        }
                    }
                }
            }
        } header: {
            DisplayTextoBotaoCondicao(titulo: "Tendência", descricaoTrue: "Toque para selecionar...", descricaoFalse: vmficha.ficha.tendenciaPersonagem.rawValue, condicao: vmficha.ficha.tendenciaPersonagem == .none)
        }
    }
}

struct CustomNavigationLink<Destination, Label>: View where Destination: View, Label: View {
    
    @ViewBuilder private var label: () -> Label
    private var destination: () -> Destination
    
    public init(destination: @escaping () -> Destination, @ViewBuilder label: @escaping () -> Label) {
        self.label = label
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink {
            destination()
        } label: {
            label()
        }
        .buttonStyle(CustomButtonStyle())
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
    }
}

struct DisplayTextoBotaoCondicao: View {
    private var titulo: String
    private var descricaoTrue: String
    private var descricaoFalse: String
    private var condicao: Bool
    
    public init(titulo: String, descricaoTrue: String, descricaoFalse: String, condicao: Bool) {
        self.titulo = titulo
        self.descricaoTrue = descricaoTrue
        self.descricaoFalse = descricaoFalse
        self.condicao = condicao
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(titulo)
                .font(.system(size: 15, weight: .semibold, design: .default))
            Text(condicao ? descricaoTrue : descricaoFalse)
                .font(.system(size: 13, weight: .regular, design: .default))
                .fixedSize(horizontal: false, vertical: true)
        }
        .foregroundColor(condicao ? Color("RedTheme") : Color("BlackAndWhite"))
    }
}

struct TemplateRadioButton: View {
    
    @State private var isMarked: Bool
    private let title: String
    private var completion: () -> Void
    
    public init(isMarked: Bool = false, title: String, completion: @escaping () -> Void) {
        self.isMarked = isMarked
        self.title = title
        self.completion = completion
    }
    
    var body: some View {
        Button {
            self.isMarked.toggle()
            completion()
        } label: {
            HStack {
                Image(systemName: "circle.fill")
                    .renderingMode(.template)
                    .foregroundColor(isMarked ? Color("RedTheme") : Color(uiColor: .systemGray4))
                Text(title)
                    .font(.system(size: 15, weight: .regular, design: .default))
            }
        }
        .buttonStyle(CustomButtonStyle2())
        .frame(height: 40)
    }
}

struct TemplateRadioButtonWithContent<Content>: View where Content: View {
    @State private var isMarked: Bool
    @ViewBuilder private var content: () -> Content
    private var completion: () -> Void
    
    public init(isMarked: Bool = false, @ViewBuilder content: @escaping () -> Content, completion: @escaping () -> Void) {
        self.isMarked = isMarked
        self.content = content
        self.completion = completion
    }
    
    var body: some View {
        Button {
            self.isMarked.toggle()
            completion()
        } label: {
            HStack {
                Image(systemName: "circle.fill")
                    .renderingMode(.template)
                    .foregroundColor(isMarked ? Color("RedTheme") : Color(uiColor: .systemGray4))
                VStack(alignment: .leading, spacing: 0) {
                    content()
                }
            }
        }
        .buttonStyle(CustomButtonStyle2())
    }
}

struct TemplateRadioButtonWithIdentifier<Content, ID>: View where Content: View, ID: Hashable {
    
    @ViewBuilder private var content: () -> Content
    @Binding private var selectedID: ID
    private var id: ID
    private var completion: () -> Void
    
    public init(selectedID: Binding<ID>, id: ID, completion: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self._selectedID = selectedID
        self.id = id
        self.completion = completion
        self.content = content
    }
    
    var body: some View {
        HStack {
            Button {
                withAnimation {
                    self.selectedID = id
                }
                completion()
            } label: {
                HStack {
                    Image(systemName: "circle.fill")
                        .renderingMode(.template)
                        .foregroundColor(self.id == self.selectedID ? Color("RedTheme") : Color(uiColor: .systemGray4))
                    VStack(alignment: .leading, spacing: 0) {
                        content()
                    }
                }
            }
            .buttonStyle(CustomButtonStyle2())
        }
    }
}

struct TemplateRadioButtonMultipleIdentifier<Content, ID>: View where Content: View, ID: Hashable {
    
    @ViewBuilder private var content: () -> Content
    @Binding private var selectedID: [ID]
    private var maxSelection: Int
    private var id: ID
    private var completion: () -> Void
    
    public init(selectedID: Binding<[ID]>, id: ID, maxSelection: Int = 0, completion: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self._selectedID = selectedID
        self.id = id
        self.maxSelection = maxSelection
        self.completion = completion
        self.content = content
    }
    
    var body: some View {
        HStack {
            Button {
                withAnimation {
                    changeSelection()
                }
                completion()
            } label: {
                HStack {
                    Image(systemName: "circle.fill")
                        .renderingMode(.template)
                        .foregroundColor(selectedID.contains(id) ? Color("RedTheme") : Color(uiColor: .systemGray4))
                    VStack(alignment: .leading, spacing: 0) {
                        content()
                    }
                }
            }
            .buttonStyle(CustomButtonStyle2())
        }
    }
    
    private func changeSelection() {
        DispatchQueue.main.async {
            if self.maxSelection == 0 {
                if self.selectedID.contains(self.id) {
                    self.selectedID.removeAll(where: {$0 == self.id})
                } else {
                    self.selectedID.append(self.id)
                }
            } else {
                if self.selectedID.contains(self.id) {
                    self.selectedID.removeAll(where: {$0 == self.id})
                } else {
                    if selectedID.count >= maxSelection {
                        self.selectedID.removeFirst()
                        self.selectedID.append(id)
                    } else {
                        self.selectedID.append(self.id)
                    }
                }
            }
        }
    }
}

struct TemplateDisclosureGroupContent: View {
    
    private let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .padding(.horizontal, 10)
            .font(.system(size: 15, weight: .regular, design: .default))
            .frame(height: 40)
    }
}

struct TemplateCustomDisclosureGroup<Content, Header>: View where Content: View, Header: View {
    
    @Binding private var isExpanded: Bool
    @ViewBuilder private var content: () -> Content
    @ViewBuilder private var header: () -> Header
    
    
    public init(isExpanded: Binding<Bool>, @ViewBuilder content: @escaping () -> Content, @ViewBuilder header: @escaping () -> Header) {
        self._isExpanded = isExpanded
        self.content = content
        self.header = header
    }
    
    var body: some View {
        TemplateContentBackground {
            DisclosureGroup(isExpanded: $isExpanded) {
                VStack(alignment: .leading, spacing: 0) {
                    Divider()
                    content()
                }
            } label: {
                header()
            }.buttonStyle(CustomButtonStyle2())
        }
    }
}

struct TemplateCustomDisclosureGroup2<Content, Header>: View where Content: View, Header: View {
    
    @ViewBuilder private var content: () -> Content
    @ViewBuilder private var header: () -> Header
    
    
    public init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder header: @escaping () -> Header) {
        self.content = content
        self.header = header
    }
    
    var body: some View {
        TemplateContentBackground {
            DisclosureGroup {
                VStack(alignment: .leading, spacing: 0) {
                    Divider()
                    content()
                }
            } label: {
                header()
            }.buttonStyle(CustomButtonStyle2())
        }
    }
}

struct TemplateDetalheCaracteristica: View {
    
    @State private var isExpanded: Bool = false
    private var title: String
    private var subtitle: String
    private var description: String
    
    public init(title: String, subtitle: String, description: String) {
        self.title = title
        self.subtitle = subtitle
        self.description = description
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            DisplayTextoBotao(titulo: "Descrição:", descricao: description)
                .padding(10)
        } header: {
            DisplayTextoBotao(titulo: title , descricao: subtitle)
        }
    }
}
