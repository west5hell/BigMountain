//
//  Image_ForegroundStyle.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Image_ForegroundStyle: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Image - Symbols",
                subtitle: "ForegroundStyle",
                desc: "Use the foregroundStyle modifier to specify different colors for a multi-color symbol.",
                back: .red
            )
            .layoutPriority(1)
            
            List {
                Label("Green", systemImage: "gauge.badge.plus")
                    .foregroundStyle(.green)
                Label("Green, Red", systemImage: "gauge.badge.plus")
                    .foregroundStyle(.green, .red)
                Label("Green, Red, Yellow", systemImage: "arrow.uturn.backward")
                    .foregroundStyle(.green, .red, .yellow)
                Label("Green, Red, Yellow", systemImage: "arrow.uturn.backward.circle")
                    .foregroundStyle(.green, .red, .yellow)
                Label("Green, Red, Yellow", systemImage: "arrow.uturn.backward.circle.fill")
                    .foregroundStyle(.green, .red, .yellow)
            }
            
            DescView(
                "Hint: Most symbols just use two colors. The second color could be Secondary or Tertiary.",
                back: .red
            )
        }
        .font(.title)
    }
}

#Preview {
    Image_ForegroundStyle()
}
