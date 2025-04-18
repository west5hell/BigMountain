//
//  Trigger_Slider.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Trigger_Slider: View {
    @State private var blueWidth: CGFloat = 50.0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Triggers",
                subtitle: "Slider",
                desc: "When adjusting a slider, there may be some UI element you are changing that can be animated."
            )
            
            HStack(spacing: 0) {
                Color.blue
                    .frame(width: blueWidth)
                Color.green
            }
            .animation(.default, value: blueWidth)
            
            Slider(value: $blueWidth, in: 0...410, step: 1)
                .padding()
        }
        .font(.title)
    }
}

#Preview {
    Trigger_Slider()
}
