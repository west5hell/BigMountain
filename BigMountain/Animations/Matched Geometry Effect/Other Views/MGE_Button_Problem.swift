//
//  MGE_Button_Problem.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/4/25.
//

import SwiftUI

struct MGE_Button_Problem: View {
    @Namespace var namespace    // Your views have to share the same namespace.
    @State private var showDetail = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Button - Problem",
                desc: "A matchedGeometryEffect is on the button but the animation looks wrong. How can this be fixed?",
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
                        .padding()
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .fill()
                        )
                }
                .matchedGeometryEffect(id: "button", in: namespace)
            }
        }
        .font(.title)
        .animation(.default, value: showDetail)
        .padding(.bottom)
    }
}

#Preview {
    MGE_Button_Problem()
}
