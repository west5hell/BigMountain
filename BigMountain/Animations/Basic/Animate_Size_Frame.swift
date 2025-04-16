//
//  Animate_Size_Frame.swift
//  BigMountain
//
//  Created by Pongt Chia on 16/4/25.
//

import SwiftUI

struct Animate_Size_Frame: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Properties",
                subtitle: "Frame",
                desc: "You can animate the size of an object through the frame modifier's height and width parameters."
            )
            .layoutPriority(1)
            
            Button("Change") {
                change.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.blue)
                .frame(width: change ? 100 : 350, height: change ? 100 : 200)
            
            DescView("Notice how this changes the layout of the screen. You may want to consider animating with the scaleEffect instead.")
        }
        .font(.title)
        .animation(.default, value: change)
    }
}

#Preview {
    Animate_Size_Frame()
}
