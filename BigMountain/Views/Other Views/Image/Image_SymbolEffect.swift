//
//  Image_SymbolEffect.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Image_SymbolEffect: View {
    @State private var start = false
    
    var body: some View {
        List {
            Label {
                Text("Variable Color")
            } icon: {
                Image(systemName: "airplayaudio")
                    .foregroundStyle(.teal)
                    .symbolEffect(.variableColor)
            }

            Label {
                Text("Pulse on Exclamation")
            } icon: {
                Image(systemName: "airplayaudio.badge.exclamationmark")
                    .foregroundStyle(.red, .teal)
                    .symbolEffect(.pulse)
            }

            Label {
                Text("Pulse")
            } icon: {
                Image(systemName: "lightbulb.max.fill")
                    .foregroundStyle(.teal)
                    .symbolEffect(
                        .bounce,
                        options: .repeat(.periodic(2)),
                        value: start
                    )
            }
            
            Button("Start") {
                start.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .listStyle(.plain)
        .listRowSpacing(60)
        .font(.title)
    }
}

#Preview {
    Image_SymbolEffect()
}
