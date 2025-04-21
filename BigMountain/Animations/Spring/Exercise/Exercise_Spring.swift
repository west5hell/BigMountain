//
//  Exercise_Spring.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Exercise_Spring: View {
    @State private var start = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [Color("DarkAccent2"), Color("DarkShade2")]
                ),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Image("Phone")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical, 80)
                    .offset(x: start ? 0 : 400)
                    .animation(
                        .interpolatingSpring(
                            stiffness: 40,
                            damping: 8
                        ).delay(0.3),
                        value: start
                    )
                
                Text("PLANET EXPLORER")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color("LightShade2"))
                    .offset(x: start ? 0 : -400)
                    .animation(
                        .interpolatingSpring(
                            stiffness: 40,
                            damping: 8
                        ).delay(0.3),
                        value: start
                    )
                
                VStack {
                    Text("START")
                        .scaleEffect(start ? 1 : 0.2)
                        .opacity(start ? 1 : 0)
                        .animation(
                            .interpolatingSpring(
                                stiffness: 25,
                                damping: 5,
                                initialVelocity: 10
                            ).delay(0.9),
                            value: start
                        )
                        
                    Text("EXPLORING!")
                        .scaleEffect(start ? 1 : 0.2)
                        .opacity(start ? 1 : 0)
                        .animation(
                            .interpolatingSpring(
                                stiffness: 25,
                                damping: 5
                            ).delay(1.3),
                            value: start
                        )
                }
                .font(.title)
                .foregroundStyle(Color("LightAccent2"))
                
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color("LightShade2"))
                        .padding(25)
                        .background(
                            Circle()
                                .fill(Color("Accent2"))
                                .shadow(radius: 10)
                        )
                        .opacity(start ? 1 : 0)
                        .animation(.linear(duration: 1.6).delay(0.3), value: start)
                }
            }
            .onAppear {
                start.toggle()
            }
        }
    }
}

#Preview {
    Exercise_Spring()
}
