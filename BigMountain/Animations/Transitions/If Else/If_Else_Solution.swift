//
//  If_Else_Solution.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct If_Else_Solution: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Transitions",
                    subtitle: "ZStack Problem",
                    desc: "What you will have to do is put each view into its onw if statement to get it work properly.",
                    back: Color("DarkAccent2"),
                    textColor: Color("LightShade2")
                )
                
                Button("Change") {
                    change.toggle()
                }.padding(.bottom)
                
                if change {
                    Image("Phone")
                        .transition(.move(edge: .leading))
                }
                
                if change == false {
                    Image("Phone")
                        .transition(.move(edge: .trailing))
                }
                
                // Actually in the code, I don't see any difference.
                
                Spacer()
            }
            .animation(.default, value: change)
        }
        .font(.title)
        .tint(Color("Accent2"))
    }
}

#Preview {
    If_Else_Solution()
}
