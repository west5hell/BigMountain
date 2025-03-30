//
//  ExclusiveGesture_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 30/3/25.
//

import SwiftUI

struct ExclusiveGesture_Intro: View {
    struct StateForGestures {
        var degrees = 0.0
        var doubleTapped = false
    }
    
    @State private var stateForGestures = StateForGestures()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Gestures",
                subtitle: "Exclusive Gestures",
                desc: "If you want two gestures on your view but only ONE will work, then use the exclusive fucntion on the first gesture."
            )
            
            Text("Double-Tap OR Rotate")
            Image("刘宝瑞")
                .border(stateForGestures.doubleTapped ? .red : .clear)
                .shadow(radius: stateForGestures.doubleTapped ? 8 : 0)
                .rotationEffect(.degrees(stateForGestures.degrees))
                .gesture(
                    TapGesture(count: 2)
                        .onEnded({ () in
                            self.stateForGestures.doubleTapped.toggle()
                        })
                        .exclusively(
                            before: RotationGesture().onChanged({ angle in
                                self.stateForGestures.degrees = angle.degrees
                            })
                        )
                )
            Text("Rotation: \(stateForGestures.degrees)")
        }
        .font(.title)
    }
}

#Preview {
    ExclusiveGesture_Intro()
}
