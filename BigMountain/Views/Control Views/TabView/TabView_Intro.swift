//
//  TabView_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/3/25.
//

import SwiftUI

struct TabView_Intro: View {
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(value: 0) {
                VStack(spacing: 20) {
                    HeaderView(
                        "TabView",
                        subtitle: "Introduction",
                        desc: "The TabView view can hold multiple views, one for each tab."
                    )
                    Button("Go to Tab 1") {
                        selectedTab = 1
                    }
                    Spacer()
                    Divider()
                        .background(.ultraThinMaterial)
                }
            } label: {
                Image(systemName: "star")
            }

            Tab(value: 1) {
                NavigationStack {
                    Image(systemName: "star")
                    Image(systemName: "moon")
                    
                    NavigationLink("Go to HELL") {
                        Text("This is HELL")
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }
                    .padding(.top)
                    
                    Spacer()
                    Divider()
                        .background(Color.brown)
                }
            } label: {
                Image(systemName: "moon")
            }
            .badge("?")

        }
        .tint(.red)
        .font(.title)
        .onChange(of: selectedTab) { oldValue, newValue in
            print(oldValue, newValue)
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(Color.green)
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    TabView_Intro()
}
