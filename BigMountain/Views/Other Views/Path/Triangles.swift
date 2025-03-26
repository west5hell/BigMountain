//
//  Triangles.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Triangles: View {
    var body: some View {
        VStack {
            GeometryReader { gr in
                Path { path in
                    let middle = gr.frame(in: .local).midX
                    let width: CGFloat = 200
                    
                    path.move(to: CGPoint(x: middle, y: 10))
                    path.addLine(to: CGPoint(x: middle + (width / 2), y: 170))
                    path.addLine(to: CGPoint(x: middle - (width / 2), y: 170))
                    path.closeSubpath()
                }
                .strokedPath(StrokeStyle(lineWidth: 4))
                .foregroundStyle(.purple)
            }
            
            GeometryReader { gr in
                Path { path in
                    let middle = gr.frame(in: .local).midX
                    let width: CGFloat = 200
                    
                    path.move(to: CGPoint(x: middle, y: 10))
                    path.addLine(to: CGPoint(x: middle + (width / 2), y: 170))
                    path.addLine(to: CGPoint(x: middle - (width / 2), y: 170))
                    path.closeSubpath()
                }
                .fill(Color.purple)
                .rotationEffect(.degrees(90))
            }
        }
    }
}

#Preview {
    Triangles()
}
