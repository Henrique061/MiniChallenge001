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
//            let teste = FactoryMagiasConhecidas.criarMagiasComTudo(classe: .clerigo, limiteTruePorNivel: [3,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5])
            let ce: ClasseEscolha = ClasseClient.orderClasse(classePersonagem: .clerigo)
            
            print("""
                    classe: \(String(describing: ce.classePersonagem))
                    -----------------------------------------------------
                    nomeClasse: \(String(describing: ce.nomeClasse))
                    -----------------------------------------------------
                    caracClasse: \(String(describing: ce.caracteristicasClasse))
                    -----------------------------------------------------
                    subclasses: \(String(describing: ce.subClasses))
                    -----------------------------------------------------
                    dadovida: \(String(describing: ce.dadoVida))
                    -----------------------------------------------------
                    profSalva: \(String(describing: ce.profSalvaguardas))
                    -----------------------------------------------------
                    profArma: \(String(describing: ce.profArmas))
                    -----------------------------------------------------
                    profArmadura: \(String(describing: ce.profArmaduras))
                    -----------------------------------------------------
                    profFerra: \(String(describing: ce.profFerramentas))
                    -----------------------------------------------------
                    escolhasFerra: \(String(describing: ce.escolhasProficienciaFerramenta))
                    -----------------------------------------------------
                    opcoes: \(String(describing: ce.opcoesEquipamento))
                    -----------------------------------------------------
                    armasini: \(String(describing: ce.armasIniciais))
                    -----------------------------------------------------
                    armadurasini: \(String(describing: ce.armadurasIniciais))
                    -----------------------------------------------------
                    equipini: \(String(describing: ce.equipamentosIniciais))
                    -----------------------------------------------------
                    ferraini: \(String(describing: ce.ferramentasIniciais))
                    -----------------------------------------------------
                    pacoteini: \(String(describing: ce.pacotesIniciais))
                    -----------------------------------------------------
                    profperi: \(String(describing: ce.profPericias))
                    -----------------------------------------------------
                    quantiaperi: \(String(describing: ce.quantiaProfPericias))
                    -----------------------------------------------------
                    possuimagi: \(String(describing: ce.possuiMagias))
                    -----------------------------------------------------
                    magiasub: \(String(describing: ce.magiaApenasSubclasse))
                    -----------------------------------------------------
                    subcommagia: \(String(describing: ce.subclasseComMagia))
                    -----------------------------------------------------
                    magiasconhecidas: \(String(describing: ce.magiasConhecidas))
                    -----------------------------------------------------
                    espacosmagia: \(String(describing: ce.espacosDeMagia))
                    -----------------------------------------------------
                    pontosnum: \(String(describing: ce.pontosEspecificosNumerico))
                    -----------------------------------------------------
                    pontostxt: \(String(describing: ce.pontosEspecificosTexto))
                    -----------------------------------------------------
                    """)
                
        } label: {
            Text("Botãozim do capeta")
        }
    }
}
