//
//  LojaItens.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 19/10/22.
//

import SwiftUI

struct LojaItens: View {
    
    @ObservedObject private var sheet: SheetsViewModel
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
    }
    
    var body: some View {
        
        TemplateTelaPadrao(withPaddings: false) {
            ScrollView {
                VStack(spacing: 10) {
                    ListaArmasLoja(sheet: sheet)
                }
                .padding(.horizontal, 10)
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("Loja")
                }
            }
        }
    }
}

private struct ListaArmasLoja: View {
    
    @ObservedObject private var sheet: SheetsViewModel
    @State private var showDetail: Bool = false
    @State private var selectedArma: ArmaJSON = ArmaJSON(id: 0, nome: "", tipo: .marcial, estilo: .cac, preco: Moeda(), dano: Dano(dano: "", tipo: .concussao), peso: 0, propriedades: "")
    
    private var toasArmas: [ArmaJSON] {
        guard let list = JsonFileUtil.getDataFromBundle(folder: .arma, decoder: ArmaJSON.self) as? [ArmaJSON] else { return [] }
        return list.sorted(by: {$0.nome < $1.nome})
    }
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup2(showDivider: false) {
            ForEach(toasArmas, id: \.id) { arma in
                VStack(spacing: 0) {
                    Divider()
                    LojaItemCell(title: arma.nome, quantidade: 1, categoria: "\(arma.tipo.rawValue) \(arma.estilo.rawValue)", preco: arma.preco) {
                        self.selectedArma = arma
                        showDetail.toggle()
                    } completion: {
                        DispatchQueue.main.async {
                            self.sheet.fichaSelecionada.armas.append(arma)
                        }
                    }
                }
            }
        } header: {
            SingleLineDisclosureTitle(title: "Armas")
        }
        .sheet(isPresented: $showDetail) {
            if let selectedArma = selectedArma {
                SheetDescricaoItemLoja(tipoItem: "Arma") {
                    TemplateContentBackground {
                        VStack(alignment: .leading, spacing: 10) {
                            DisplayTextoBotao(titulo: selectedArma.nome, descricao: "\(selectedArma.tipo.rawValue) \(selectedArma.estilo.rawValue)")
                            Divider().padding(.horizontal, -10)
                            DisplayTextoBotao(titulo: "Custo", descricao: "\(selectedArma.preco.quantidade) \(selectedArma.preco.tipo.rawValue)")
                            DisplayTextoBotao(titulo: "Dano", descricao: "\(selectedArma.dano.dano) \(selectedArma.dano.tipo.rawValue)")
                            DisplayTextoBotao(titulo: "Peso", descricao: "\(selectedArma.peso)")
                            DisplayTextoBotao(titulo: "Propriedade", descricao: "\(selectedArma.propriedades)")
                        }
                        .padding(10)
                    }
                } completion: {
                    DispatchQueue.main.async {
                        self.sheet.fichaSelecionada.armas.append(selectedArma)
                    }
                }
                
            }
        }
    }
}

private struct SheetDescricaoItemLoja<Content>: View where Content: View {
    
    @ViewBuilder private var content: () -> Content
    private var completion: () -> Void
    private var tipoItem: String
    
    public init(tipoItem: String, @ViewBuilder content: @escaping () -> Content, completion: @escaping () -> Void) {
        self.content = content
        self.completion = completion
        self.tipoItem = tipoItem
    }
    
    var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("Saco Detalhado"), title: "Descrição de Item", subtitle: tipoItem)) {
            
            VStack(alignment: .leading, spacing: 10) {
                content()
                Spacer()
                Button("Adicionar ao Inventário") {
                    completion()
                }.buttonStyle(CustomButtonStyle5())
            }
            .padding(.horizontal, 10)
        }
    }
}

struct LojaItemCell: View {
    
    private var completion: () -> Void
    private var detail: () -> Void
    private var title: String
    private var quantidade: Int
    private var categoria: String
    private var preco: Moeda
    
    public init(title: String, quantidade: Int, categoria: String, preco: Moeda, detail: @escaping () -> Void, completion: @escaping () -> Void) {
        self.detail = detail
        self.completion = completion
        self.title = title
        self.quantidade = quantidade
        self.categoria = categoria
        self.preco = preco
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Button {
                detail()
            } label: {
                VStack(alignment: .leading, spacing: 3) {
                    Text("x\(quantidade) \(title)")
                        .font(.system(size: 15, weight: .bold, design: .default))
                    Text("\(categoria)")
                        .font(.system(size: 13, weight: .regular, design: .default))
                }
            }
            .buttonStyle(CustomButtonStyle2())
            
            Button {
                completion()
            } label: {
                VStack(alignment: .trailing, spacing: 3) {
                    Text("Adicionar")
                        .font(.system(size: 15, weight: .regular, design: .default))
                    Text("\(preco.quantidade) Peças de \(preco.tipo.rawValue)")
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundColor(Color("BlackAndWhite"))
                }
            }
            .buttonStyle(.borderless)
            .padding(.trailing, 10)
        }
        .frame(height: 50)
    }
}
