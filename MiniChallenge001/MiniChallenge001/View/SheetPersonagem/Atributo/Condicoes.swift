
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
            LazyVStack{
                ForEach(Condicao.allCases, id: \.self) { condicao in
                    TemplateRadioButtonMultipleIdentifier(selectedID: $ficha.condicoes, id: condicao) {
                        
                    } content: {
                        Text(condicao.rawValue)
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
            LazyVStack{
                ForEach(Exaustao.allCases, id: \.self) { exaustao in
                    TemplateRadioButtonWithIdentifier(selectedID: $ficha.exaustao, id: exaustao) {
                        
                    } content: {
                        Text(exaustao.rawValue)
                    }
                }
            }
        }
    }
}
