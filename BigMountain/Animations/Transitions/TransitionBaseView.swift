//
//  TransitionBaseView.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/4/25.
//

import SwiftUI

struct TransitionBaseView<Content: View>: View {
    @ViewBuilder let content: Content
    
    let title = "Transitions"
    let subtitle = ""
    let desc = ""
    
    var body: some View {
        ZStack {
            Color("DarkAccent2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(title, subtitle: subtitle, desc: desc)
                
                content
            }
        }
    }
}
