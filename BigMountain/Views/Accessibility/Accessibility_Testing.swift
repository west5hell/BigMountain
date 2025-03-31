//
//  Accessibility_Testing.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI

struct Accessibility_Testing: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Accessibility",
                subtitle: "Testing",
                desc: "Use the accessibility Inspector to test Voiceover."
            )
            
            Text("Hello, new user!")
            Image(systemName: "hand.wave.fill")
                .font(Font.system(size: 50))
        }
        .font(.title)
    }
}

#Preview {
    Accessibility_Testing()
}
