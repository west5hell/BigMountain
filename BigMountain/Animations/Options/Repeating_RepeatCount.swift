//
//  Repeating_RepeatCount.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Repeating_RepeatCount: View {
    @State private var start = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Repeating",
                subtitle: "Repeat Count",
                desc: "You might want an animation to repeat only a certain number of times."
            )
            
            Spacer()
            
            Button("Start") {
                start.toggle()
            }
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.green, lineWidth: 4)
                    .scaleEffect(start ? 2 : 1)
                    .opacity(start ? 0 : 1)
            }
//            .animation(
//                .easeOut(duration: 0.6).repeatCount(3),
//                value: start
//            )
            //  Auto-Reverses
//            .animation(
//                .easeOut(duration: 0.6).repeatCount(3, autoreverses: false),
//                value: start
//            )
            //  Repeat Forever…and ever
            .animation(
                .easeOut(duration: 0.6).repeatForever(),
                value: start
            )
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Repeating_RepeatCount()
}
