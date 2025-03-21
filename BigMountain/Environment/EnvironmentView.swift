//
//  EnvironmentView.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/3/25.
//

import SwiftUI

@Observable
class DeveloperOO {
    var name = "Awesome developer"
}

struct Environment_Intro: View {
    var body: some View {
        NavigationStack {
            NavigationLink("View Developer") {
                DeveloperView()
            }
            .navigationTitle("Developer")
        }
        .environment(DeveloperOO())
        .font(.title)
    }
}

struct DeveloperView: View {
    @Environment(DeveloperOO.self) private var dev
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, \(dev.name)!")
            NavigationLink("Foo View") {
                FooView()
            }
        }
        .navigationTitle("Developer View")
    }
}

struct FooView: View {
    @Environment(DeveloperOO.self) private var dev
    
    var body: some View {
        VStack(spacing: 20) {
            Text("I am foo view.")
            Text("YES, \(dev.name)!")
        }
    }
}

#Preview {
    Environment_Intro()
}
