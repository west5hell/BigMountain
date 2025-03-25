//
//  ContentView.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SecureField_KeyboardSafeArea()
    }
}

#Preview {
    ContentView()
}

extension Color {
    static func random() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}
