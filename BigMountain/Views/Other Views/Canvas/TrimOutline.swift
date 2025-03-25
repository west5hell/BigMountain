//
//  TrimOutline.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/3/25.
//

import SwiftUI

struct TrimOutline: View {
    @State private var circleProgress: CGFloat = 1.0
    private var circlePercentage: Int {
        Int(circleProgress * 100.0)
    }
    
    var body: some View {
        VStack(spacing: 40) {
            Circle()
                .trim(from: 0, to: circleProgress)
                .stroke(.purple, style: StrokeStyle(lineWidth: 40, lineCap: CGLineCap.round))
                .frame(height: 300)
                .rotationEffect(.degrees(-90))
                .overlay(content: {
                    Text("\(circlePercentage)%")
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                })
                .padding(40)
            
            VStack {
                Text("Progress")
                HStack {
                    Text("0%")
                    Slider(value: $circleProgress)
                    Text("100%")
                }
            }
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    TrimOutline()
}
