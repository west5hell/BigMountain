//
//  ButtonStyle_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/3/25.
//

import SwiftUI

struct ButtonStyle_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Manually Modified", action: {})
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 2)
                )
            
            Button("Using ButtonStyle", action: {})
                .buttonStyle(OutlineButtonStyle())
            
            Button("Default OutlineButtonStyle", action: {})
                .buttonStyle(OutlineButtonStyle())
            Button("Red OutlineButtonStyle", action: {})
                .buttonStyle(OutlineButtonStyle(buttonColor: .red))
            Button("Purple OutlineButtonStyle", action: {})
                .buttonStyle(OutlineButtonStyle(buttonColor: .purple))
        }
        .font(.title)
    }
}

#Preview {
    ButtonStyle_Intro()
}

struct OutlineButtonStyle: ButtonStyle {
    var buttonColor = Color.blue
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.2 : 1)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(buttonColor, lineWidth: 2)
            )
            .foregroundStyle(buttonColor)
    }
}
