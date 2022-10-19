//
//  FormatterUtils.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 19/10/22.
//

import SwiftUI
import Foundation

public class FormatterUtils {
    
    public static func formatarPeso(num: Float) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        formatter.decimalSeparator = ","
        
        let nsnum = NSNumber(value: num)

        guard let pesoStr = formatter.string(from: nsnum) else {
            return "-"
        }
        
        return "\(pesoStr) kg"
    }
}
