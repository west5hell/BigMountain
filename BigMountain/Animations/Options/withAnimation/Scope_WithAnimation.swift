//
//  Scope_WithAnimation.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/4/25.
//

import SwiftUI

struct Scope_WithAnimation: View {
    @State private var flipHorizontally = false
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(
                "With Animation",
                subtitle: "Introduction",
                desc: "The withAnimation closure says, 'Anything that changes as a result of any values changing inside this closure will use this animation.'"
            )
            
            Button {
                withAnimation {
                    //  Animate any visual change this causes
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
    Scope_WithAnimation()
}
