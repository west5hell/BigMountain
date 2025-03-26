//
//  Path_QuadCurve.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Path_QuadCurve: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedBottomRectangle(curveOffset: 30)
                .fill(.purple)
                .frame(height: 120)
                .shadow(radius: 8)
                .overlay(
                    Text("Path")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding(.top, 40)
                )
                .ignoresSafeArea(edges: .top)
            
            Text("QuadCurve")
                .foregroundStyle(.gray)
            
            Text("Here's an example of how you add curve to your path.")
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .padding()
                .padding(.bottom)
                .background(
                    RoundedBottomRectangle(curveOffset: -30)
                        .fill(.purple)
                        .shadow(radius: 4, y: 4)
                )
                
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Path_QuadCurve()
}

struct RoundedBottomRectangle: Shape {
    var curveOffset: CGFloat = 10
    
    nonisolated func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(
            to: CGPoint(x: 0, y: rect.maxY),
            control: CGPoint(x: rect.midX, y: rect.maxY + curveOffset)
        )
        
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        return path
    }
}
