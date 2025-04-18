//
//  Exercise1_TheSetup.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Exercise1_TheSetup: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Exercise",
                subtitle: "The Setup",
                desc: "The first thing you want to do is to build the end state of your animation. This will be WAY easier than building the begin state and trying to animate it together."
            )
            
            Spacer()
            
            VStack(spacing: 1) {
                HStack(alignment: .bottom, spacing: 1) {
                    Rectangle()
                        .frame(width: 70, height: 35)
                    Rectangle()
                        .frame(width: 35, height: 70)
                }
                .offset(x: -18)
                HStack(alignment: .top, spacing: 1) {
                    Rectangle()
                        .frame(width: 36, height: 72)
                    Rectangle()
                        .frame(width: 72, height: 36)
                }
                .offset(x: 18)
            }
            .foregroundStyle(.red)
            .opacity(change ? 1 : 0)
            .animation(.default, value: change)
            
            Spacer()
            
            Button("Change") {
                change.toggle()
            }
            .padding(.bottom)
        }
        .font(.title)
    }
}

#Preview {
    Exercise1_TheSetup()
}
