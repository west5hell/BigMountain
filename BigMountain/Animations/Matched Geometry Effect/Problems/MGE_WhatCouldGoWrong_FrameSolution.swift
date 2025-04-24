//
//  MGE_WhatCouldGoWrong_FrameSolution.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/4/25.
//

import SwiftUI

struct MGE_WhatCouldGoWrong_FrameSolution: View {
    @Namespace var namespace
    
    @State private var showView2 = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Frame Solution",
                desc: "The destination frame should be BELOW the matched geometry effect.",
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
                    .frame(width: 160, height: 160)
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
    MGE_WhatCouldGoWrong_FrameSolution()
}
