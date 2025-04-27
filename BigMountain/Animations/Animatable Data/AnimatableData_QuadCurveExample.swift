//
//  AnimatableData_QuadCurveExample.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/4/25.
//

import SwiftUI

struct AnimatableData_QuadCurveExample: View {
    @State private var presentingSheet = false
    @State private var curveOffset = -40.0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "AnimatableData",
                subtitle: "On a QuadCurve Shape",
                desc: "An example using animatableData with a quad curve shape to create a bounce effect on a sheet."
            )
            
            Button("Show Sheet") {
                presentingSheet = true
            }
        }
        .font(.title)
        .sheet(isPresented: $presentingSheet) {
            curveOffset = -40
        } content: {
            VStack {
                QuadCurveRectangle(curveOffset: curveOffset)
                    .fill(Color("Gold"))
                    .frame(height: 100)
                    .overlay {
                        Text("Animate Curve")
                            .font(.largeTitle)
                            .onAppear {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.2)) {
                                    curveOffset = 0
                                }
                            }
                    }
                Spacer()
            }
        }

    }
}

#Preview {
    AnimatableData_QuadCurveExample()
}

struct QuadCurveRectangle: Shape {
    var curveOffset: CGFloat = 0
    
    var animatableData: CGFloat {
        get { curveOffset }
        set { curveOffset = newValue }
    }
    
    nonisolated func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(
            to: CGPoint(x: 0, y: rect.maxY),
            control: CGPoint(
                x: rect.midX,
                y: rect.maxY + curveOffset
            )
        )
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        return path
    }
}
