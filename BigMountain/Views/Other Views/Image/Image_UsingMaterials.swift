//
//  Image_UsingMaterials.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Image_UsingMaterials: View {
    var body: some View {
        ZStack {
            Image("刘宝瑞")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Image - Symbols",
                    subtitle: "Using Materials",
                    desc: "Materials are also ShapeStyles which means they too can be applied to symbols.",
                    back: .red
                )
                .background(.bar)
                
                HStack {
                    Image(systemName: "bookmark.square.fill")
                        .foregroundStyle(.secondary)
                    Image(systemName: "bookmark.square.fill")
                        .foregroundStyle(.tertiary)
                    Image(systemName: "bookmark.square.fill")
                        .foregroundStyle(.quaternary)
                }
                .font(.system(size: 90))
                .padding()
                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 20))
                
                HStack {
                    Image(systemName: "bookmark.square.fill")
                        .foregroundStyle(.ultraThinMaterial)
                    Image(systemName: "bookmark.square.fill")
                        .foregroundStyle(.regularMaterial)
                    Image(systemName: "bookmark.square.fill")
                        .foregroundStyle(.thickMaterial)
                }
                .font(.system(size: 90))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(.thinMaterial, lineWidth: 8)
                )
            }
            .font(.title)
        }
    }
}

#Preview {
    Image_UsingMaterials()
}
