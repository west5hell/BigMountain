//
//  Transition_Scale.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/4/25.
//

import SwiftUI

struct Transition_Scale: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Transition",
                    subtitle: "Scale",
                    desc: "Come into view from the scale specified."
                )
                
                Button("Change") {
                    change.toggle()
                }
                
                Spacer()
                
                Group {
                    if change {
                        Image("Phone")
                            .transition(.scale(scale: 3).animation(.default))
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
    Transition_Scale()
}
