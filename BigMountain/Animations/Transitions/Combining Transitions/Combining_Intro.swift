//
//  Combining_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/4/25.
//

import SwiftUI

struct Combining_Intro: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkAccent2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Transitions",
                    subtitle: "Combining Introduction",
                    desc: "You can combine transition effects to work together. For example, here is the combination of slide and opacity."
                )
                
                Button("Change") {
                    change.toggle()
                }
                
                Spacer()
                
                if change {
                    Image("Phone")
                        .transition(.slide.combined(with: .opacity))
                }
            }
            .animation(.default, value: change)
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

#Preview {
    Combining_Intro()
}
