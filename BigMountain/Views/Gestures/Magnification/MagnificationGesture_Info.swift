//
//  MagnificationGesture_Info.swift
//  BigMountain
//
//  Created by Pongt Chia on 30/3/25.
//

import SwiftUI

struct MagnificationGesture_Info: View {
    @GestureState var scale: CGFloat = 1
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Gestures",
                subtitle: "Magnification Gesture -Intro",
                desc: "You can connect the scale effect to the magnification's magnitude property to zoom in or out on a view."
            )
            
            Text("Pinch Zoom")
            
            Spacer()
            
            Image("刘宝瑞")
                .scaleEffect(scale)
                .gesture(
                    MagnificationGesture()
                        .updating($scale, body: { value, state, transaction in
                            state = value.magnitude
                        })
                )
            
            Spacer()
            Text("Magnification: \(scale)")
        }
        .font(.title)
    }
}

#Preview {
    MagnificationGesture_Info()
}
