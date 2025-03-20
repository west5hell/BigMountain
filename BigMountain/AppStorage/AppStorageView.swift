//
//  AppStorageView.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/3/25.
//

import SwiftUI

struct AppStorage_Intro: View {
    @AppStorage("username") var username = "Mark"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HeaderView(
                    "",
                    subtitle: "Introduction",
                    desc: "You can use @AppStorage to store small amounts of data for your app."
                )
                
                Text("AppStorage: username")
                Text("\(username)").bold()
                
                NavigationLink("Edit", destination: AppStorage_Edit())
            }
            .font(.title)
            .navigationTitle("App Storage")
        }
    }
}

struct AppStorage_Edit: View {
    @AppStorage("username") var username: String!
    @State private var newUsername = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "",
                subtitle: "Update AppStorage",
                desc: "To update AppStorage, just assign a new value to the variable."
            )
            
            Text("Enter a new user name:")
            TextField("new user name", text: $newUsername)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button("Update") {
                username = newUsername
            }
        }
        .font(.title)
        .navigationTitle("Update App Storage")
    }
}

#Preview(body: {
    AppStorage_Intro()
})

struct AppStorage_Persistence: View {
//    @AppStorage("darkBackground") var darkBackground = false
    @AppStorage(wrappedValue: false, "darkBackground") var darkBackground
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "@AppStorage",
                subtitle: "Persistence",
                desc: "Data you store using @AppStorage will persist even after the app closes."
            )
            
            Toggle(isOn: $darkBackground) {
                Text("Use Dark Background?")
            }
            .padding()
        }
        .font(.title)
        .preferredColorScheme(darkBackground ? .dark : .light)
    }
}

#Preview("Persistence", body: {
    AppStorage_Persistence()
})
