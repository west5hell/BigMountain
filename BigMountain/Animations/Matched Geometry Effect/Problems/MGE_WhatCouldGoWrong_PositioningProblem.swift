//
//  MGE_WhatCouldGoWrong_PositioningProblem.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/4/25.
//

import SwiftUI

struct MGE_WhatCouldGoWrong_PositioningProblem: View {
    @Namespace var namespace
    
    @State private var showView2 = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Positioning Problem",
                desc: "Here's an example of how a positioning modifier can also create unexpected results.",
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
                    .offset(x: -130)
                    .matchedGeometryEffect(id: "change", in: namespace)
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
    MGE_WhatCouldGoWrong_PositioningProblem()
}
