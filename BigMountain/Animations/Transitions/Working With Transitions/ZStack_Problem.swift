//
//  ZStack_Problem.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct ZStack_Problem: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    subtitle: "ZStack Problem",
                    desc: "When a view in a ZStack has a transition, sometimes it looks as though the removal effect is not working. This is because the view is getting moved UNDER the other layers and cannot be seen.",
                    back: Color("DarkAccent2"),
                    textColor: Color("LightShade2")
                )
                Button("Show") {
                    show.toggle()
                }
            }.blur(radius: show ? 10 : 0)
            
            if show {
                VStack {
                    Image("Phone")
                    Button("Close") {
                        show = false
                    }.padding(.top, 30)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("DarkAccent2"))
                        .shadow(radius: 20)
                )
                .transition(.slide)
            }
        }
        .font(.title)
        .tint(Color("Accent2"))
        .animation(.default, value: show)
    }
}

#Preview {
    ZStack_Problem()
}
