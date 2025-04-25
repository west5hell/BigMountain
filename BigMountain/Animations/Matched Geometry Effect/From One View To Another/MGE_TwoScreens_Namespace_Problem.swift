//
//  MGE_TwoScreens_Namespace_Problem.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/4/25.
//

import SwiftUI

struct MGE_TwoScreens_Namespace_Problem: View {
    @Namespace var namespace    // Your views have to share the same namespace.
    @State private var showGreenScreen = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HeaderView(
                    "MatchedGeometryEffect",
                    subtitle: "Two Views - Namespaces",
                    desc: "The two matched views have to share the same namespace. How do you do this with views in two different places?",
                    back: .green,
                    textColor: .black
                )
                
                
                if showGreenScreen == false {
                    Circle()
                        .fill(.green)
                        .overlay {
                            Text("Start")
                        }
                        .matchedGeometryEffect(id: "twoScreens", in: namespace)
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            showGreenScreen.toggle()
                        }
                }
                Spacer()
            }
            
            if showGreenScreen {
                MGE_GreenScreen(showGreenScreen: $showGreenScreen)
            }
        }
        .font(.title)
        .animation(.easeIn, value: showGreenScreen)
    }
}

#Preview {
    MGE_TwoScreens_Namespace_Problem()
}

struct MGE_GreenScreen: View {
    @Binding var showGreenScreen: Bool
    @Namespace var namespace
    
    var body: some View {
        Color.green
            .ignoresSafeArea()
            .overlay {
                Text("Stop")
            }
            .matchedGeometryEffect(id: "twoScreens", in: namespace)
            .onTapGesture {
                showGreenScreen.toggle()
            }
        
    }
}
