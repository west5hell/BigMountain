//
//  Rotation3DEffect.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/3/25.
//

import SwiftUI

struct Rotation3DEffect: View {
    @State private var degrees = 25.0
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.yellow)
                .overlay {
                    Text("45˚ Back on X Axis")
                        .font(.largeTitle)
                        .bold()
                }
                .rotation3DEffect(
                    Angle(degrees: 45),
                    axis: (x: 1, y: 0, z: 0)
                )
            RoundedRectangle(cornerRadius: 10)
                .fill(.yellow)
                .overlay {
                    Text("-45˚ Back on X Axis")
                        .font(.largeTitle)
                        .bold()
                }
                .rotation3DEffect(
                    Angle(degrees: -45),
                    axis: (x: 1, y: 0, z: 0)
                )
            RoundedRectangle(cornerRadius: 10)
                .fill(.yellow)
                .overlay {
                    Text("Move slider to adjust rotation")
                        .font(.largeTitle)
                        .bold()
                }
                .rotation3DEffect(
                    Angle(degrees: degrees),
                    axis: (x: 1, y: 0, z: 1),
                    anchor: .bottom
                )
            
            Slider(value: $degrees, in: -360...360, step: 1)
                .padding()
        }
    }
}

#Preview {
    Rotation3DEffect()
}
