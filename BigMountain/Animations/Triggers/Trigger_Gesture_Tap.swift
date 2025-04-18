//
//  Trigger_Gesture_Tap.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Trigger_Gesture_Tap: View {
    @State private var isOn = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Triggers",
                subtitle: "Tap Gesture",
                desc: "Like a button, you can respond to tap gestures and animate changes on the UI."
            )
            
            Spacer()
            
            Circle()
                .fill(isOn ? .green : .red)
                .frame(width: 200, height: 200)
                .overlay {
                    Text("ON")
                        .opacity(isOn ? 1 : 0)
                }
                .overlay {
                    Text("OFF")
                        .foregroundStyle(.white)
                        .opacity(isOn ? 0 : 1)
                }
                .onTapGesture(count: 2) {
                    isOn.toggle()
                }
                .shadow(color: isOn ? .green : .red, radius: 50)
                .animation(.default, value: isOn)
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Trigger_Gesture_Tap()
}
