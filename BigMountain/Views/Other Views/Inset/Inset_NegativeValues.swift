//
//  Inset_NegativeValues.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Inset_NegativeValues: View {
    @State private var insetAmount: CGFloat = 10
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Inset")
                .font(.largeTitle)
            Text("Negative Values")
                .foregroundStyle(.gray)
            Text("You can EXTEND a shape past its frame by using a negative inset value.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.purple)
                .foregroundStyle(.white)
            
            Text("Inset by -20")
            Circle()
                .inset(by: -20)
                .fill(.purple)
                .frame(width: 100)
                .border(.purple)
            
            Text("Slide to Adjust Inset")
            Rectangle()
                .inset(by: insetAmount)
                .fill(.purple)
                .frame(width: 200, height: 200)
                .border(.purple)
                .padding(30)
            
            HStack {
                Text("-100")
                Slider(value: $insetAmount, in: -100...20)
                Text("20")
            }
            .padding()
        }
        .font(.title)
    }
}

#Preview {
    Inset_NegativeValues()
}
