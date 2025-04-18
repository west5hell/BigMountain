//
//  Scope_ParentAndChildren.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Scope_ParentAndChildren: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Options",
                subtitle: "Scope - Parent & Children",
                desc: "The animation modifier can go on a parent view to animate all children within."
            )
            .layoutPriority(1)
            
            HStack {
                Color.blue
                    .hueRotation(.degrees(change ? 180 : 0))
                Color.green
                    .hueRotation(.degrees(change ? 180 : 0))
                Color.red
                    .hueRotation(.degrees(change ? 180 : 0))
            }
            .animation(.linear, value: change)
            
            Button("Change") {
                change.toggle()
            }
        }
        .font(.title)
    }
}

#Preview {
    Scope_ParentAndChildren()
}
