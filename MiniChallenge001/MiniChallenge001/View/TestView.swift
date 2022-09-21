//
//  TestView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 21/09/22.
//

import Foundation
import SwiftUI

struct TesteView: View {
    
    var body: some View {
        Button {
            JsonFileUtil.getFilesURLFromFolder(folder: "ferramenta")
        } label: {
            Text("Botãozim do capeta")
        }
    }
}
