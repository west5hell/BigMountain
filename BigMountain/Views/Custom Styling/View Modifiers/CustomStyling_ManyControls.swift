//
//  CustomStyling_ManyControls.swift
//  BigMountain
//
//  Created by Pongt Chia on 30/3/25.
//

import SwiftUI

struct CustomStyling_ManyControls: View {
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .addOutline(lineWidth: 10)
            
            Capsule(style: RoundedCornerStyle.continuous)
                .addOutline(lineWidth: 20, trim: 0.5)
            
            RoundedRectangle(cornerRadius: 25)
                .addOutline(lineWidth: 20)
        }
    }
}

#Preview {
    CustomStyling_ManyControls()
}

extension Shape {
    func addOutline(lineWidth: CGFloat = 1, trim: CGFloat = 1) -> some View {
        let gradientColors = Gradient(colors: [.pink, .purple])
        let linearGradient = LinearGradient(
            gradient: gradientColors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        return self
            .trim(from: 0, to: trim)
            .stroke(
                linearGradient,
                style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
            )
            .padding(lineWidth / 2 + 5)
    }
}
