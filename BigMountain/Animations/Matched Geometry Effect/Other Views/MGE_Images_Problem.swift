//
//  MGE_Images_Problem.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/4/25.
//

import SwiftUI

struct MGE_Images_Problem: View {
    @Namespace var namespace    // Your views have to share the same namespace.
    @State private var zoom = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Images - Solution",
                desc: "Move the border ABOVE the matchedGeometryEffect so it is included when the view is resized/repositioned.",
                back: .green,
                textColor: .black
            )
            
            Spacer()
            
            if zoom {
                Image("JOJO-Liu")
                    .resizable()
                    .scaledToFit()
                    .border(.green, width: 2)
                    .matchedGeometryEffect(id: "customerProfile", in: namespace)
                    .onTapGesture {
                        zoom.toggle()
                    }
            } else {
                Image("JOJO-Liu")
                    .resizable()
                    .scaledToFit()
                    .border(.green, width: 2)
                    .matchedGeometryEffect(id: "customerProfile", in: namespace)
                    .frame(height: 50)
                    .onTapGesture {
                        zoom.toggle()
                    }
            }
            
            Spacer()
        }
        .font(.title)
        .animation(.linear, value: zoom)
        .padding(.bottom)
    }
}

#Preview {
    MGE_Images_Problem()
}
