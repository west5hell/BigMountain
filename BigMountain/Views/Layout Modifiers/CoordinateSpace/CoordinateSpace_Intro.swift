//
//  CoordinateSpace_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/3/25.
//

import SwiftUI

let GreenSquareSpace = "GreenSquareCoordinateSpace"


struct CoordinateSpace_Intro: View {
    @State var location = CGPoint.zero
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "CoordinateSpace",
                subtitle: "Introduction",
                desc: "Use the coordinateSpace modifier to create a named coordinate space that you can refer to elsewhere.",
                back: Color.green
            )
            
            Text("The red dot's position starts at 0,0 in the green square's coordinate space.")
            
            Color.green
                .frame(width: 200, height: 200)
                .opacity(0.5)
                .overlay {
                    RedCircle(location: $location)
                }
                .coordinateSpace(.named(GreenSquareSpace))
            
            Text("Location: \(Int(location.x)), \(Int(location.y))")
            
        }
        .font(.title)
    }
}

#Preview {
    CoordinateSpace_Intro()
}

struct RedCircle: View {
    @Binding var location: CGPoint
    
    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: 25, height: 25)
            .gesture(
                DragGesture(coordinateSpace: .named(GreenSquareSpace))
                    .onChanged({ info in
                        location = info.location
                    })
            )
            .position(location)
    }
}
