//
//  DrawingGroup.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/3/25.
//

import SwiftUI

struct DrawingGroup: View {
    @State private var scaling = false
    
    var body: some View {
        GeometryReader { gr in
            ZStack {
                ForEach(0...200, id: \.self) { val in
                    Circle()
                        .foregroundStyle(.orange)
                        .opacity(0.2)
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(.random(in: 0.05...0.9))
                                .delay(.random(in: 0...2)),
                            value: scaling
                        )
                        .scaleEffect(self.scaling ? .random(in: 0.1...2) : 1)
                        .frame(width: .random(in: 10...100), height: .random(in: 10...100))
                        .position(
                            x: randomCoordinate(max: gr.size.width),
                            y: randomCoordinate(max: gr.size.height)
                        )
                }
            }
            .drawingGroup()
        }
        .onAppear {
            scaling = true
        }
    }
    
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
}

#Preview {
    DrawingGroup()
}
