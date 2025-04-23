//
//  ShiftingViews_Problem.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct ShiftingViews_Problem: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Transitions",
                    subtitle: "Shifting Views Problem",
                    desc: "Transitions work with views that are inserted and removed from the screen (view hierarchy). Insertion and removal will adjust views around them.",
                    back: Color("DarkAccent2"),
                    textColor: Color("LightShade2")
                )
                
                Button("Change") {
                    change.toggle()
                }
                
                DescView("Notice what happens when the view is inserted here.")
            }
            
            if change {
                Image("Phone")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("LightShade2"))
                            .shadow(radius: 20)
                    )
                    .offset(y: -65)
                    .zIndex(1)
                    .transition(.slide.combined(with: .opacity))
            }
        }
        .animation(.default, value: change)
        .font(.title)
        .tint(Color("Accent2"))
    }
}

#Preview {
    ShiftingViews_Problem()
}
