//
//  Example_NoAnimation.swift
//  BigMountain
//
//  Created by Pongt Chia on 16/4/25.
//

import SwiftUI

struct Example_NoAnimation: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Example",
                subtitle: "Parts of Animation",
                desc: "The button changes a variable that then changes a view's property. That property change causes a change on the screen."
            )
            
            Circle()
                .foregroundStyle(.orange)
                .frame(width: 100, height: 100)
                .offset(x: 0, y: change ? 300 : 0)
                .animation(.easeInOut, value: change)
            
            Spacer()
            
            Button("Change") {
                change.toggle()
            }
            .padding(.bottom)
        }
        .font(.title)
    }
}

#Preview {
    Example_NoAnimation()
}
