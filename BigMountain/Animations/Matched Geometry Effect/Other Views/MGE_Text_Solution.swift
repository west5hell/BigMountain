//
//  MGE_Text_Solution.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/4/25.
//

import SwiftUI

struct MGE_Text_Solution: View {
    @Namespace var namespace    // Your views have to share the same namespace.
    @State private var showDetail = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Text - Solution",
                desc: "When it comes to text, don't worry about matching the size. Just match the position and it will look a lot better.",
                back: .green,
                textColor: .black
            )
            
            Spacer()
            
            if showDetail {
                Text("More Details")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .matchedGeometryEffect(id: "text", in: namespace, properties: .position)
                Spacer()
                Button("Close") {
                    showDetail.toggle()
                }
            } else {
                Button {
                    showDetail.toggle()
                } label: {
                    Text("More Details")
                        .matchedGeometryEffect(id: "text", in: namespace, properties: .position)
                }

            }
        }
        .font(.title)
        .animation(.easeInOut(duration: 0.7), value: showDetail)
        .padding(.bottom)
    }
}

#Preview {
    MGE_Text_Solution()
}
