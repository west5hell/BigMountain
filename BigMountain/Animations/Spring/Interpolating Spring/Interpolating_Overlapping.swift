//
//  Interpolating_Overlapping.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Interpolating_Overlapping: View {
    @State private var degrees = 0.0
    @State private var taps = 0
    
    var body: some View {
        ZStack {
            SpringBackgroundView()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Interpolating Spring",
                    subtitle: "Overlapping the Animation",
                    desc: "Triggering an interpolatingSpring multiple times can increase the strength of the animation each time."
                )
                
                Circle()
                    .fill(Color("Gold"))
                    .frame(width: 300, height: 300)
                    .overlay {
                        Image(systemName: "arrow.up")
                            .offset(y: -120)
                    }
                    .rotationEffect(.degrees(degrees))
                    .animation(
                        .interpolatingSpring(
                            stiffness: 1,
                            damping: 0.8
                        ),
                        value: degrees
                    )
                    .onTapGesture {
                        degrees += 25
                        taps += 1
                    }
                
                Text("Taps: \(taps)")
                    .foregroundStyle(Color("Gold"))
            }
            .font(.title)
        }
    }
}

#Preview {
    Interpolating_Overlapping()
}
