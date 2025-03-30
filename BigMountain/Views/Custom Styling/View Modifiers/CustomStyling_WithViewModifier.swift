//
//  CustomStyling_WithViewModifier.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/3/25.
//

import SwiftUI

struct CustomStyling_WithViewModifier: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ViewModifier")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
                .foregroundStyle(.gray)
            Text("Create a view modifier where you see repeated modifiers being used.")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding()
                .background(.red)
                .foregroundStyle(.white)
            
            Text("I created a view modifier for the formatting of this text banner.")
                .modifier(TextBanner())
            
            ModifiedContent(
                content: Text("You can also use ModifiedContent to apply your custom view modifier to a view."),
                modifier: TextBanner()
            )
        }
    }
}

#Preview {
    CustomStyling_WithViewModifier()
}

struct TextBanner: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .font(.title)
            .padding()
            .background(.red)
            .foregroundStyle(.white)
    }
}
