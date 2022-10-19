//
//  AtributosUtils.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 19/10/22.
//

import Foundation

public class AtributosUtils {
    public static func possuiProficiencia(atributosProficientes: [AtributosSalvaguarda], atributoAvaliado: AtributosSalvaguarda) -> Bool {
        return atributosProficientes.contains(atributoAvaliado)
    }
}
