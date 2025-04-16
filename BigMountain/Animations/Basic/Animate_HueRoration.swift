//
//  Animate_HueRoration.swift
//  BigMountain
//
//  Created by Pongt Chia on 16/4/25.
//

import SwiftUI

struct Animate_HueRoration: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Properties",
                subtitle: "Hue",
                desc: "Another way to change color is to change the hue on the color wheel by rotating the current point."
            )
            Image("ColorWheel")
                .resizable()
                .frame(width: 100, height: 100)
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.blue)
                    .padding()
                    .hueRotation(Angle.degrees(change ? 170 : 0))
                    .animation(.easeInOut, value: change)
                
                Image("")
                    .resizable()
                    .scaledToFit()
                    .hueRotation(Angle.degrees(change ? 170 : 0))
                    .animation(.easeInOut, value: change)
            }
            Button("Change") {
                change.toggle()
            }
            
        }
        .font(.title)
    }
}

#Preview {
    Animate_HueRoration()
}
