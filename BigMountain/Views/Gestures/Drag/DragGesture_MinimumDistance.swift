//
//  DragGesture_MinimumDistance.swift
//  BigMountain
//
//  Created by Pongt Chia on 30/3/25.
//

import SwiftUI

struct DragGesture_MinimumDistance: View {
    @GestureState private var circleOffset = CGSize.zero
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Gestures",
                subtitle: "Drag - Minimum Distance",
                desc: "You can set a minimum distance the user has to drag a view before it actually starts moving."
            )
            
            Text("Drag the image out of the circle")
                .padding()
            
            ZStack {
                Circle()
                    .stroke(.blue, lineWidth: 1)
                    .frame(width: 100, height: 100)
                Image(systemName: "doc.on.doc.fill")
                    .foregroundStyle(.blue)
                    .offset(circleOffset)
                    .gesture(
                        DragGesture(minimumDistance: 50)
                            .updating($circleOffset, body: { value, state, transaction in
                                state = value.translation
                            })
                    )
            }
        }
        .font(.title)
    }
}

#Preview {
    DragGesture_MinimumDistance()
}
