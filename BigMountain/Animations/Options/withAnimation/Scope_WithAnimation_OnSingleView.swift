//
//  Scope_WithAnimation_OnSingleView.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/4/25.
//

import SwiftUI

struct Scope_WithAnimation_OnSingleView: View {
    @State private var flipHorizontally = false
    @State private var flipVertically = false
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(
                "With Animation",
                subtitle: "On a Single View",
                desc: "Using just withAnimation gives you the default animation. You can also customize the curve, duration, etc just like the previous animations you learned about."
            )
            
            HStack {
                Button {
                    withAnimation(.easeOut(duration: 1)) {
                        flipHorizontally.toggle()
                    }
                } label: {
                    Image(systemName: "flip.horizontal.fill")
                        .font(.system(size: 50))
                        .padding()
                }
                Button {
                    withAnimation {
                        flipVertically.toggle()
                    }
                } label: {
                    Image(systemName: "flip.horizontal.fill")
                        .font(.system(size: 50))
                        .rotationEffect(.degrees(90))
                        .padding()
                }
            }

            Image("day")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .padding()
                .scaleEffect(x: flipHorizontally ? -1 : 1, y: flipVertically ? -1 : 1)
        }
        .font(.title)
    }
}

#Preview {
    Scope_WithAnimation_OnSingleView()
}
