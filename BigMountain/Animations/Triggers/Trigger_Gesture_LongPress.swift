//
//  Trigger_Gesture_LongPress.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Trigger_Gesture_LongPress: View {
    @State private var isLongPressed = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Triggers",
                subtitle: "Long Press Gesture",
                desc: "You can start an animation with a long press gesture."
            )
            
            Spacer()
            
            Circle()
                .fill(isLongPressed ? .blue : .green)
                .frame(width: 200, height: 200)
                .overlay {
                    Text("Long Press")
                }
                .overlay {
                    Circle()
                        .stroke(.black, lineWidth: 5)
                        .scaleEffect(isLongPressed ? 2 : 1)
                        .opacity(isLongPressed ? 0 : 1)
                }
                .onLongPressGesture {
                    isLongPressed.toggle()
                }
                .animation(.default, value: isLongPressed)
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Trigger_Gesture_LongPress()
}
