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
                    desc: "You have to pass in a reference to the namespace so both views can use the same one.",
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
                MGE_GreenScreen(showGreenScreen: $showGreenScreen, namespace: namespace)
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
    var namespace: Namespace.ID
    
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
