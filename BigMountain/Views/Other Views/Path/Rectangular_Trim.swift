//
//  Rectangular_Trim.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Rectangular_Trim: View {
    @State private var circleProgress: CGFloat = 1.0
    private var circlePercentage: Int {
        Int(circleProgress * 100.0)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Rectangle()
                .trim(from: 0, to: circleProgress)
                .stroke(.blue, style: StrokeStyle(lineWidth: 40, lineCap: .round))
                .frame(height: 300)
                .padding(40)
                .overlay {
                    Text("\(circlePercentage)%")
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                }
            
            VStack {
                Text("Progress")
                HStack {
                    Text("0%")
                    Slider(value: $circleProgress)
                    Text("100%")
                }
            }
            .padding()
        }
        .font(.title)
    }
}

#Preview {
    Rectangular_Trim()
}
