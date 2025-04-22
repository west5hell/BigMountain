//
//  Transition_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/4/25.
//

import SwiftUI

struct Transition_Intro: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea(edges: .vertical)
            
            VStack(spacing: 20) {
                HeaderView(
                    "Transitions",
                    subtitle: "Introduction",
                    desc: "Use the transition modifier to specify how a view enters and exits the screen."
                )
                
                Button("Change") {
                    change.toggle()
                }
                
                Spacer()
                
                Group {
                    if change {
                        Image("Phone")
                            .transition(AnyTransition.slide)
                    }
                }
                .animation(.default, value: change)
                
                Spacer()
            }
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

#Preview {
    Transition_Intro()
}
