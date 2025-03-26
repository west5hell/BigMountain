//
//  Curve.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Curve: View {
    let lg = LinearGradient(
        gradient: Gradient(colors: [.red, .purple]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading
    )
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Path")
                .font(.largeTitle)
            Text("Curve")
                .foregroundStyle(.gray)
            
            Text("Use .addCurve to create a curved line. You define the end point of the line. Then you define the curve's 'control handle' positions.")
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .padding()
                .padding(.bottom)
                .background(.purple)
            
            ZStack {
                CurvedShape()
                    .fill(lg)
                    .overlay {
                        Image("swiftui-96x96_2x")
                    }
                
                CurvedShape()
                    .stroke(
                        .blue,
                        style: StrokeStyle(
                            lineWidth: 8,
                            lineCap: CGLineCap.round,
                            dash: [60, 35]
                        )
                    )
                    .rotationEffect(.degrees(10))
            }
            .padding(40)
        }
        .font(.title)
    }
}

#Preview {
    Curve()
}

struct CurvedShape: Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        let startPoint = CGPoint(x: rect.width * 0.65, y: 0)
        
        var path = Path()
        path.move(to: startPoint)
        path.addCurve(
            to: CGPoint(x: rect.width, y: rect.height / 2),
            control1: CGPoint(x: rect.width * 0.85, y: 0),
            control2: CGPoint(x: rect.width, y: rect.height * 0.1)
        )
        path.addCurve(
            to: CGPoint(x: rect.width / 2, y: rect.height),
            control1: CGPoint(x: rect.width, y: rect.height * 0.9),
            control2: CGPoint(x: rect.width * 0.75, y: rect.height)
        )
        path.addCurve(
            to: CGPoint(x: 0, y: rect.height * 0.7),
            control1: CGPoint(x: rect.width * 0.35, y: rect.height),
            control2: CGPoint(x: 0, y: rect.height)
        )
        path.addCurve(
            to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.3),
            control1: CGPoint(x: 0, y: rect.height * 0.4),
            control2: CGPoint(x: rect.width * 0.17, y: rect.height * 0.45)
        )
        path.addCurve(
            to: startPoint,
            control1: CGPoint(x: rect.width * 0.42, y: rect.height * 0.16),
            control2: CGPoint(x: rect.width * 0.46, y: 0)
        )
        
        return path
    }
}
