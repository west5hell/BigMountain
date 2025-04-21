//
//  Spring_Options_Delay.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Spring_Options_Delay: View {
    @State private var show = false
    @State private var largeScale: CGFloat = 5
    
    var body: some View {
        ZStack {
            SpringBackgroundView()
            
            VStack(spacing: 40) {
                HeaderView(
                    "Spring Options",
                    subtitle: "Delay",
                    desc: "Use the delay to sequence sprint animtions."
                )
                
                Button("Start") {
                    show.toggle()
                }
                .tint(Color("Accent"))
                
                Spacer()
                
                HStack(spacing: 30) {
                    Group {
                        Image(systemName: "1.circle")
                            .opacity(show ? 1 : 0)
                            .scaleEffect(show ? 1 : largeScale)
                            .animation(
                                .spring(
                                    response: 0.4,
                                    dampingFraction: 0.5
                                ),
                                value: show
                            )
                        Image(systemName: "2.circle")
                            .opacity(show ? 1 : 0)
                            .scaleEffect(show ? 1 : largeScale)
                            .animation(
                                .spring(
                                    response: 0.4,
                                    dampingFraction: 0.5
                                ).delay(0.3),
                                value: show
                            )
                        Image(systemName: "3.circle")
                            .opacity(show ? 1 : 0)
                            .scaleEffect(show ? 1 : largeScale)
                            .animation(
                                .spring(
                                    response: 0.4,
                                    dampingFraction: 0.5
                                ).delay(0.6),
                                value: show
                            )
                    }
                    .foregroundStyle(Color("Gold"))
                    .font(.system(size: 100))
                }
            }
            .font(.title)
        }
    }
}

#Preview {
    Spring_Options_Delay()
}
