//
//  MGE_Shapes.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/4/25.
//

import SwiftUI

struct MGE_Shapes: View {
    @Namespace var namespace
    @State private var changeView = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Shapes",
                desc: "Shapes are greate candidates for the matchedGeometryEffect. You can smoothly transition from one shape to another without much problem.",
                back: .green,
                textColor: .black
            )
            
            Spacer()
            
            if changeView {
                Rectangle()
                    .fill(.green)
                    .overlay {
                        Text("View 2")
                    }
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .onTapGesture {
                        changeView.toggle()
                    }
            } else {
                Circle()
                    .fill(.green)
                    .overlay {
                        Text("View 1")
                    }
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        changeView.toggle()
                    }
            }
        }
        .animation(.default, value: changeView)
        .font(.title)
    }
}

#Preview {
    MGE_Shapes()
}
