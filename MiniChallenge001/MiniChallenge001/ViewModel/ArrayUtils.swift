//
//  ArrayUtils.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 18/10/22.
//

import Foundation

public class ArrayUtils<T> {
    
    public static func formatarParaString(arr: [T]) -> String {
        
        var temp: String = ""
        
        for i in 0..<arr.count {
            if i < arr.count - 1 {
                temp += "\(arr[i]), "
            } else {
                temp += "\(arr[i])"
            }
        }
        
        return temp
    }
    
    public static func formatarIdiomaString(idiomasAlfabeto: [IdiomaAlfabeto]) -> String {
        var temp = ""
        
        for i in 0..<idiomasAlfabeto.count {
            if i < idiomasAlfabeto.count - 1 {
                temp += "\(idiomasAlfabeto[i].idioma.rawValue), "
            } else {
                temp += "\(idiomasAlfabeto[i].idioma.rawValue)"
            }
        }
        
        return temp
    }
    
}
