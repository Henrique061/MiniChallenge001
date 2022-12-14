//
//  CriacaoMain.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 24/09/22.
//

import SwiftUI



public enum FieldsIdentifiers: CaseIterable {
    case none
    case nomeFicha
    case nomePersonagem
}

public class NovaFichaViewModel: ObservableObject {
    @Published var perfil: PerfilPersonagem
    @Published var racaFinal: RacaFinal
    @Published var classeFinal: ClasseFinal
    @Published var antecedenteFinal: AntecedenteFinal
    
    public init() {
        self.perfil = PerfilPersonagem()
        self.racaFinal = RacaFinal()
        self.classeFinal = ClasseFinal()
        self.antecedenteFinal = AntecedenteFinal()
    }
    
    public func setRaca(raca: RacaFinal) {
        DispatchQueue.main.async {
            self.racaFinal = raca
        }
    }
    
    public func setClasse(classe: ClasseFinal) {
        DispatchQueue.main.async {
            self.classeFinal = classe
        }
    }
    
    public func setAntecedente(antecedente: AntecedenteFinal) {
        DispatchQueue.main.async {
            self.antecedenteFinal = antecedente
        }
    }
    
    public func setTendencia(tendencia: TipoTendencia) {
        DispatchQueue.main.async {
            self.perfil.tendencia = tendencia
        }
    }
    
    public func createFicha(atributos: [Atributo], completion: @escaping (_ saved: Bool) -> Void) {
        DispatchQueue.main.async {
            do {
                var novaFicha = PersonagemClient.orderPersonagem(raca: self.racaFinal, classe: self.classeFinal, antecedente: self.antecedenteFinal, valoresAtributos: ValoresAtributos(atributos), perfilPersonagem: self.perfil)
                novaFicha.id = try JsonFileUtil.getNewIdForSheet()
                try JsonFileUtil.write(content: novaFicha)
                completion(true)
            } catch {
                completion(false)
            }
        }
    }
}

struct CriacaoMain: View {
    
    @StateObject private var novaFicha: NovaFichaViewModel = NovaFichaViewModel()
    @State private var showCancelSheetAlert: Bool = false
    @Binding private var popToRoot: Bool
    
    @FocusState private var focusedField: Bool
    
    public init(popToRoot: Binding<Bool>) {
        self._popToRoot = popToRoot
    }
    
    var body: some View {
        TemplateTelaPadrao {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    Text("Para come??armos, preencha abaixo os dados de seu peronsagem")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                    
                    TextFieldCriacao(title: "Nome da ficha", text: $novaFicha.perfil.nomeFicha)
                        .focused($focusedField)
                    TextFieldCriacao(title: "Nome do personagem", text: $novaFicha.perfil.nomePersonagem)
                        .focused($focusedField)
                    
                    CustomNavigationLink {
                        SelecaoRacaView(vmficha: self.novaFicha) { dismissKeyboard() }
                    } label: {
                        DisplayTextoBotaoCondicao(titulo: "Ra??a", descricaoTrue: "Toque para selecionar...", descricaoFalse: novaFicha.racaFinal.tipoRaca.rawValue, condicao: novaFicha.racaFinal.tipoRaca == .none)
                    }
                    
                    CustomNavigationLink {
                        SelecaoClasseView(vmficha: novaFicha)
                    } label: {
                        DisplayTextoBotaoCondicao(titulo: "Classe", descricaoTrue: "Toque para selecionar...", descricaoFalse: novaFicha.classeFinal.tipoClasse.rawValue, condicao: novaFicha.classeFinal.tipoClasse == .none)
                    }
                    
                    CustomNavigationLink {
                        SelecaoAntecedenteView(vmficha: novaFicha)
                    } label: {
                        DisplayTextoBotaoCondicao(titulo: "Antecedente", descricaoTrue: "Toque para selecionar...", descricaoFalse: novaFicha.antecedenteFinal.tipoAntecedente.rawValue, condicao: novaFicha.antecedenteFinal.tipoAntecedente == .none)
                    }
                    
                    MenuSelecaoTendencia(vmficha: self.novaFicha)
                }
                
                NavigationLink {
                    CriacaoCaracteristica(vmficha: self.novaFicha, popToRoot: $popToRoot)
                } label: {
                    Text("Pr??ximo")
                }
                .isDetailLink(false)
                .buttonStyle(CustomButtonStyle5())
                .disabled(novaFicha.perfil.nomeFicha.isEmpty ||
                          novaFicha.perfil.nomePersonagem.isEmpty ||
                          novaFicha.racaFinal.tipoRaca == .none ||
                          novaFicha.classeFinal.tipoClasse == .none ||
                          novaFicha.antecedenteFinal.tipoAntecedente == .none ||
                          novaFicha.perfil.tendencia == .none)
            }
            .padding(.horizontal, 10)
        }
        
        .navigationTitle("Cria????o Personagem")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancelar") {
                    self.showCancelSheetAlert.toggle()
                }
                .alert("Cancelar cria????o de ficha", isPresented: $showCancelSheetAlert) {
                    Button(role: .destructive, action: {self.popToRoot.toggle()}, label: {Text("Cancelar cria????o")})
                    Button(role: .cancel, action: {}, label: {Text("Continuar criando")})
                } message: {
                    Text("Caso voc?? cancele a cria????o de ficha todas as informa????es colocadas ser??o removidas.")
                }

            }
        }
    }
    
    private func dismissKeyboard() {
        if #available(iOS 16.0, *) {
            self.focusedField = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.focusedField = false
            }
        }
    }
}

struct MenuSelecaoTendencia: View {
    
    @ObservedObject private var vmficha: NovaFichaViewModel
    @State private var showContent: Bool
    
    public init(vmficha: NovaFichaViewModel) {
        self.vmficha = vmficha
        self.showContent = false
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $showContent) {
            ForEach(TipoTendencia.allCases, id: \.self) { tendencia in
                TemplateRadioButtonWithIdentifier(selectedID: $vmficha.perfil.tendencia, id: tendencia) {
                    withAnimation {
                        showContent.toggle()
                    }
                } content: {
                    Text(tendencia.rawValue)
                }.frame(height: 40)

            }
        } header: {
            DisplayTextoBotaoCondicao(titulo: "Tend??ncia", descricaoTrue: "Toque para selecionar...", descricaoFalse: vmficha.perfil.tendencia.rawValue, condicao: vmficha.perfil.tendencia == .none)
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
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
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
                .minimumScaleFactor(0.5)
                .scaledToFill()
                .lineLimit(1)
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
    private var showDivider: Bool
    
    public init(showDivider: Bool = true, @ViewBuilder content: @escaping () -> Content, @ViewBuilder header: @escaping () -> Header) {
        self.content = content
        self.header = header
        self.showDivider = showDivider
    }
    
    var body: some View {
        TemplateContentBackground {
            DisclosureGroup {
                VStack(alignment: .leading, spacing: 0) {
                    if showDivider {
                        Divider()
                    }
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
            DisplayTextoBotao(titulo: "Descri????o:", descricao: description)
                .padding(10)
        } header: {
            DisplayTextoBotao(titulo: title , descricao: subtitle)
        }
    }
}
