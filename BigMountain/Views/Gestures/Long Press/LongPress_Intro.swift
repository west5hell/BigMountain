//
//  LongPress_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 30/3/25.
//

import SwiftUI

struct LongPress_Intro: View {
    @State private var isLongPress = false
    @State private var isPressing = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Gestures",
                subtitle: "Long Press Intro",
                desc: "Use a long press gesture to perform some action after the user has pressed on a view for a certain amount of time."
            )
            
            Text("Long press to open")
            
            Image(systemName: isLongPress ? "lock.open.fill" : "lock.fill")
                .font(.system(size: 100))
                .padding()
                .foregroundStyle(isLongPress ? .red : .orange)
                .onLongPressGesture(minimumDuration: 1) {
                    self.isLongPress.toggle()
                } onPressingChanged: { isPressing in
                    self.isPressing = isPressing
                }
            
            Text("Keep pressing!")
                .opacity(isPressing ? 1 : 0)
        }
        .font(.title)
    }
}

#Preview {
    LongPress_Intro()
}
