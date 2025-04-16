//
//  Animate_Opacity.swift
//  BigMountain
//
//  Created by Pongt Chia on 16/4/25.
//

import SwiftUI

struct Animate_Opacity: View {
    @State private var show = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Properties",
                subtitle: "Opacity",
                desc: "Opacity is the quality of thickness, solidness or opaqueness. The more opacity, the more solid something appears (less transparent)."
            )
            
            Button("Show/Hide") {
                show.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.blue)
                .padding()
                .opacity(show ? 1 : 0)
                .animation(.default, value: show)
        }
        .font(.title)
    }
}

#Preview {
    Animate_Opacity()
}
