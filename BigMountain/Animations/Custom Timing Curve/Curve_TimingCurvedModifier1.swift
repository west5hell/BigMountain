//
//  Curve_TimingCurvedModifier1.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct Curve_TimingCurvedModifier1: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("Background3")
                .ignoresSafeArea()
            
            VStack(spacing: 5) {
                HeaderView(
                    "Custom Timing Curve",
                    subtitle: "Introduction",
                    desc: "By defining the X & Y coordinates of the two Bezier handles of the curve, you can create a custom timing curve."
                )
                Image("")
                Spacer()
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(Color("Tertiary3"))
                    .frame(width: 100, height: 100)
                    .overlay {
                        Text("Linear")
                    }
                    .offset(x: change ? 140 : -140, y: 0)
                    .animation(.linear(duration: 1), value: change)
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(Color("Tertiary3"))
                    .frame(width: 100, height: 100)
                    .overlay {
                        Text("Custom")
                    }
                    .offset(x: change ? 140 : -140, y: 0)
                    .animation(.timingCurve(0.1, 0.7, 0.9, 0.3), value: change)
                
                Spacer()
                Button("Change") {
                    change.toggle()
                }
            }
            .font(.title)
            .tint(Color("Accent3"))
        }
    }
}

#Preview {
    Curve_TimingCurvedModifier1()
}
