//
//  Form_WithDisclosureGroup.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct Form_WithDisclosureGroup: View {
    @State private var settingExpanded = true
    @State private var trebleOn = true
    @State private var bassOn = false
    @State private var levels = 0.5
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Form",
                subtitle: "With Disclosure Groups",
                desc: "You can add disclosure groups to a form to allow users to expand into more settings or views.",
                back: .purple, textColor: .white
            )
            
            Form {
                DisclosureGroup("Audio Settings", isExpanded: $settingExpanded) {
                    VStack {
                        Toggle("Treble", isOn: $trebleOn)
                        Toggle("Bass", isOn: $bassOn)
                        Slider(value: $levels)
                    }
                    .font(.title2)
                    .padding()
                }
            }
        }
        .font(.title)
        .tint(.purple)
    }
}

#Preview {
    Form_WithDisclosureGroup()
}
