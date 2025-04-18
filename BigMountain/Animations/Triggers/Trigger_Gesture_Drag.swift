//
//  Trigger_Gesture_Drag.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Trigger_Gesture_Drag: View {
    @GestureState private var menuOffset = CGSize.zero
    @State private var currentMenuY: CGFloat = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Triggers",
                subtitle: "Drag Gesture",
                desc: "Dragging a view will move it but you can add animation to complete moving a view into its final location smoothly."
            )
            
            Spacer()
            
            VStack {
                Circle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                    .overlay {
                        Image(systemName: "line.horizontal.3")
                            .foregroundStyle(.white)
                            .offset(x: 0, y: -20)
                    }
                    .offset(x: 0, y: -50)
                
                HStack {
                    Spacer()
                }
                Spacer()
            }
            .frame(height: 200)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.green)
            )
            .offset(x: 0, y: currentMenuY + menuOffset.height)
            .gesture(
                DragGesture()
                    .updating($menuOffset, body: { value, menuOffset, transaction in
                        menuOffset = value.translation
                    })
                    .onEnded({ value in
                        if value.translation.height > 100 {
                            currentMenuY = 200
                        } else {
                            currentMenuY = 0
                        }
                    })
            )
            .animation(.default, value: currentMenuY)
        }
        .font(.title)
    }
}

#Preview {
    Trigger_Gesture_Drag()
}
