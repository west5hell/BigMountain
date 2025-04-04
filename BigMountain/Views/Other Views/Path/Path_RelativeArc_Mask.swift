//
//  Path_RelativeArc_Mask.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Path_RelativeArc_Mask: View {
    let angularGradient = AngularGradient(
        colors: [.red, .orange, .yellow, .blue, .green],
        center: .bottom,
        startAngle: .degrees(-180),
        endAngle: .degrees(0)
    )
    
    var body: some View {
        VStack(spacing: 20) {
            HalfCircleProgress(progress: 0.75)
                .fill(angularGradient)
                .frame(height: 196)
                .background(Color(uiColor: .systemGray5))
//                .mask {
//                    Image("Meter")
//                        .resizable()
//                        .scaledToFit()
//                }
        }
        .font(.title)
    }
}

#Preview {
    Path_RelativeArc_Mask()
}

struct HalfCircleProgress: Shape {
    var progress: CGFloat = 0.7
    
    nonisolated func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addRelativeArc(
            center: CGPoint(x: rect.midX, y: rect.maxY),
            radius: rect.midX,
            startAngle: .degrees(180),
            delta: .degrees(180 * progress)
        )
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}
