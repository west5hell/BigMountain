//
//  Animate_Trim.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/4/25.
//

import SwiftUI

struct Animate_Trim: View {
    @State private var change = false
    @State private var circleProgress: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Properties",
                subtitle: "Trim",
                desc: "Animating the trim of a circle is a great way to show progress"
            )
            
            Button("Change") {
                change.toggle()
                circleProgress = change ? 0.25 : 1
            }
            
            Spacer()
            
            Circle()
                .trim(from: 0, to: circleProgress)
                .stroke(.blue, style: .init(lineWidth: 40, lineCap: .round))
                .frame(height: 300)
                .rotationEffect(.degrees(-90))
                .padding(40)
                .animation(.default, value: change)
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Animate_Trim()
}
