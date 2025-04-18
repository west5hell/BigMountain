//
//  Scope_ChangeSizeInParent.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Scope_ChangeSizeInParent: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Options",
                subtitle: "Change Size in Parent",
                desc: "Put the animation modifier on the parent so all views animate when one changes."
            )
            .layoutPriority(1)
            
            HStack {
                Color.yellow
                VStack {
                    Color.yellow
                        .frame(minHeight: 20)
                    Color.green
                        .frame(width: change ? 200 : 100, height: change ? 250 : 100)
                    Color.yellow
                        .frame(minHeight: 20)
                }
                Color.yellow
            }
            
            Color.yellow
            
            Button("Change") {
                change.toggle()
            }
        }
        .font(.title)
        .animation(.default, value: change)
    }
}

#Preview {
    Scope_ChangeSizeInParent()
}
