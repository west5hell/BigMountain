//
//  HighPriorityGesture_After.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI

struct HighPriorityGesture_After: View {
    @State private var alternateBackground = false
    @State private var alternateCircleColor = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Gestures",
                subtitle: "High Priority Gesture - Before",
                desc: "The tap gesture on the circle no longer works because the gesture on the parent now has priority."
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
        .background(alternateBackground ? .gray : .teal)
//        .onTapGesture(count: 2) {
//            self.alternateBackground.toggle()
//        }
        .highPriorityGesture(
            TapGesture(count: 2)
                .onEnded({ _ in
                    self.alternateBackground.toggle()
                })
        )
    }
}

#Preview {
    HighPriorityGesture_After()
}
