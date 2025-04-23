//
//  If_Else_Problem.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct If_Else_Problem: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Transitions",
                    subtitle: "ZStack Problem",
                    desc: "Transitions define how views are inserted and removed. This means you will have views in an if block. But what about switching between two views using the else block? Take a look:",
                    back: Color("DarkAccent2"),
                    textColor: Color("LightShade2")
                )
                
                Button("Change") {
                    change.toggle()
                }.padding(.bottom)
                
                if change {
                    Image("Phone")
                        .transition(.move(edge: .leading))
                } else {
                    Image("Phone")
                        .transition(.move(edge: .trailing))
                }
                
                Spacer()
            }
            .animation(.default, value: change)
        }
        .font(.title)
        .tint(Color("Accent2"))
    }
}

#Preview {
    If_Else_Problem()
}
