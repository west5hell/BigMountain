//
//  PhaseAnimator_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/4/25.
//

import SwiftUI

struct PhaseAnimator_Intro: View {
    var body: some View {
        Label("Light Disconnected", systemImage: "exclamationmark.warninglight.fill")
            .phaseAnimator([false, true]) { content, phase in
                content
                    .foregroundStyle(phase ? .orange : .primary)
                    .scaleEffect(phase ? 1.1 : 1)
            } 
            .font(.title)
    }
}

#Preview {
    PhaseAnimator_Intro()
}

struct PhaseAnimator_CustomAnimation: View {
    var body: some View {
        Label("Light Disconnected", systemImage: "exclamationmark.warninglight.fill")
            .phaseAnimator([false, true]) { content, phase in
                content
                    .foregroundStyle(phase ? .orange : .primary)
                    .scaleEffect(phase ? 1.2 : 1)
            } animation: { phase in
                    .easeOut(duration: 1.4)
            }
            .font(.title)
    }
}
