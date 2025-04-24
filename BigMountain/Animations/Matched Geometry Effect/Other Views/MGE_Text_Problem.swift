//
//  MGE_Text_Problem.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/4/25.
//

import SwiftUI

struct MGE_Text_Problem: View {
    @Namespace var namespace    // Your views have to share the same namespace.
    @State private var showDetail = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Text - Problem",
                desc: "Using the matched geometry effect on text has its own challenges.",
                back: .green,
                textColor: .black
            )
            
            Spacer()
            
            if showDetail {
                Text("More Details")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .matchedGeometryEffect(id: "text", in: namespace)
                Spacer()
                Button("Close") {
                    showDetail.toggle()
                }
            } else {
                Button {
                    showDetail.toggle()
                } label: {
                    Text("More Details")
                        .matchedGeometryEffect(id: "text", in: namespace)
                }

            }
        }
        .font(.title)
        .animation(.easeInOut(duration: 0.7), value: showDetail)
        .padding(.bottom)
    }
}

#Preview {
    MGE_Text_Problem()
}
