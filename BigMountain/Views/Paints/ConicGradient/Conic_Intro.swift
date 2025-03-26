//
//  Conic_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Conic_Intro: View {
    let gradient = Gradient(colors: [.green, .blue])
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(
                    .conicGradient(
                        gradient,
                        center: .center,
                        angle: .degrees(45)
                    )
                )
                .overlay(Text("Conic Gradient"), alignment: .top)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(
                    .angularGradient(
                        gradient,
                        center: .center,
                        startAngle: .degrees(90),
                        endAngle: .degrees(270)
                    )
                )
                .overlay(alignment: .top) {
                    Text("Angular Gradient")
                }
        }
        .font(.title)
    }
}


#Preview {
    Conic_Intro()
}
