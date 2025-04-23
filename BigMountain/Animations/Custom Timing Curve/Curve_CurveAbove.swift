//
//  Curve_CurveAbove.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct Curve_CurveAbove: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color("Background3")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Custom Timing Curve",
                    subtitle: "Curve Above",
                    desc: "The view goes BEYOND its destination then comes back."
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
                            show = false
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
        .animation(.timingCurve(0, 0, 0, 1.5, duration: 0.8), value: show)
    }
}

#Preview {
    Curve_CurveAbove()
}
