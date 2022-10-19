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
//    @State private var showDetail: Bool = false
    @State private var selectedArma: ArmaJSON?
    
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
//                        showDetail.toggle()
                    } completion: {
                        DispatchQueue.main.async {
                            self.sheet.fichaSelecionada.armas.append(arma)
                        }
                    }
                }
            }
            .sheet(item: $selectedArma) { arma in
                SheetDescricaoArma(arma: arma) {
                    DispatchQueue.main.async {
                        self.sheet.fichaSelecionada.armas.append(arma)
                    }
                }
            }
        } header: {
            SingleLineDisclosureTitle(title: "Armas")
        }
        
    }
}

private struct SheetDescricaoArma: View {
    
    @Environment(\.dismiss) private var dismiss
    private var arma: ArmaJSON
    private var completion: () -> Void
    
    public init(arma: ArmaJSON, completion: @escaping () -> Void) {
        self.arma = arma
        self.completion = completion
    }
    
    var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("Saco Detalhado"), title: "Descrição de Item", subtitle: "Arma")) {
            
            VStack(alignment: .leading, spacing: 10) {
                TemplateContentBackground {
                    VStack(alignment: .leading, spacing: 10) {
                        DisplayTextoBotao(titulo: arma.nome, descricao: "\(arma.tipo.rawValue) \(arma.estilo.rawValue)")
                        Divider().padding(.horizontal, -10)
                        DisplayTextoBotao(titulo: "Custo", descricao: "\(arma.preco.quantidade) \(arma.preco.tipo.rawValue)")
                        DisplayTextoBotao(titulo: "Dano", descricao: "\(arma.dano.dano) \(arma.dano.tipo.rawValue)")
                        DisplayTextoBotao(titulo: "Peso", descricao: "\(arma.peso)")
                        DisplayTextoBotao(titulo: "Propriedade", descricao: "\(arma.propriedades)")
                    }
                    .padding(10)
                }
                Spacer()
                Button("Adicionar ao Inventário") {
                    completion()
                    dismiss()
                }
                .buttonStyle(CustomButtonStyle5())
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
