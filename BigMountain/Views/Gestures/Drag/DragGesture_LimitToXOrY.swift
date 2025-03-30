//
//  DragGesture_LimitToXOrY.swift
//  BigMountain
//
//  Created by Pongt Chia on 30/3/25.
//

import SwiftUI

struct DragGesture_LimitToXOrY: View {
    @State private var currentSliderPositionX: CGFloat = 0
    @GestureState private var slideOffset = CGSize.zero
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Gestures",
                subtitle: "Limit to X Axis",
                desc: "You might want to limit the drag of your view so the user can only drag horizontally or vertically."
            )
            
            Text("slideOffset: \(Int(slideOffset.width)), \(Int(slideOffset.height))")
            Text("currentSliderPositionX: \(Int(currentSliderPositionX))")
            
            GeometryReader { gr in
                HStack {
                    Spacer()
                    Image(systemName: "line.horizontal.3")
                        .rotationEffect(.degrees(90))
                }
                .foregroundStyle(.white)
                .frame(height: 300)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                )
                .offset(x: self.currentSliderPositionX + self.slideOffset.width)
                .gesture(
                    DragGesture()
                        .updating(self.$slideOffset, body: { value, state, transaction in
                            state = value.translation
                        })
                        .onEnded({ value in
                            if value.translation.width < -gr.size.width * 0.6 {
                                self.currentSliderPositionX = 50 - gr.size.width
                            } else {
                                self.currentSliderPositionX = 0
                            }
                        })
                )
                .animation(.default, value: slideOffset)
            }
        }
        .font(.title)
    }
}

#Preview {
    DragGesture_LimitToXOrY()
}
