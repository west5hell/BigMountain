//
//  Curve_CurveBelow.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct Curve_CurveBelow: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color("Background3")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Custom Timing Curve",
                    subtitle: "Curve Below",
                    desc: "The animation will backup before moving forward."
                )
                
                Spacer()
                
                Button("Send") {
                    show = true
                }
                Spacer()
            }
            .font(.title)
            .tint(Color("Accent3"))
            
            if show {
                VStack {
                    Text("Send a bike?")
                        .font(.title)
                    Image("Phone")
                    HStack {
                        Button("Yes, Send Now") {
                            withAnimation(.timingCurve(0, -0.3, 1, 0, duration: 0.6)) {
                                show = false
                            }
                        }
                        .padding()
                        .foregroundStyle(Color("Foreground3"))
                        .background(
                            Capsule()
                                .fill(Color("Accent3"))
                        )
                        
                        Button("Cancel") {
                            show = false
                        }
                        .foregroundStyle(Color("Accent3"))
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("Background3"))
                        .shadow(radius: 8)
                )
                .transition(.slide)
                .zIndex(1)
            }
        }
    }
}

#Preview {
    Curve_CurveBelow()
}
