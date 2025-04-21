//
//  Interpolating_IntialVelocity.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Interpolating_IntialVelocity: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            SpringBackgroundView()
            
            VStack(spacing: 10) {
                HeaderView(
                    "Interpolating Spring",
                    subtitle: "Initial Velocity",
                    desc: "Initial velocity is how fast the start of the animation is."
                )
                
                Button("Compare Initial Velocity") {
                    change.toggle()
                }
                
                HStack(alignment: .bottom, spacing: 40) {
                    VStack {
                        Text("0")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(
                                .interpolatingSpring(
                                    mass: 1,
                                    stiffness: 50,
                                    damping: 7,
                                    initialVelocity: 0
                                ),
                                value: change
                            )
                    }
                    VStack {
                        Text("5")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(
                                .interpolatingSpring(
                                    mass: 1,
                                    stiffness: 50,
                                    damping: 7,
                                    initialVelocity: 5
                                ),
                                value: change
                            )
                    }
                    VStack {
                        Text("10")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(
                                .interpolatingSpring(
                                    mass: 1,
                                    stiffness: 50,
                                    damping: 7,
                                    initialVelocity: 10
                                ),
                                value: change
                            )
                    }
                    VStack {
                        Text("50")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(
                                .interpolatingSpring(
                                    mass: 1,
                                    stiffness: 50,
                                    damping: 7,
                                    initialVelocity: 50
                                ),
                                value: change
                            )
                    }
                    VStack {
                        Text("100")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 30, height: change ? 400 : 25)
                            .animation(
                                .interpolatingSpring(
                                    mass: 1,
                                    stiffness: 50,
                                    damping: 7,
                                    initialVelocity: 100
                                ),
                                value: change
                            )
                    }
                }
                .font(.system(size: 25))
                .foregroundStyle(.white)
            }
            .font(.title)
        }
    }
}

#Preview {
    Interpolating_IntialVelocity()
}
