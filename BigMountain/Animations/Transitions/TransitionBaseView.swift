//
//  TransitionBaseView.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/4/25.
//

import SwiftUI

struct TransitionBaseView<Content: View>: View {
    var title = "Transitions"
    var subtitle = ""
    var desc = ""
    
    @ViewBuilder let content: Content
    
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

extension AnyTransition {
    static var zoomInAndOut: AnyTransition {
        .asymmetric(
            insertion: 
                    .scale(scale: 0.1, anchor: .topTrailing)
                    .combined(with: .offset(y: 120)),
            removal: 
                    .scale(scale: 0.2)
                    .combined(with: .opacity)
        )
    }
    
    static func zoomIn(from anchor: UnitPoint) -> AnyTransition {
        .asymmetric(
            insertion:
                    .scale(scale: 0.1, anchor: anchor)
                    .combined(with: .offset(y: 120)),
            removal:
                    .scale(scale: 0.2)
                    .combined(with: .opacity)
        )
    }
}
