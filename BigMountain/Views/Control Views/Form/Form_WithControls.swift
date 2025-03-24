//
//  Form_WithControls.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct Form_WithControls: View {
    @State private var isOn = true
    @State private var textFieldData = "This is a text field"
    
    var body: some View {
        Form {
            Section {
                Text("This will give you an idea of how different controls are rendered in a Form.")
                    .foregroundStyle(.white)
                    .listRowBackground(Color.purple)
            } header: {
                Text("Controls in a form")
            }
            
            Section {
                Button(action: {}) {
                    Text("Button")
                }
                Toggle(isOn: $isOn) {
                    Text("Toggle")
                }
                Stepper {
                    Text("Stepper")
                } onIncrement: {
                    
                } onDecrement: {
                    
                }
                TextField("", text: $textFieldData)
                Image(systemName: "leaf.arrow.circlepath")
                    .font(.largeTitle)
                Circle()
                    .frame(height: 30)

            }
        }
        .font(.title)
    }
}

#Preview {
    Form_WithControls()
}
