//
//  Value_Introduction.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Value_Introduction: View {
    @State private var change = false
    @State private var animateOnChange = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Value",
                subtitle: "Introduction",
                desc: "The first parameter for the animation modifier is the Animation itself. The second parameter is 'value'. It's optional. When you change this value, the animation takes effect. If it doesn't change since the last animation, then there will be no animtion. It HAS to change for the animation to happen."
            )
            
            Button("Change") {
                change.toggle()
                
                if change {
                    animateOnChange.toggle()
                }
            }
            
            Circle()
                .fill(.blue)
                .frame(width: 100, height: 100)
                .offset(x: change ? 150 : -150)
                .animation(.easeIn(duration: 2), value: animateOnChange)
        }
        .font(.title)
    }
}

#Preview {
    Value_Introduction()
}
