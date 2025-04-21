//
//  Interpolating_CompareStiffnessDamping.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Interpolating_CompareStiffnessDamping: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            SpringBackgroundView()
            
            VStack(spacing: 10) {
                HeaderView(
                    "Interpolating Spring",
                    subtitle: "Stiffness & Damping Comparison",
                    desc: "Use Stiffness to help control the speed to the destination. Use damping to help control extent of bounce."
                )
                
                Button("Compare Stiffness & Damping") {
                    change.toggle()
                }
                
                HStack(alignment: .bottom, spacing: 40) {
                    VStack {
                        Text("End State").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 50, height: 400)
                    }
                    VStack {
                        Text("50, 7").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 50, height: change ? 400 : 50)
                            .animation(.interpolatingSpring(stiffness: 50, damping: 7), value: change)
                    }
                    VStack {
                        Text("1, 1").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 50, height: change ? 400 : 50)
                            .animation(.interpolatingSpring(stiffness: 1, damping: 1), value: change)
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
    Interpolating_CompareStiffnessDamping()
}
