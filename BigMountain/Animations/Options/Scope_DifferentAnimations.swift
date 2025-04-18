//
//  Scope_DifferentAnimations.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Scope_DifferentAnimations: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Options",
                subtitle: "Scope - Different Animations",
                desc: "With the animation modifier on the top-most parent, all children views will animate. To override the animation, just use another animation modifier."
            )
            .layoutPriority(1)
            
            Button("Change") {
                change.toggle()
            }
            
            Text("Uses Parent Animation")
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(change ? .yellow : .red)
                .frame(width: 100, height: 100)
                .offset(x: change ? 140 : -140, y: 0)
            
            Text("Use Own Animation")
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(change ? .yellow : .orange)
                .frame(width: 100, height: 100)
                .offset(x: change ? 140 : -140, y: 0)
                .animation(.easeIn, value: change)
        }
        .font(.title)
        .animation(.easeOut, value: change)
    }
}

#Preview {
    Scope_DifferentAnimations()
}
