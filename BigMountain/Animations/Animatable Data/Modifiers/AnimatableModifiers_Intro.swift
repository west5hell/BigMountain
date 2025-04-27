//
//  AnimatableModifiers_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/4/25.
//

import SwiftUI

struct AnimatableModifiers_Intro: View {
    @State private var largerFont = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Modifiers",
                subtitle: "Introduction",
                desc: "There are some modifiers that do not animate, such as font size. Use Animatable in your ViewModifier to change this."
            )
            
            Button("Change Font Size") {
                withAnimation(.spring(dampingFraction: 0.5)) {
                    largerFont.toggle()
                }
            }
            .font(.title)
            
#warning("Can't see difference now in iOS 18")
            Text("Not Animatable")
                .font(.system(size: largerFont ? 50 : 30))
            
            Text("Is Animatable")
                .modifier(FontSize(size: largerFont ? 50 : 30))
        }
        .font(.title)
    }
}

#Preview {
    AnimatableModifiers_Intro()
}

struct FontSize: Animatable, ViewModifier {
    var size: Double
    
    var animatableData: Double {
        get { size }
        set { size = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size))
    }
}
