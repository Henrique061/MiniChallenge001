
import Foundation
import SwiftUI



struct condicoes: View{
    var body: some View{
                    TemplateTelaPadrao(withPaddings: false){
                ScrollView{
                    VStack{
                        
                   estruturaCondicoes()
                    }
                    .padding(.horizontal, 10)
                    estruturaExaust()
                        .padding(.vertical,5)
                    
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
    
    
    var condicoesArray: [String] = ["Agarrado","Amedrontado","Atordoado","Caído","Cego","Enfeitiçado","Envenenado","Impedido","Incapacitado", "Inconciente","Invisível", "Paralisado", "Petrificado", "Surdo"]
    
    
    var body: some View{
        TemplateTabelaAtributo(title: "Condicoes"){
            
            LazyVStack{
                ForEach(condicoesArray, id: \.self) { condicao in
                    TemplateRadioButton(isMarked: true, title: condicao) {
                        
                    }
                
                
                }
            
        }
    }
}
}

struct estruturaExaust: View{
    var exaustaoArray: [String] = [
    "Exaustão 1","Exaustão 2","Exaustão 3","Exaustão 4","Exaustão 5", ]
    
    var body: some View{
        TemplateTabelaAtributo(title: "Exaustão") {
             LazyVStack{
                ForEach(exaustaoArray, id: \.self) { condicao in
                    TemplateRadioButton(isMarked: true, title: condicao) {
                        
                    }
                
                
                }
            
        }
        }
    }
}
