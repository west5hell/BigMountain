//
//  Animate_Color.swift
//  BigMountain
//
//  Created by Pongt Chia on 16/4/25.
//

import SwiftUI

struct Animate_Color: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Properties",
                subtitle: "Color",
                desc: "You can animate the change from one to another."
            )
            
            Text("With Animation")
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(change ? .orange : .blue)
                .padding()
                .animation(.easeInOut, value: change)
            
            Text("No Animation")
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(change ? .orange : .blue)
                .padding()
            
            Button("Change") {
                change.toggle()
            }
        }
        .font(.title)
    }
}

#Preview {
    Animate_Color()
}
