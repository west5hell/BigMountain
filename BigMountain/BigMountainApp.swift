//
//  BigMountainApp.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/3/25.
//

import SwiftUI

@Observable
class UserModel {
    var username = "Ellen"
    var showAsOnline = true
}

@main
struct BigMountainApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(UserModel())
    }
}


struct Environment_Global: View {
    @Environment(UserModel.self) var user
    var body: some View {
        VStack(alignment: .leading) {
            Text("Username: \(user.username)")
            LabeledContent("Online") {
                Image(systemName: "circle.fill")
                    .foregroundStyle(user.showAsOnline ? .green : .red)
            }
        }
        .padding()
        .font(.title)
    }
}
