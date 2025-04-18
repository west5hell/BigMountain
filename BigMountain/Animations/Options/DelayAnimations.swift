//
//  DelayAnimations.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct DelayAnimations: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Delay Animations",
                subtitle: "Introduction",
                desc: "You can delay an animation after it is triggered."
            )
            
            Text("Wait 1.5 second after this view loads before animating.")
            
            GeometryReader { gp in
                ZStack {
                    VStack {
                        Text("Hello!")
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.pink)
                    }
                    .font(.system(size: 50))
                    
                    HStack(spacing: 0) {
                        Rectangle()
                            .offset(x: change ? -gp.size.width / 2 : 0)
                        Rectangle()
                            .offset(x: change ? gp.size.width / 2 : 0)
                    }
                    .foregroundStyle(.red)
                    .animation(.default.delay(1.5), value: change)
                }
            }
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            change = true
        }
    }
}

#Preview {
    DelayAnimations()
}
