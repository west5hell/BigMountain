//
//  Animate_RotationEffect_Anchors.swift
//  BigMountain
//
//  Created by Pongt Chia on 16/4/25.
//

import SwiftUI

struct Animate_RotationEffect_Anchors: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Properties",
                subtitle: "Rotation Around Anchors",
                desc: "You can rotate around an anchor of your choosing. The default is rotating around the center anchor."
            )
            
            Button("Change") {
                change.toggle()
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .shadow(radius: 8)
                .frame(width: 320, height: 200)
                .overlay {
                    Text("Rotate from top left")
                        .foregroundStyle(.white)
                }
                .rotationEffect(Angle.degrees(change ? 220 : 0), anchor: .topLeading)
                .animation(.default, value: change)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .shadow(radius: 8)
                .frame(width: 320, height: 200)
                .overlay {
                    Text("Rotate from bottom right")
                        .foregroundStyle(.white)
                }
                .rotationEffect(Angle.degrees(change ? 220 : 0), anchor: .bottomTrailing)
                .animation(.default, value: change)
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Animate_RotationEffect_Anchors()
}
