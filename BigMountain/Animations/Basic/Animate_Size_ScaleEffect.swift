//
//  Animate_Size_ScaleEffect.swift
//  BigMountain
//
//  Created by Pongt Chia on 16/4/25.
//

import SwiftUI

struct Animate_Size_ScaleEffect: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Properties",
                subtitle: "Scale Effect",
                desc: "You can animate the size of an object through the scaleEffect modifier values."
            )
            
            Button("Change") {
                change.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.blue)
                .padding()
                .scaleEffect(change ? 0.1 : 1)
                .animation(.default, value: change)
            
            DescView("Notice how scaleEffect does NOT modify the layout")
        }
        .font(.title)
    }
}

#Preview {
    Animate_Size_ScaleEffect()
}
