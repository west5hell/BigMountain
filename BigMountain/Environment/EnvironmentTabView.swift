//
//  EnvironmentTabView.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/3/25.
//

import SwiftUI

struct EnvironmentTabView: View {
    var body: some View {
        TabView {
            Tab("One", systemImage: "1.circle") {
                TabViewOne()
            }
            
            Tab("Two", systemImage: "2.circle") {
                TabViewTwo()
            }
        }
        .environment(DeveloperOO())
        .font(.title)
    }
}

#Preview {
    EnvironmentTabView()
}

struct TabViewOne: View {
    @Environment(DeveloperOO.self) var devInfo
    
    var body: some View {
        VStack {
            Text("Tab 1")
                .font(.largeTitle)
            
            Spacer()
            
            Text("\(devInfo.name)")
            
            Button("Update") {
                devInfo.name = "New Awesome Dev"
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
}

struct TabViewTwo: View {
    @Environment(DeveloperOO.self) var developerInfo
    
    var body: some View {
        VStack {
            Text("Tab 2")
                .font(.largeTitle)
            Spacer()
            Text("The name on Tab 1 is:")
                .padding()
            Text("\(developerInfo.name)")
                .bold()
            Spacer()
        }
    }
}
