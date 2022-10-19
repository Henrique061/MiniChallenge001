//
//  TodasHabilidadesView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 22/09/22.
//

import SwiftUI

struct TodasHabilidadesView: View {
    @ObservedObject private var sheet: SheetsViewModel
    @StateObject private var vmmagias: MagiasViewModel
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
        self._vmmagias = StateObject(wrappedValue: MagiasViewModel(classe: sheet.fichaSelecionada.classeFinal.classePersonagem))
    }
    
    var body: some View {
        TemplateTelaPadrao(withPaddings: false) {
            if self.vmmagias.filteredMagias.isEmpty {
                Text("Nenhuma habilidade encontrada")
                Spacer()
            } else {
                ScrollView {
                    ForEach(self.vmmagias.filteredMagias, id: \.self) { magias in
                        MagiaContentGroup(magias: magias) { magia in
                            withAnimation {
                                DispatchQueue.main.async {
                                    self.sheet.fichaSelecionada.magias.append(magia)
                                    self.vmmagias.magias.removeAll(where: {$0.id == magia.id})
                                }
                            }
                        }
                    }
                }
            }
        }
        .searchable(text: self.$vmmagias.searchText)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                NavigationBarTitle("Livro de Habilidades")
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button("Reset") {
                        vmmagias.resetFilters(classe: self.sheet.fichaSelecionada.classeFinal.classePersonagem)
                    }
                    Menu("Níveis") {
                        Picker("", selection: self.$vmmagias.filtroNivel) {
                            ForEach(-1..<10) { nivel in
                                Text(getFiltroNivelTitle(nivel: nivel)).tag(nivel)
                            }
                        }.labelsHidden()
                    }
                    Menu("Classes") {
                        Picker("", selection: self.$vmmagias.filtroClasse) {
                            ForEach(ClassePersonagem.allCases, id: \.self) { classe in
                                Text(classe.rawValue).tag(classe)
                            }
                        }.labelsHidden()
                    }
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .renderingMode(.template)
                        .foregroundColor(Color("BlackAndWhite"))
                }
            }
        }
    }
    
    private func getFiltroNivelTitle(nivel: Int) -> String {
        if nivel == -1 {
            return "Nenhum"
        }
        return nivel == 0 ? "Truque" : "\(nivel)º Círculo"
    }
}

private struct MagiaContentGroup: View {

    @State private var isExpanded: Bool = false
    private var magias: [MagiaJSON]
    private var completion: (_ magia: MagiaJSON) -> Void
    
    public init(magias: [MagiaJSON], completion: @escaping (_ magia: MagiaJSON) -> Void) {
        self.magias = magias
        self.completion = completion
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup(isExpanded: $isExpanded) {
            ForEach(magias, id: \.id) { magia in
                VStack(spacing: 0) {
                    Divider().padding(.horizontal, -10)
                    MagiaDetailCellWithButton(magia: magia) {
                        self.completion(magia)
                    }
                }
            }
        } header: {
            HeaderMagiaSection(magias.first?.nivel ?? -1)
        }.padding(.horizontal, 10)
    }
}

struct MagiaDetailCellWithButton: View {
    
    private let magia: MagiaJSON
    private var completion: () -> Void
    
    init(magia: MagiaJSON, completion: @escaping () -> Void) {
        self.magia = magia
        self.completion = completion
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            MagiaDetailCell(magia: magia, title: "Aprender Habilidade") {
                completion()
            }
            Button {
                completion()
            } label: {
                Text("Aprender")
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .padding(.horizontal, 20)
                    .frame(maxHeight: .infinity)
            }
            .buttonStyle(.borderless)
        }
    }
}


