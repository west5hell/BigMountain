//
//  Scope_WithAnimation_CustomAnimation.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/4/25.
//

import SwiftUI

struct Scope_WithAnimation_CustomAnimation: View {
    @State private var flipHorizontally = false
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(
                "With Animation",
                subtitle: "Custom Animations",
                desc: "Using just withAnimation gives you the default animation. You can also customize the curve, duration, etc just like the previous animations you learned about."
            )
            
            Button {
                withAnimation(.easeOut(duration: 1)) {
                    flipHorizontally.toggle()
                }
            } label: {
                Image(systemName: "flip.horizontal.fill")
                    .font(.system(size: 50))
                    .padding()
            }

            Image("day")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .padding()
                .scaleEffect(x: flipHorizontally ? -1 : 1, y: 1)
        }
        .font(.title)
    }
}

#Preview {
    Scope_WithAnimation_CustomAnimation()
}
