//
//  ButtonStyleThinOutline.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//


import SwiftUI

struct ButtonStyleThinOutline: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundStyle(.white)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("Accent4"))
                    .opacity(0.1)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("Accent4"), lineWidth: 0.7)
            }
    }
}
