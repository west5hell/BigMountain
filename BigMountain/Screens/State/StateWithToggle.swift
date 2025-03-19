//
//  StateWithToggle.swift
//  BigMountain
//
//  Created by Pongt Chia on 19/3/25.
//

import SwiftUI

struct StateWithToggle: View {
    @State private var darkerBackgroud = false
    
    var body: some View {
        ZStack {
            Color(darkerBackgroud ? .gray : .white)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "State",
                    subtitle: "Property Wrappers",
                    desc: "Many controls require a two-way binding to work.",
                    back: .blue,
                    textColor: .white
                )
                .layoutPriority(1)
                
                Spacer()
                
                Toggle(isOn: $darkerBackgroud) {
                    Text("Darker background: \(darkerBackgroud ? "ON" : "OFF")")
                }
                .padding(.horizontal)
                
                Spacer()
                
                DescView(
                    "The entire view is invalidated and redrawn when a state variable changes.",
                    back: .blue,
                    textColor: .white
                )
            }
            .font(.title)
        }
    }
}

#Preview {
    StateWithToggle()
}
