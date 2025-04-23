//
//  Curve_TimingCurveModifier2.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct Curve_TimingCurveModifier2: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("Background3")
                .ignoresSafeArea()
            
            VStack(spacing: 5) {
                HeaderView(
                    "Custom Timing Curve",
                    subtitle: "Another Example",
                    desc: "Here is how you would define a timing curve that's really fast at the beginning."
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
                    .animation(.timingCurve(0, 0.85, 0.15, 1, duration: 1), value: change)
                
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
    Curve_TimingCurveModifier2()
}
