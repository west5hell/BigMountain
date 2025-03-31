//
//  Accessibility_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI

struct Accessibility_Intro: View {
    @State private var selected = false
    @State private var sliderValue = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Accessibility",
                subtitle: "Introduction",
                desc: "Accessibility is automatically built into SwiftUI. But you can enhance it with the accessibility modifer."
            )
            
            Text("Hello, new user!")
            Image(systemName: "hand.wave.fill")
                .accessibilityLabel(Text("hand waving"))
                .font(Font.system(size: 50))
            
            Image("JOJO-Liu")
                .resizable()
                .frame(width: 50, height: 50)
                .accessibilityLabel("Liu Baorui")
            
            Button(action: {}) {
                Image(systemName: "x.circle")
            }
            .accessibilityLabel(Text("Close"))
            
            Button {
                selected.toggle()
            } label: {
                Image(systemName: selected ? "moon.circle.fill" : "moon.circle")
                    .font(.largeTitle)
            }
            .accessibilityLabel(Text("Night mode"))
            .accessibilityAddTraits(selected ? .isSelected : [])
            
            Slider(value: $sliderValue, in: 1...10) {
                
            } minimumValueLabel: {
                Image(systemName: "speaker.fill")
            } maximumValueLabel: {
                Image(systemName: "speaker.wave.3.fill")
            }
            .accessibilityLabel(Text("Volume"))
            .accessibilityValue(Text("\(Int(sliderValue))"))
            .foregroundStyle(.green)
            .padding()

        }
        .font(.title)
    }
}

#Preview {
    Accessibility_Intro()
}
