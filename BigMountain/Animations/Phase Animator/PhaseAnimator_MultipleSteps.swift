//
//  PhaseAnimator_MultipleSteps.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/4/25.
//

import SwiftUI

struct PhaseAnimator_MultipleSteps: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 60) {
            Button {
                change.toggle()
            } label: {
                Image(systemName: "dollarsign.circle")
                    .padding(4)
            }
            .phaseAnimator(Phases.allCases, trigger: change) { content, phase in
                content
                    .rotationEffect(phase.rotation)
                    .foregroundStyle(change ? Color.primary : Color.blue)
                    .background(change ? .green : .clear, in: Circle())
                    .scaleEffect(phase.scale)
            } animation: { phase in
                switch phase {
                case .step1, .step3: .snappy(duration: 0.8)
                case .step2: .bouncy(extraBounce: 0.3)
                }
            }
        }
        .font(.system(size: 100))
    }
}

#Preview {
    PhaseAnimator_MultipleSteps()
}

enum Phases: CaseIterable {
    case step1
    case step2
    case step3
    
    var rotation: Angle {
        switch self {
        case .step1, .step3: .zero
        case .step2: .degrees(180)
        }
    }
    
    var scale: Double {
        switch self {
        case .step1: 1
        case .step2, .step3: 2
        }
    }
}
