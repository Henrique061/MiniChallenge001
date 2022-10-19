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
                    ListaArmadurasLoja(sheet: sheet)
                    ListaFerramentasLoja(sheet: sheet)
                }
                .padding(.horizontal, 10)
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("Todos os Itens")
                }
            }
        }
    }
}

private struct ListaFerramentasLoja: View {
    
    @ObservedObject private var sheet: SheetsViewModel
    @State private var selectedFerramenta: FerramentaJSON?
    
    private var todasFerramentas: [FerramentaJSON] {
        guard let list = JsonFileUtil.getDataFromBundle(folder: .ferramenta, decoder: FerramentaJSON.self) as? [FerramentaJSON] else { return []}
        return list.sorted(by: {$0.nome < $1.nome})
    }
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup2(showDivider: false) {
            ForEach(todasFerramentas) { ferramenta in
                VStack(spacing: 0) {
                    Divider()
                    LojaItemCell(title: ferramenta.nome, quantidade: 1, categoria: ferramenta.tipo.rawValue, preco: ferramenta.preco) {
                        self.selectedFerramenta = ferramenta
                    } completion: {
                        DispatchQueue.main.async {
                            self.sheet.fichaSelecionada.ferramentas.append(ferramenta)
                        }
                    }
                }
            }
            .sheet(item: $selectedFerramenta) { ferramenta in
                SheetDescricaoFerramenta(ferramenta: ferramenta, buttonTitle: "Adicionar ao Inventário") {
                    DispatchQueue.main.async {
                        self.sheet.fichaSelecionada.ferramentas.append(ferramenta)
                    }
                }
            }
        } header: {
            SingleLineDisclosureTitle(title: "Ferramentas")
        }

    }
}

private struct ListaArmasLoja: View {
    
    @ObservedObject private var sheet: SheetsViewModel
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
                    } completion: {
                        DispatchQueue.main.async {
                            self.sheet.fichaSelecionada.armas.append(arma)
                        }
                    }
                }
            }
            .sheet(item: $selectedArma) { arma in
                SheetDescricaoArma(arma: arma, buttonTitle: "Adicionar ao inventário") {
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

private struct ListaArmadurasLoja: View {
    
    @ObservedObject private var sheet: SheetsViewModel
    @State private var selectedArmadura: ArmaduraJSON?
    
    private var todasArmaduras: [ArmaduraJSON] {
        guard let list = JsonFileUtil.getDataFromBundle(folder: .armaduras, decoder: ArmaduraJSON.self) as? [ArmaduraJSON] else { return []}
        return list.sorted(by: {$0.nome < $1.nome})
    }
    
    public init(sheet: SheetsViewModel) {
        self.sheet = sheet
    }
    
    var body: some View {
        TemplateCustomDisclosureGroup2(showDivider: false) {
            ForEach(todasArmaduras) { armadura in
                VStack(spacing: 0) {
                    Divider()
                    LojaItemCell(title: armadura.nome, quantidade: 1, categoria: armadura.tipo.rawValue, preco: armadura.preco) {
                        self.selectedArmadura = armadura
                    } completion: {
                        DispatchQueue.main.async {
                            self.sheet.fichaSelecionada.armaduras.append(armadura)
                        }
                    }
                }
            }
            .sheet(item: $selectedArmadura) { armadura in
                SheetDescricaoArmadura(armadura: armadura, buttonTitle: "Adicionar ao Inventário") {
                    DispatchQueue.main.async {
                        self.sheet.fichaSelecionada.armaduras.append(armadura)
                    }
                }
            }
        } header: {
            SingleLineDisclosureTitle(title: "Armaduras")
        }

    }
}

struct SheetDescricaoArmadura: View {
    
    @Environment(\.dismiss) private var dismiss
    private var buttonTitle: String
    private var completion: () -> Void
    private var armadura: ArmaduraJSON
    
    private var classeDeArmadura: String {
        if armadura.modCA < 0 {
            return "\(armadura.valorCA)"
        } else if armadura.modCA == 0 {
            return "\(armadura.valorCA) + modificador de Destreza"
        } else {
            return "\(armadura.valorCA) + modificador de Destreza (máximo: \(armadura.modCA))"
        }
    }
    
    public init(armadura: ArmaduraJSON, buttonTitle: String, completion: @escaping () -> Void) {
        self.armadura = armadura
        self.buttonTitle = buttonTitle
        self.completion = completion
    }
    
    var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("Saco Detalhado"), title: "Descrição de Item", subtitle: "Armadura")) {
            VStack(alignment: .leading, spacing: 10) {
                TemplateContentBackground {
                    VStack(alignment: .leading, spacing: 10) {
                        DisplayTextoBotao(titulo: armadura.nome, descricao: armadura.tipo.rawValue)
                        Divider().padding(.horizontal, -10)
                        DisplayTextoBotao(titulo: "Custo", descricao: "\(armadura.preco.quantidade) \(armadura.preco.tipo.rawValue)")
                        DisplayTextoBotao(titulo: "Peso", descricao: FormatterUtils.formatarPeso(num: armadura.peso))
                        DisplayTextoBotao(titulo: "Classe de Armadura", descricao: classeDeArmadura)
                        DisplayTextoBotao(titulo: "Força", descricao: armadura.forca < 0 ? "-" : "\(armadura.forca)")
                        DisplayTextoBotao(titulo: "Furtividade", descricao: armadura.desv_furtividade ? "Desvantagem" : "-")
                        DisplayTextoBotao(titulo: "Descrição", descricao: armadura.descricao)
                    }.padding(10)
                }
                Spacer()
                Button(buttonTitle) {
                    completion()
                    dismiss()
                }
                .buttonStyle(CustomButtonStyle5())
            }
            .padding(.horizontal, 10)
        }
    }
    
}

struct SheetDescricaoFerramenta: View {

    @Environment(\.dismiss) private var dismiss
    private var buttonTitle: String
    private var completion: () -> Void
    private var ferramenta: FerramentaJSON
    
    public init(ferramenta: FerramentaJSON, buttonTitle: String, completion: @escaping () -> Void) {
        self.ferramenta = ferramenta
        self.buttonTitle = buttonTitle
        self.completion = completion
    }
    
    var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("Saco Detalhado"), title: "Descrição de Item", subtitle: "Ferramenta")) {
            VStack(alignment: .leading, spacing: 10) {
                TemplateContentBackground {
                    VStack(alignment: .leading, spacing: 10) {
                        DisplayTextoBotao(titulo: ferramenta.nome, descricao: ferramenta.tipo.rawValue)
                        Divider().padding(.horizontal, -10)
                        DisplayTextoBotao(titulo: "Custo", descricao: "\(ferramenta.preco.quantidade) \(ferramenta.preco.tipo.rawValue)")
                        DisplayTextoBotao(titulo: "Peso", descricao: FormatterUtils.formatarPeso(num: ferramenta.peso))
                        DisplayTextoBotao(titulo: "Descrição", descricao: ferramenta.descricao)
                    }.padding(10)
                }
                Spacer()
                Button(buttonTitle) {
                    completion()
                    dismiss()
                }
                .buttonStyle(CustomButtonStyle5())
            }
            .padding(.horizontal, 10)
        }
    }
}

struct SheetDescricaoArma: View {
    
    @Environment(\.dismiss) private var dismiss
    private var arma: ArmaJSON
    private var buttonTitle: String
    private var completion: () -> Void
    
    public init(arma: ArmaJSON, buttonTitle: String, completion: @escaping () -> Void) {
        self.arma = arma
        self.buttonTitle = buttonTitle
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
                        DisplayTextoBotao(titulo: "Peso", descricao: "\(FormatterUtils.formatarPeso(num: arma.peso))")
                        DisplayTextoBotao(titulo: "Propriedade", descricao: "\(arma.propriedades)")
                    }
                    .padding(10)
                }
                Spacer()
                Button(buttonTitle) {
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
