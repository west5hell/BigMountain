//
//  Animate_GeometryReader.swift
//  BigMountain
//
//  Created by Pongt Chia on 16/4/25.
//

import SwiftUI

struct Animate_GeometryReader: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Properties",
                subtitle: "In Geometry Reader",
                desc: "You can animate the center point (position) of a view within a GeometryReader's coordinate space."
            )
            
            GeometryReader { gp in
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.blue)
                    .frame(width: 100, height: 100)
                    .position(
                        change ? CGPoint(x: 50, y: 50) : CGPoint(x: gp.size.width - 50, y: gp.size.height - 50)
                    )
                    .animation(.default, value: change)
            }
            
            Button("Change") {
                change.toggle()
            }
        }
        .font(.title)
    }
}

#Preview {
    Animate_GeometryReader()
}
