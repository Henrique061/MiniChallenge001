//
//  CustomNavigationView.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 19/10/22.
//

import SwiftUI

struct CustomNavigationView<Content>: View where Content: View {
    
    @ViewBuilder private var content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                content()
            }
        } else {
            NavigationView {
                content()
            }
        }
    }
}
