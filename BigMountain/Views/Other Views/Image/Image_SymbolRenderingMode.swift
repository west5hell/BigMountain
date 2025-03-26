//
//  Image_SymbolRenderingMode.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Image_SymbolRenderingMode: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Image - Symbols",
                subtitle: "SymbolRenderingMode",
                desc: "The symbolRenderingMode modifier gives you more control over how SF Symbols will be drawn.",
                back: .red
            )
            
            Label("Monochrome", systemImage: "gauge.badge.plus")
                .symbolRenderingMode(.monochrome)
            Label("Multicolor", systemImage: "gauge.badge.plus")
                .symbolRenderingMode(.multicolor)
            Label("Hierarchical", systemImage: "gauge.badge.plus")
                .symbolRenderingMode(.hierarchical)
            Label("Palette", systemImage: "gauge.badge.plus")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.red, .purple.opacity(0.8))
        }
        .font(.title)
    }
}

#Preview {
    Image_SymbolRenderingMode()
}
