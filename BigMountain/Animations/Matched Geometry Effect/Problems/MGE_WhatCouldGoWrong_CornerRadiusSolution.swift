//
//  MGE_WhatCouldGoWrong_CornerRadiusSolution.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/4/25.
//

import SwiftUI

struct MGE_WhatCouldGoWrong_CornerRadiusSolution: View {
    @Namespace var namespace
    
    @State private var showView2 = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "CornerRadius Solution",
                desc: "You want the cornerRadius to resize and repositon along with the view so it has to be ABOVE the matched geometry effect.",
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
                Rectangle()
                    .fill(.blue)
                    .overlay(content: {
                        Text("View 1")
                    })
                    .clipShape(RoundedRectangle(cornerRadius: 25))
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
    MGE_WhatCouldGoWrong_CornerRadiusSolution()
}
