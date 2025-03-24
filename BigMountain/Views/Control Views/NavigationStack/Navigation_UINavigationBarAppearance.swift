//
//  Navigation_UINavigationBarAppearance.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct Navigation_UINavigationBarAppearance: View {
    @State private var isHidden = false
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Next Page") {
                    Image(systemName: "xmark.triangle.circle.square")
                        .font(.largeTitle)
                        .toolbarBackground(Color.red, for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                    
                    NavigationLink("Page 2") {
                        Text("Hello")
                    }
                    .font(.largeTitle)
                    .padding()
                }
                
                Toggle("Hide Nav Bar", isOn: $isHidden)
                    .padding()
            }
            .navigationTitle("Appearance")
            .navigationBarHidden(isHidden)
            .font(.title)
        }
        .onAppear {
            let appearance = UINavigationBarAppearance()
            
            appearance.backgroundColor = UIColor(Color.green.opacity(0.25))
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    Navigation_UINavigationBarAppearance()
}
