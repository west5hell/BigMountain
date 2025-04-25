//
//  MGE_MultipleEffects_Problem.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/4/25.
//

import SwiftUI

struct MGE_MultipleEffects_Problem: View {
    @Namespace var namespace    // Your views have to share the same namespace.
    @State private var showHelp = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Button - Text Solution",
                desc: "In the previous example, you have noticed the shapes moved while the text didn't. You can match multiple groups of views to transition independently of each other.",
                back: .green
            )
            
            ZStack {
                if showHelp == false {
                    Image(systemName: "questionmark")
                        .padding()
                        .background(Circle().fill(.green))
                        .matchedGeometryEffect(id: "help", in: namespace)
                        .onTapGesture {
                            showHelp.toggle()
                        }
                } else {
                    VStack {
                        Image(systemName: "questionmark.circle")
                        ScrollView {
                            Text("Lorem ipsum…")
                        }
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.green)
                    }
                    .matchedGeometryEffect(id: "help", in: namespace)
                    .onTapGesture {
                        showHelp.toggle()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
        }
        .font(.title)
        .animation(.default, value: showHelp)
        .padding(.bottom)
    }
}

#Preview {
    MGE_MultipleEffects_Problem()
}
