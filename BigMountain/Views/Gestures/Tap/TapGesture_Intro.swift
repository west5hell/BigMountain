//
//  TapGesture_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 30/3/25.
//

import SwiftUI

struct TapGesture_Intro: View {
    @State private var hasDoubleTapped = false
    @State private var hasTripleTapped = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Gestures",
                subtitle: "Tap Gesture",
                desc: "Tap gestures can make views similar to buttons. The user can tap a view and you can perform some action. But where they are different is that you can specify HOW MANY TAPS before the action happens."
            )
            
            Text("Doube-tap the envelope to open")
            
            Image(systemName: hasDoubleTapped ? "envelope.open.fill" : "envelope.fill")
                .font(.system(size: 100))
                .padding()
                .foregroundStyle(hasTripleTapped ? .orange : .pink)
                .onTapGesture(count: 2) {
                    self.hasDoubleTapped.toggle()
                }
                .onTapGesture(count: 3) {
                    self.hasTripleTapped.toggle()
                }
        }
        .font(.title)
    }
}

#Preview {
    TapGesture_Intro()
}
