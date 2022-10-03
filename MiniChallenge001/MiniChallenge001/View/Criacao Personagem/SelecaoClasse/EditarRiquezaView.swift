//
//  EditarRiquezaView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 01/10/22.
//

import SwiftUI

struct EditarRiquezaView: View {
    var body: some View {
        TemplateSheetView(header: DefaultSheetHeader(image: Image("Saco Detalhado"), title: "Riqueza da Classe", subtitle: "Nome da Classe")) {
            Text("Alguma coisa")
        }
    }
}

struct EditarRiquezaView_Previews: PreviewProvider {
    static var previews: some View {
        EditarRiquezaView()
    }
}
