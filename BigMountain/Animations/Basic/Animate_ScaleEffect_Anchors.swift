//
//  Animate_ScaleEffect_Anchors.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/4/25.
//

import SwiftUI

struct Animate_ScaleEffect_Anchors: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Properties",
                subtitle: "Scale From Anchors",
                desc: "You can scale around an anchor of your choosing. The default is scaling from the center anchor."
            )
            
            Button("Change") {
                change.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .overlay {
                    Text("Scale from top")
                        .foregroundStyle(.white)
                }
                .scaleEffect(change ? 1 : 0.25, anchor: .top)
                .animation(.default, value: change)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .overlay {
                    Text("Scale from right")
                        .foregroundStyle(.white)
                }
                .scaleEffect(change ? 0.25 : 1, anchor: .trailing)
                .animation(.easeIn, value: change)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .overlay {
                    Text("Scale from bottom left")
                        .foregroundStyle(.white)
                }
                .scaleEffect(change ? 1 : 0.5, anchor: .bottomLeading)
                .animation(.bouncy, value: change)
        }
        .font(.title)
    }
}

#Preview {
    Animate_ScaleEffect_Anchors()
}
