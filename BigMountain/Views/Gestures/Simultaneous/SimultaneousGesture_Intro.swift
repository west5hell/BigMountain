//
//  SimultaneousGesture_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 30/3/25.
//

import SwiftUI

struct SimultaneousGesture_Intro: View {
    @State private var degrees = 0.0
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Gestures",
                subtitle: "Combining Gestures",
                desc: "To combine gestures, use the simultaneously function available on gestures."
            )
            
            Text("Zoom AND Rotate")
            
            Image("刘宝瑞")
                .scaleEffect(scale)
                .rotationEffect(.degrees(degrees))
                .gesture(
                    MagnificationGesture()
                        .simultaneously(with: RotationGesture())
                        .onChanged({ value in
                            self.scale = value.first ?? 1.0
                            self.degrees = value.second?.degrees ?? 0.0
                        })
                )
            Text("Rotation: \(degrees)")
            Text("Magnification: \(scale)")
        }
        .font(.title)
    }
}

#Preview {
    SimultaneousGesture_Intro()
}
