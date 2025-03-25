//
//  SecureField_KeyboardSafeArea.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/3/25.
//

import SwiftUI

struct SecureField_KeyboardSafeArea: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "lizard")
                .font(.largeTitle)
            Spacer()
            
            HeaderView(
                "SecureField",
                subtitle: "Keyboard Safe Area",
                desc: "SecureFields will automatically move into view when the keyboard appears. The keyboard adjusts the bottom safe area so it will not cover views.",
                back: .purple,
                textColor: .white
            )
            
            TextField("user name", text: $username)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            SecureField("password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
        }
        .font(.title)
    }
}

#Preview {
    SecureField_KeyboardSafeArea()
}
