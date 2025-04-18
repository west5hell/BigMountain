//
//  Trigger_Stepper.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Trigger_Stepper: View {
    @State private var stepperValue: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Triggers",
                subtitle: "Stepper",
                desc: "The stepper increments and decrements values which can be applied to a number of modifiers and then animated."
            )
            
            ZStack {
                ForEach(0...40, id: \.self) { _ in
                    Circle()
                        .foregroundStyle(.green)
                        .opacity(0.2)
                        .frame(
                            width: .random(in: 10...100),
                            height: .random(in: 10...100)
                        )
                        .position(
                            x: .random(in: stepperValue...400),
                            y: .random(in: stepperValue...400)
                        )
                        .animation(.default, value: stepperValue)
                }
            }
            
            Stepper("Adjust", value: $stepperValue, in: 1.0...5.0)
                .padding()
        }
        .font(.title)
    }
}

#Preview {
    Trigger_Stepper()
}
