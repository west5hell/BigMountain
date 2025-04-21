//
//  Speed_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Speed_Intro: View {
    @State private var change = false
    let duration = 1.0
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView(
                "Speed",
                subtitle: "Introduction",
                desc: "Animations have a speed modifier that allows you to slow down or speed up animaitons."
            )
            
            Button("Change") {
                change.toggle()
            }
            Text("Normal")
            Circle()
                .fill(.orange)
                .frame(height: 70)
                .offset(x: change ? 170 : -170)
                .animation(.easeInOut(duration: duration), value: change)
            Text("2X Faster")
            Circle()
                .fill(.orange)
                .frame(height: 70)
                .offset(x: change ? 170 : -170)
                .animation(.easeInOut(duration: duration).speed(2), value: change)
            Text("Half Slower")
            Circle()
                .fill(.orange)
                .frame(height: 70)
                .offset(x: change ? 170 : -170)
                .animation(.easeInOut(duration: duration).speed(0.5), value: change)
        }
        .font(.title)
    }
}

#Preview {
    Speed_Intro()
}
