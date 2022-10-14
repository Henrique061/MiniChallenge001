//
//  MainView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 23/09/22.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject private var vmfichas: SheetsViewModel
    
    @State private var mostrarFicha: Bool = false
    @State private var isRoot: Bool = false
    
    public init() {
        self.vmfichas = SheetsViewModel()
    }
    
    var body: some View {
        NavigationView {
            TemplateTelaPadrao(withPaddings: false) {
                List {
                    ForEach(self.$vmfichas.listaFichas, id: \.id) { ficha in
                        Section {
                            Button {
                                self.vmfichas.setSelectedFicha(ficha: ficha.wrappedValue)
                                mostrarFicha.toggle()
                            } label: {
                                LabelFicha(ficha: ficha)
                            }
                        } header: {
                            Text(ficha.wrappedValue.nome)
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color("BlackAndWhite"))
                                .padding(.leading, -20)
                        }
                        
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button {
                                withAnimation(.easeOut) {
                                    self.vmfichas.delete(ficha: ficha.wrappedValue)
                                }
                            } label: {
                                Text("Delete")
                                    .foregroundColor(Color.white)
                            }.tint(Color("RedTheme"))
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            
            .fullScreenCover(isPresented: $mostrarFicha) {
                ContentView(ficha: self.vmfichas)
            }

            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Fichas")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    NavigationLink(isActive: $isRoot) {
                        CriacaoMain(popToRoot: $isRoot)
                    } label: {
                        HStack {
                            Text("Nova Ficha")
                            Image(systemName: "square.and.pencil")
                        }
                    }.isDetailLink(false)
                }
            }
        }
        .accentColor(Color("RedTheme"))
        
        .onChange(of: isRoot) { _ in
            self.vmfichas.fetch()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct LabelFicha: View {
    @Binding var ficha: PersonagemFicha
    
    private var formatClasseNivel: String {
        return "\(ficha.classeFinal.classePersonagem.rawValue) \(ficha.nivel)"
    }
    
    private var fotoPersonagem: Image {
        if let data = ficha.fotoPersonagem, let foto = UIImage(data: data) {
            return Image(uiImage: foto)
        }
        return Image("IdentidadeIconOff")
    }
    
    var body: some View {
        HStack(spacing: 10) {
            
            ImagemPerfil(ficha: $ficha)
            
            VStack(alignment: .leading) {
                DisplayTextoBotao(titulo: "Nome", descricao: ficha.nomePersonagem)
                Divider()
                DisplayTextoBotao(titulo: "Classe e Nível", descricao: formatClasseNivel)
            }
        }
        .padding(.leading, -10)
        .padding(.trailing, -20)
    }
}

struct ImagemPerfil: View {
    
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.black
            if let data = ficha.fotoPersonagem, let image = UIImage(data: data){
                Image(uiImage: image)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
            } else {
                Image("ProfilePicture")
                    .resizable()
                    .scaledToFit()
                    .padding(8)
            }
        }
        .frame(width: 80, height: 80, alignment: .center)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color("InverseButton"), lineWidth: 1))
    }
}

struct TemplateBackgroundInfo<Content> : View where Content: View {
    
    @ViewBuilder private var content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color("ContentBackground"))
            content()
        }
        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
        .padding(.bottom, 10)
    }
}

struct TemplateTelaPadrao<Content> : View where Content: View {
    
    var withPaddings: Bool
    @ViewBuilder private var content: () -> Content
    
    public init(withPaddings: Bool = true, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.withPaddings = withPaddings
    }
    
    var body: some View {
        ZStack {
            Color("ScreenBackground")
                .ignoresSafeArea(.all)
            VStack(spacing: 0) {
                Divider().padding(.bottom, 10)
                content()
                Divider().padding(.top, withPaddings ? 10 : 0)
            }
        }
        .frame(alignment: .top)
    }
}

struct TemplateContentBackground<Content>: View where Content: View{
    
    @ViewBuilder private var content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color("ContentBackground"))
            content()
        }
        .fixedSize(horizontal: false, vertical: true)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct TemplateSheetView<Header, Content>: View where Content: View, Header: SheetHeader {
    
    @Environment(\.dismiss) private var dismiss
    @ViewBuilder private var content: () -> Content
    private var header: Header
    
    public init(header: Header, @ViewBuilder content: @escaping () -> Content) {
        self.header = header
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("ScreenBackground").ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                header
                    .padding(.vertical, 10)
                content()
            }
        }
    }
}

protocol SheetHeader: View {
    var image: Image { get }
    var title: String { get }
    var subtitle: String { get }
}

struct DefaultSheetHeader: SheetHeader {
    
    @Environment(\.dismiss) private var dismiss
    var image: Image
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                image
                    .renderingMode(.template)
                    .frame(width: 30, height: 30, alignment: .center)
                    .scaledToFill()
                    .padding(.horizontal, 10)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(title)
                        .font(.system(size: 15, weight: .bold, design: .default))
                    Text(subtitle)
                        .font(.system(size: 13, weight: .regular, design: .default))
                }
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    ZStack {
                        Color(uiColor: .systemGray5)
                        Image(systemName: "xmark")
                               .renderingMode(.template)
                               .foregroundColor(Color.black)
                    }
                }
                .frame(width: 30, height: 30, alignment: .center)
                .clipShape(Circle())
                .padding(.trailing, 10)
            }
            .padding(.bottom, 10)
            Divider()
        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .foregroundColor(Color("BlackAndWhite"))
            .background(configuration.isPressed ? Color(uiColor: .systemGray3) : Color("ContentBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 5 ))
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct CustomButtonStyle2: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
            .foregroundColor(Color("BlackAndWhite"))
            .background(configuration.isPressed ? Color(uiColor: .systemGray3) : Color("ContentBackground"))
    }
}

struct CustomButtonStyle3: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 10)
            .foregroundColor(Color.white)
            .background(configuration.isPressed ? Color(uiColor: .systemGray3) : Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct CustomButtonStyle4: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 15, weight: .bold, design: .default))
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(10)
            .foregroundColor(Color("BlackAndWhite"))
            .background(configuration.isPressed ? Color(uiColor: .systemGray3) : Color("ContentBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("BlackAndWhite"), lineWidth: 1))
            
    }
}

struct CustomButtonStyle5: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 15, weight: .bold, design: .default))
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(10)
            .foregroundColor(Color("InverseBlackAndWhite"))
            .background(configuration.isPressed ? Color(uiColor: .systemGray3) : Color("InverseButton"))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .opacity(isEnabled ? 1 : 0.4)
    }
}

struct CustomButtonStyle6: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .padding(.horizontal, 10)
            .foregroundColor(Color("BlackAndWhite"))
            .background(configuration.isPressed ? Color(uiColor: .systemGray3) : Color("ContentBackground"))
    }
}

struct CustomButtonStyle7: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 20, height: 20, alignment: .center)
            .foregroundColor(Color("BlackAndWhite"))
            .opacity(configuration.isPressed ? 0.4 : 1)
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
            .foregroundColor(Color("BlackAndWhite"))
            .background(Color("ContentBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 5 ))
    }
}
