//
//  PhaseAnimator_Trigger.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/4/25.
//

import SwiftUI

struct PhaseAnimator_Trigger: View {
    @State private var on = false
    
    var body: some View {
        VStack(spacing: 60) {
            Button {
                on.toggle()
            } label: {
                Text(on ? "Turn Off" : "Turn On")
            }
            .buttonStyle(.borderedProminent)
            .tint(on ? .red : .green)
            
            Label("Light \(on ? "On" : "Off")", systemImage: "exclamationmark.warninglight")
                .symbolVariant(on ? .fill : .none)
                .phaseAnimator([false, true], trigger: on) { content, phase in
                    let flashColor: Color = on ? .green : .red
                    
                    content
                        .foregroundStyle(phase ? flashColor : .primary)
                        .scaleEffect(phase ? 1.2 : 1)
                }
        }
        .font(.title)
    }
}

#Preview {
    PhaseAnimator_Trigger()
}
