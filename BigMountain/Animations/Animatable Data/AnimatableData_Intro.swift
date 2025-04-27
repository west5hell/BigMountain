//
//  AnimatableData_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/4/25.
//

import SwiftUI

struct AnimatableData_Intro: View {
    @State private var startingPoint: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "AnimatableData",
                subtitle: "Introductin",
                desc: "Use animatableData to tell SwiftUI which value you want animated."
            )
            
            HStack(spacing: 16) {
                Button("Triangle") {
                    startingPoint = 200
                }
                Button("Trapezium") {
                    startingPoint = 100
                }
                Button("Square") {
                    startingPoint = 0
                }
            }
            
            RightAngleShape(startingPoint: startingPoint)
                .frame(width: 200, height: 200)
                .animation(.default, value: startingPoint)
        }
        .font(.title)
    }
}

#Preview {
    AnimatableData_Intro()
}

struct RightAngleShape: Shape {
    var startingPoint: CGFloat = 0
    
    var animatableData: CGFloat {
        get { startingPoint }
        set {startingPoint = newValue }
    }
    
    nonisolated func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: startingPoint, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}
