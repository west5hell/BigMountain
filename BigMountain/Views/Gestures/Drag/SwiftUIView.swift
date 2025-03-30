//
//  DragDesture_OnEnded.swift
//  BigMountain
//
//  Created by Pongt Chia on 30/3/25.
//

import SwiftUI

struct DragDesture_OnEnded: View {
    @State private var circlePosition = CGPoint(x: 55, y: 55)
    @State private var circleLabel = "55, 55"
    @GestureState private var isDragging = false
    @State private var isOK = true
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Gestures",
                subtitle: "Drag - OnEnded",
                desc: "When the gesture has completed, use the onEnded callback to perform some action."
            )
            
            Text("Drag the circle")
            Text("isDragging: \(isDragging.description)")
            Circle()
                .fill(isDragging ? .orange : .blue)
                .frame(width: 100, height: 100)
                .opacity(0.8)
                .overlay {
                    Text(circleLabel)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                }
                .position(circlePosition)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.circlePosition = value.location
                            self.circleLabel = "\(Int(value.location.x)), \(Int(value.location.y))"
                        })
                        .updating($isDragging, body: { value, state, transaction in
                            //  You don't update isDragging directly. It's read-only. Instead, you update state. The state updates the isDragging.
                            state = true
                        })
                        .onEnded({ value in
                            self.isOK = value.location.x < 200 ? true : false
                        })
                )
                .background(isOK ? .clear : .pink)
            Text("Updating uses GestureState as a parameter. GestureState resets whatever value it is given when the gesture has ended.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
        }
        .font(.title)
    }
}

#Preview {
    DragDesture_OnEnded()
}
