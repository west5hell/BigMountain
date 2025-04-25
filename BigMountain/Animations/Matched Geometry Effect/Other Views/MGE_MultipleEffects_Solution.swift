//
//  MGE_MultipleEffects_Solution.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/4/25.
//

import SwiftUI

struct MGE_MultipleEffects_Solution: View {
    @Namespace var namespace    // Your views have to share the same namespace.
    @State private var showHelp = false
    @State private var showText = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Multiple Effects - Solution",
                desc: "The image icons now transition to each other independently of the green backgrounds. The text is delayed in showing until after the green background has fully expanded.",
                back: .green
            )
            
            ZStack {
                if showHelp == false {
                    Image(systemName: "questionmark")
                        .padding()
                        .background {
                            Circle()
                                .fill(.green)
                                .matchedGeometryEffect(id: "color", in: namespace)
                        }
                        .matchedGeometryEffect(
                            id: "image",
                            in: namespace,
                            properties: .position
                        )
                        .onTapGesture {
                            showHelp.toggle()
                        }
                } else {
                    VStack {
                        Image(systemName: "questionmark.circle")
                            .font(.largeTitle)
                            .matchedGeometryEffect(
                                id: "image",
                                in: namespace,
                                properties: .position
                            )
                        ScrollView {
                            Text("Lorem ipsum…")
                                .opacity(showText ? 1 : 0)
                        }
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.green)
                            .matchedGeometryEffect(id: "color", in: namespace)
                    }
                    .onAppear(perform: {
                        withAnimation(.easeInOut.delay(0.45)) {
                            showText.toggle()
                        }
                    })
                    .onTapGesture {
                        showText = false
                        withAnimation(.easeInOut.delay(0.45)) {
                            showHelp = false
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
        }
        .font(.title)
        .animation(.spring(), value: showHelp)
        .padding(.bottom)
    }
}

#Preview {
    MGE_MultipleEffects_Solution()
}
