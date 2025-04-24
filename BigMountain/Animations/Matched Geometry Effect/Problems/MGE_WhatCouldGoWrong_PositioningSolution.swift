//
//  MGE_WhatCouldGoWrong_PositioningSolution.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/4/25.
//

import SwiftUI

struct MGE_WhatCouldGoWrong_PositioningSolution: View {
    @Namespace var namespace
    
    @State private var showView2 = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Positioning Solution",
                desc: "Keep positioning modifiers below the matchedGeometryEffect for more predictable results.",
                back: .green,
                textColor: .black
            )
            
            Spacer()
            
            if showView2 {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.green)
                    .overlay(content: {
                        Text("View 2")
                    })
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .onTapGesture {
                        showView2.toggle()
                    }
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.green)
                    .overlay(content: {
                        Text("View 1")
                    })
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .offset(x: -130)
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        showView2.toggle()
                    }
            }
        }
        .animation(.default, value: showView2)
        .font(.title)
    }
}

#Preview {
    MGE_WhatCouldGoWrong_PositioningSolution()
}
