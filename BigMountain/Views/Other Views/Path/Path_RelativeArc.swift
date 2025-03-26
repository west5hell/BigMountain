//
//  Path_RelativeArc.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Path_RelativeArc: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 0) {
                DomeShape()
                    .fill(.purple)
                
                Rectangle()
                    .fill(.purple)
            }
            .padding(.horizontal)
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    Path_RelativeArc()
}

struct DomeShape: Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addRelativeArc(
            center: CGPoint(x: rect.midX, y: rect.maxY),
            radius: rect.midX,
            startAngle: .degrees(180),
            delta: .degrees(180)
        )
        
        return path
    }
}
