//
//  View+Extension.swift
//  MiniChallenge001
//
//  Created by Victor Levenetz Mariano on 22/09/22.
//

import Foundation
import SwiftUI

extension View {
    func scrollEnabled(enabled: Bool) -> some View{
        self.onAppear {
            UITableView.appearance().isScrollEnabled = enabled
        }
    }   
}
