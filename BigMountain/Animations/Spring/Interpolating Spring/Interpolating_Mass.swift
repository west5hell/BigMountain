//
//  Interpolating_Mass.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Interpolating_Mass: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            SpringBackgroundView()
            
            VStack(spacing: 10) {
                HeaderView(
                    "Interpolating Spring",
                    subtitle: "Mass",
                    desc: "Mass adds 'weight' to the view attached to the spring."
                )
                Button("Compare Mass") {
                    change.toggle()
                }
                
                HStack(alignment: .bottom, spacing: 40) {
                    VStack {
                        Text("0.01")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(
                                .interpolatingSpring(
                                    mass: 0.01,
                                    stiffness: 50,
                                    damping: 7
                                ),
                                value: change
                            )
                    }
                    VStack {
                        Text("0.5")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(
                                .interpolatingSpring(
                                    mass: 0.5,
                                    stiffness: 50,
                                    damping: 7
                                ),
                                value: change
                            )
                    }
                    VStack {
                        Text("1")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(
                                .interpolatingSpring(
                                    mass: 1,
                                    stiffness: 50,
                                    damping: 7
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
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(
                                .interpolatingSpring(
                                    mass: 10,
                                    stiffness: 50,
                                    damping: 7
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
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(
                                .interpolatingSpring(
                                    mass: 100,
                                    stiffness: 50,
                                    damping: 7
                                ),
                                value: change
                            )
                    }
                }
                .font(.system(size: 25))
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    Interpolating_Mass()
}
