//
//  Duration_Long_Example.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Duration_Long_Example: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Image(systemName: "cloud.sun.fill")
                .font(.system(size: 200))
                .foregroundStyle(.purple)
                .opacity(0.3)
                .offset(x: change ? 240 : -240, y: 20)
                .animation(.linear(duration: 15), value: change)
            
            Image(systemName: "cloud.fill")
                .font(.system(size: 200))
                .foregroundStyle(.purple)
                .opacity(0.3)
                .offset(x: change ? -240 : 240, y: 200)
                .animation(.linear(duration: 15), value: change)
            
            VStack(spacing: 20) {
                HeaderView(
                    "Animation Options",
                    subtitle: "Long Duration Example",
                    desc: "Sometimes you want a very long duration to create subtle effects on your UI."
                )
                
                Spacer()
                
                Button("Change") {
                    change.toggle()
                }
            }
        }
        .font(.title)
    }
}

#Preview {
    Duration_Long_Example()
}
