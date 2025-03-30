//
//  RotationGestue_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 30/3/25.
//

import SwiftUI

struct RotationGestue_Intro: View {
    @State private var degrees = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Gestures",
                subtitle: "Rotation Gesture - Intro",
                desc: "You can track the rotation from gestures and apply that rotation to a view."
            )
            
            Text("Rotation: \(degrees)")
            Spacer()
            
            ZStack(alignment: .bottom) {
                Image(systemName: "lock")
                    .font(.system(size: 500))
                    .foregroundStyle(.green)
                
                Image(systemName: "timelapse")
                    .font(.system(size: 120))
                    .rotationEffect(Angle.degrees(degrees))
                    .gesture(
                        RotationGesture()
                            .onChanged({ angle in
                                self.degrees = angle.degrees
                            })
                    )
                    .padding(30)
                    .background(Circle().fill(.green))
                    .padding(.bottom, 45)
            }
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

#Preview {
    RotationGestue_Intro()
}
