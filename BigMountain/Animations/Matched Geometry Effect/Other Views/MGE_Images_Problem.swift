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
                subtitle: "Images - Problem",
                desc: "Adding a border to the image doesn't work like you might expect. What is the problem here?",
                back: .green,
                textColor: .black
            )
            
            Spacer()
            
            if zoom {
                Image("JOJO-Liu")
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "customerProfile", in: namespace)
                    .border(.green, width: 2) 
                    .onTapGesture {
                        zoom.toggle()
                    }
            } else {
                Image("JOJO-Liu")
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "customerProfile", in: namespace)
                    .border(.green, width: 2)
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
