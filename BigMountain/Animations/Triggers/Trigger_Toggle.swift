//
//  Trigger_Toggle.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Trigger_Toggle: View {
    @State private var isOn = false
    @State private var extraInfo = ""
    @State private var extraAmount = 0.65
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Triggers",
                subtitle: "Toggle",
                desc: "The toggle can also be used to trigger animations. Maybe you want to enable or show options."
            )
            
            Toggle("Extra Options", isOn: $isOn)
                .padding(.horizontal)
            Group {
                VStack(spacing: 20) {
                    Image(systemName: "hammer.fill")
                    Text("Your extra options!")
                    TextField("Extra Info", text: $extraInfo)
                        .textFieldStyle(.roundedBorder)
                    Slider(value: $extraAmount)
                }
                .padding(28)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                )
                .padding(.horizontal)
                .saturation(isOn ? 1 : 0)
                .opacity(isOn ? 1 : 0.25)
                .animation(.default, value: isOn)
            }
        }
        .font(.title)
    }
}

#Preview {
    Trigger_Toggle()
}
