
import Foundation
import SwiftUI



struct condicoes: View{
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View{
        TemplateTelaPadrao(withPaddings: false){
            ScrollView{
                VStack(alignment: .leading, spacing: 10) {
                    estruturaCondicoes(ficha: $ficha)
                        .padding(.horizontal, 10)
                    estruturaExaust(ficha: $ficha)
                        .padding(.horizontal, 10)
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarTitle("Condições")
                }
            }
        }
    }
}

struct estruturaCondicoes: View{
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View{
        TemplateTabelaAtributo(title: "Condições"){
            LazyVStack(spacing: 0){
                ForEach(Array(Condicao.allCases.enumerated()), id: \.element) { (index, condicao) in
                    if index > 0 {
                        Divider()
                    }
                    TemplateRadioButtonMultipleIdentifier(selectedID: $ficha.condicoes, id: condicao) {
                        
                    } content: {
                        Text(condicao.rawValue)
                            .frame(height: 40)
                    }
                }
            }
        }
    }
}

struct estruturaExaust: View{
    @Binding private var ficha: PersonagemFicha
    
    public init(ficha: Binding<PersonagemFicha>) {
        self._ficha = ficha
    }
    
    var body: some View{
        TemplateTabelaAtributo(title: "Exaustão") {
            LazyVStack(spacing: 0){
                ForEach(Array(Exaustao.allCases.enumerated()), id: \.element) { (index, exaustao) in
                    if index > 0 {
                        Divider()
                    }
                    TemplateRadioButtonWithIdentifier(selectedID: $ficha.exaustao, id: exaustao) {
                        
                    } content: {
                        Text(exaustao.rawValue)
                            .frame(height: 40)
                    }
                }
            }
        }
    }
}
