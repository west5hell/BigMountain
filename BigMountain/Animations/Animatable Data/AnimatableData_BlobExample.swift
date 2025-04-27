//
//  AnimatableData_BlobExample.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/4/25.
//

import SwiftUI

struct AnimatableData_BlobExample: View {
    @State private var offset: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "AnimatableData",
                subtitle: "Blob Example",
                desc: "The animatableData value can be used in multiple ways on the same shape."
            )
            
            Button("Animate") {
                offset = offset == 60 ? 0 : 60
            }
            
            CurvedShape(offset: offset)
                .padding()
                .animation(.spring(response: 0.4, dampingFraction: 0.1), value: offset)
        }
        .font(.title)
    }
}

#Preview {
    AnimatableData_BlobExample()
}


struct CurvedShape: Shape {
    var offset: CGFloat = 0
    
    var animatableData: CGFloat {
        get { offset }
        set { offset = newValue }
    }
    
    nonisolated func path(in rect: CGRect) -> Path {
        // Point 1
        let startPoint = CGPoint(x: rect.width * 0.5, y: 0)
        var path = Path()
        path.move(to: startPoint)
        
        path.addCurve(
            to: CGPoint(x: rect.width, y: rect.height/2),
            control1: CGPoint(x: (rect.width * 0.85)+offset, y: 0), // a
            control2: CGPoint(x: rect.width-offset, y: (rect.height * 0.1)) // b
        )
        // Point 3
        path.addCurve(
            to: CGPoint(x: rect.width / 2, y: rect.height),
            control1: CGPoint(x: rect.width+offset, y: (rect.height * 0.8)+offset), // c
            control2: CGPoint(x: rect.width * 0.75, y: rect.height) // d
        )
        // Point 4
        path.addCurve(
            to: CGPoint(x: 0, y: rect.height * 0.7),
            control1: CGPoint(x: (rect.width * 0.35)-offset, y: rect.height),   // e
            control2: CGPoint(x: 0, y: rect.height-offset)  // f
        )
        // Point 5
        path.addCurve(
            to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.3),
            control1: CGPoint(x: 0, y: (rect.height * 0.4)+offset), // g
            control2: CGPoint(x: (rect.width * 0.17)+offset, y: rect.height * 0.45) // h
        )
        // Back to Point 1
        path.addCurve(
            to: startPoint,
            control1: CGPoint(x: (rect.width * 0.4)-offset, y: rect.height * 0.16), // i
            control2: CGPoint(x: (rect.width * 0.35)-offset, y: 0)  // j
        )
        
        return path
    }
}
