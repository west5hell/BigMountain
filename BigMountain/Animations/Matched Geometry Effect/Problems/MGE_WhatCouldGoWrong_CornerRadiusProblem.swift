//
//  MGE_WhatCouldGoWrong_CornerRadiusProblem.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/4/25.
//

import SwiftUI

struct MGE_WhatCouldGoWrong_CornerRadiusProblem: View {
    @Namespace var namespace
    
    @State private var showView2 = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "CornerRadius Problem",
                desc: "We have a cornerRadius on the first view but watch the text when we go back to the blue view.",
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
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
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
    MGE_WhatCouldGoWrong_CornerRadiusProblem()
}
