//
//  Interpolating_Damping.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Interpolating_Damping: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            SpringBackgroundView()
            
            VStack(spacing: 10) {
                HeaderView(
                    "Interpolating Spring",
                    subtitle: "Damping",
                    desc: "Damping controls how much drag or friction is added to the spring."
                )
                
                Button("Compare Damping") {
                    change.toggle()
                }
                
                HStack(alignment: .bottom, spacing: 30) {
                    VStack {
                        Text("0")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(stiffness: 10, damping: 0), value: change)
                    }
                    VStack {
                        Text("0.5")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(stiffness: 10, damping: 0.5), value: change)
                    }
                    VStack {
                        Text("1")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: change)
                    }
                    VStack {
                        Text("3")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(stiffness: 10, damping: 3), value: change)
                    }
                    VStack {
                        Text("5")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(stiffness: 10, damping: 5), value: change)
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
    Interpolating_Damping()
}
