//
//  PreferenceKey_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI

struct PreferenceKey_Intro: View {
    @State private var total = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "PreferenceKey",
                subtitle: "Introduction",
                desc: "A custom preference key is something you create so you can use the preferences modifier. You tell it how to handle values being set to the preference key."
            )
            
            HStack {
                Text("Electricity:")
                Text("$78.25")
                    .preference(key: CustomPreferenceKey.self, value: 78.25)
            }
            
            HStack {
                Text("Gas:")
                Text("$1,123.01")
                    .preference(key: CustomPreferenceKey.self, value: 1123.01)
            }
            
            Text("Total: $\(Int(total))")
                .bold()
        }
        .font(.title)
        .onPreferenceChange(CustomPreferenceKey.self) { value in
            total = value
        }
    }
}

#Preview {
    PreferenceKey_Intro()
}

struct CustomPreferenceKey: PreferenceKey {
    static var defaultValue = 0.0
    
    static func reduce(value: inout Double, nextValue: () -> Double) {
        value = value + nextValue()
    }
}
