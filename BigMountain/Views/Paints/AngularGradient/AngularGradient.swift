//
//  AngularGradient.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct AngularGradientView: View {
    
    
    var body: some View {
        let gradient = Gradient(colors: [.pink, .purple, .pink])
        let angularGradient = AngularGradient(
            gradient: gradient,
            center: .center,
            angle: .degrees(0)
        )
        let nonCenteredAngularGradient = AngularGradient(
            gradient: gradient,
            center: .bottomTrailing,
            angle: .degrees(0)
        )
        
        return VStack(spacing: 20) {
            Text("Angular Gradient")
                .font(.largeTitle)
            
            Text("Introduction")
                .foregroundStyle(.gray)
            
            Text("Angular gradients circle around a center point.")
                .padding(.horizontal)
            
            Rectangle()
                .fill(angularGradient)
            
            Text("The center point can be changed. Here, it is moved to the bottom trailing:")
                .padding(.horizontal)
            
            Rectangle()
                .fill(nonCenteredAngularGradient)
            
            HStack {
                Circle()
                    .fill(angularGradient)
                Ellipse()
                    .fill(angularGradient)
                Capsule()
                    .fill(angularGradient)
            }
            .padding(.horizontal)
            
            Text("You can also apply gradients to strokes")
            
            HStack {
                Circle()
                    .stroke(angularGradient, lineWidth: 10)
                Ellipse()
                    .stroke(angularGradient, lineWidth: 10)
                Capsule()
                    .trim(from: 0.25, to: 1)
                    .stroke(angularGradient, lineWidth: 10)
            }
            .padding(.horizontal)
        }.font(.title)
    }
}

#Preview {
    AngularGradientView()
}
