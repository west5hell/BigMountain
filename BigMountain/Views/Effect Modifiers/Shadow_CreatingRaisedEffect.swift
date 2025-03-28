//
//  Shadow_CreatingRaisedEffect.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/3/25.
//

import SwiftUI

struct Shadow_CreatingRaisedEffect: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Anna Petrova").bold()
                Text("Moscow").font(.caption)
            }
            .frame(width: 350, height: 100)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray)
                    .shadow(color: .gray, radius: 4, x: -4, y: -4)
                    .shadow(radius: 4, x: 4, y: 4)
            )
            
            HStack(spacing: 50) {
                Button(action: {}) {
                    Image(systemName: "lightbulb")
                }
                .frame(width: 80, height: 80)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.orange)
                    // Note: The shadow goes on the background, not the button.
                        .shadow(color: .gray, radius: 3, x: -4, y: -4)
                        .shadow(radius: 3, x: 4, y: 4))
            }
        }
        .font(.title)
    }
}

#Preview {
    Shadow_CreatingRaisedEffect()
}
