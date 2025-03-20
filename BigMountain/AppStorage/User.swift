//
//  User.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/3/25.
//

import SwiftUI

struct User: Codable {
    var name = ""
    var age = 0
    
    func encode() -> Data? {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            return encoded
        } else {
            return nil
        }
    }
    
    static func decode(userData: Data) -> User? {
        let decoder = JSONDecoder()
        if let user = try? decoder.decode(User.self, from: userData) {
            return user
        } else {
            return nil
        }
    }
}

struct AppStorage_StoreStruct: View {
    @AppStorage("user") var userData = User(name: "Joe Duran", age: 26).encode()!
    @State private var userName = ""
    @State private var age = 0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "AppStorage",
                subtitle: "Store Structs",
                desc: "Since you can store Data, you can store a whole struct in AppStorage."
            )
            
            Text("AppStorage")
            Text("Name: \(userName)").bold()
            Text("Age: \(age)").bold()
        }
        .font(.title)
        .onAppear {
            getAppStorageData()
        }
    }
    
    func getAppStorageData() {
        if let appUser = User.decode(userData: userData) {
            userName = appUser.name
            age = appUser.age
        }
    }
}

#Preview {
    AppStorage_StoreStruct()
}
