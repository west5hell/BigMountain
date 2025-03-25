//
//  CircularShapes_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/3/25.
//

import SwiftUI

struct CircularShapes_Intro: View {
    var body: some View {
        VStack(spacing: 5) {
            HeaderView(
                "Circular Shapes",
                subtitle: "Introduction",
                desc: "There are three circular shapes available in SwiftUI:",
                back: .purple,
                textColor: .white
            )
            .layoutPriority(1)
            
            Text("Circle")
            Circle()
                .padding()
            
            Text("Capsule")
            Capsule()
                .padding()
            
            Text("Ellipse")
            Ellipse()
                .padding()
            
            Text("(Notice the default colors default to the primaty color.)")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.purple)
                .foregroundStyle(.white)
        }
        .font(.title)
    }
}

#Preview {
    CircularShapes_Intro()
}
