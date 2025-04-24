//
//  MGE_Button_TextSolution.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/4/25.
//

import SwiftUI

struct MGE_Button_TextSolution: View {
    @Namespace var namespace    // Your views have to share the same namespace.
    @State private var showDetail = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Button - Text Solution",
                desc: "In the previous example, you have noticed the shapes moved while the text didn't. You can match multiple groups of views to transition independently of each other.",
                back: .green,
                textColor: .black
            )
            
            Spacer()
            
            if showDetail {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.blue)
                    .overlay(alignment: .top) {
                        Text("More Details")
                            .foregroundStyle(.white)
                            .padding(.top)
                            .matchedGeometryEffect(id: "text", in: namespace, properties: .position)
                    }
                    .matchedGeometryEffect(id: "button", in: namespace)
                    .frame(height: 300)
                Spacer()
                Button("Close") {
                    showDetail.toggle()
                }
            } else {
                Button {
                    showDetail.toggle()
                } label: {
                    Text("Show More")
                        .foregroundStyle(.white)
                        .matchedGeometryEffect(id: "text", in: namespace, properties: .position)
                        .padding()
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .fill()
                                .matchedGeometryEffect(id: "button", in: namespace)
                        )
                }
            }
        }
        .font(.title)
        .animation(.default, value: showDetail)
        .padding(.bottom)
    }
}

#Preview {
    MGE_Button_TextSolution()
}
