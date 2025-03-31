//
//  HighPriorityGesture_Before.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI

struct HighPriorityGesture_Before: View {
    @State private var alternateBackground = false
    @State private var alternateCircleColor = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Gestures",
                subtitle: "High Priority Gesture - Before",
                desc: "Here is a scenario where you have two gestures. You can double-tap the background or the circle. They work independently of each other."
            )
            
            Circle()
                .fill(alternateCircleColor ? .pink : .green)
                .frame(width: 200, height: 200)
                .overlay {
                    Text("Double-Tap")
                }
                .onTapGesture(count: 2) {
                    self.alternateCircleColor.toggle()
                }
            
            Spacer()
            
            Text("Double-Tap")
                
            Spacer()
        }
        .font(.title)
        .background(alternateBackground ? .gray : .brown)
        .onTapGesture(count: 2) {
            self.alternateBackground.toggle()
        }
    }
}

#Preview {
    HighPriorityGesture_Before()
}
