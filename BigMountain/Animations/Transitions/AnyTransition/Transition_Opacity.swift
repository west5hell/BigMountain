//
//  Transition_Opacity.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/4/25.
//

import SwiftUI

struct Transition_Opacity: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Transition",
                    subtitle: "Opacity",
                    desc: "Use opacity to fade a view in and out."
                )
                
                Button("Change") {
                    change.toggle()
                }
                
                Spacer()
                
                Group {
                    if change {
                        Image("Phone")
                            .transition(.opacity.animation(.easeInOut(duration: 1)))
                    }
                }
                
                Spacer()
            }
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

#Preview {
    Transition_Opacity()
}
