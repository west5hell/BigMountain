//
//  Toolbar_OnKeyboard.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/3/25.
//

import SwiftUI

struct Toolbar_OnKeyboard: View {
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("add name", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
        .font(.title)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button(action: {}) {
                    Image(systemName: "questionmark.square")
                }
                .tint(.green)
            }
        }
    }
}

#Preview {
    Toolbar_OnKeyboard()
}
