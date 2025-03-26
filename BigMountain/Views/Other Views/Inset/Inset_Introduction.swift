//
//  Inset_Introduction.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Inset_Introduction: View {
    @State private var insetAmount: CGFloat = 45
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Inset")
                .font(.largeTitle)
            Text("Introduction")
                .foregroundStyle(.gray)
            Text("Inset applies only to shapes. It allows you to add padding between the edge of the frame and the shape itself.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.purple)
                .foregroundStyle(.white)
            
            Text("Inset by 20")
            Circle()
                .inset(by: 20)
                .fill(.purple)
                .frame(width: 200)
                .border(.purple)
            
            Text("Slide to Adjust Inset")
            Rectangle()
                .inset(by: insetAmount)
                .fill(.purple)
                .frame(width: 300, height: 200)
                .border(.purple)
            
            HStack {
                Text("0")
                Slider(value: $insetAmount, in: 0...95)
                Text("95")
            }
            .padding()
        }
        .font(.title)
    }
}

#Preview {
    Inset_Introduction()
}
