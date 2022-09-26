//
//  Raca.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 21/09/22.
//

import Foundation


//
////MARK: Classe Raca
//public class Raca {
//    var tipoRaca: TipoRaca
//    var racaNome: String
//    var deslocamento: Float
//    var idiomas: [Idioma]
//    var tracosRaca: [String] //MARK: trocar para skills json depois
//    var profArmas: [ArmaJSON]?
//    var profArmaduras: [ArmaduraJSON]?
//    var profFerramentas: [FerramentaJSON]?
//    var profPericias: [String]?
//    
//    init(tipoRaca: TipoRaca) {
//        self.tipoRaca = tipoRaca
//        self.racaNome = tipoRaca.rawValue
//        self.deslocamento = 0
//        self.idiomas = []
//        self.tracosRaca = []
//        self.profArmas = nil
//        self.profArmaduras = nil
//        self.profFerramentas = nil
//        self.profPericias = nil
//    }
//}
//
////MARK: Classe SubRaca
//public class SubRaca : Raca {
//    var tipoSubRaca: TipoSubRaca //MARK: trocar para skills json depois
//    var subracaNome: String
//    var tracosSubraca: [String]
//    
//    init(tipoRaca: TipoRaca, tipoSubRaca: TipoSubRaca) {
//        self.tipoSubRaca = tipoSubRaca
//        self.subracaNome = tipoSubRaca.rawValue
//        self.tracosSubraca = []
//        super.init(tipoRaca: tipoRaca)
//    }
//}
