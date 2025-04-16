//
//  Animate_RotationEffect.swift
//  BigMountain
//
//  Created by Pongt Chia on 16/4/25.
//

import SwiftUI

struct Animate_RotationEffect: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Properties",
                subtitle: "Rotation Effect",
                desc: "Rotations are also animatable."
            )
            
            Button("Change") {
                change.toggle()
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.blue)
                .frame(width: 300, height: 200)
                .overlay {
                    Image(systemName: "arrow.right")
                        .foregroundStyle(.black)
                }
                .rotationEffect(Angle.degrees(change ? 220 : 0))
                .animation(.default, value: change)
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Animate_RotationEffect()
}
