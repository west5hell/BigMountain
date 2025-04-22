//
//  Transition_Offset.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/4/25.
//

import SwiftUI

struct Transition_Offset: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Transition",
                    subtitle: "Offset",
                    desc: "The offset transition moves in FROM the offset you specify."
                )
                
                Button("Change") {
                    change.toggle()
                }
                
                Spacer()
                
                Group {
                    if change {
                        Image("Phone")
                            .transition(.offset(x: 200, y: -200))
                    }
                }
                .animation(.easeInOut(duration: 1), value: change)
                
                Spacer()
            }
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

#Preview {
    Transition_Offset()
}
