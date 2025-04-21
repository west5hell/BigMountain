//
//  Interpolating_Stiffness.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Interpolating_Stiffness: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            SpringBackgroundView()
            
            VStack(spacing: 10) {
                HeaderView(
                    "Interpolating Spring",
                    subtitle: "Stiffness",
                    desc: "Stiffness means how unmoving something is. Zero is completely stiff. Higher values are less and less stiff, moving faster."
                )
                Button("Compare Stiffness") {
                    change.toggle()
                }
                
                HStack(alignment: .bottom, spacing: 30) {
                    VStack {
                        Text("0.7")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(stiffness: 0.7, damping: 1), value: change)
                    }
                    VStack {
                        Text("1")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(stiffness: 1, damping: 1), value: change)
                    }
                    VStack {
                        Text("10")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: change)
                    }
                    VStack {
                        Text("50")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: change)
                    }
                    VStack {
                        Text("100")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(stiffness: 100, damping: 1), value: change)
                    }
                    VStack {
                        Text("200")
                            .bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(stiffness: 200, damping: 1), value: change)
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
    Interpolating_Stiffness()
}
