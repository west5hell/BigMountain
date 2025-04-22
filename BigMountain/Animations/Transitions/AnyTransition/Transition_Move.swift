//
//  Transition_Move.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/4/25.
//

import SwiftUI

struct Transition_Move: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Transition",
                    subtitle: "Move",
                    desc: "Move the view into view from the edge specified."
                )
                
                Button("Change") {
                    change.toggle()
                }
                
                Spacer()
                
                Group {
                    if change {
                        Image("Phone")
                            .transition(.move(edge: .bottom))
                    }
                }
                .animation(.easeInOut(duration: 1), value: change)
                
                Spacer()
            }
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

#Preview {
    Transition_Move()
}
