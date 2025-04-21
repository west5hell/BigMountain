//
//  Spring_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Spring_Intro: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                center: .center,
                startRadius: 10,
                endRadius: 400
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Spring",
                    subtitle: "Introduction",
                    desc: "The spring animation adds a bounce to your animtions."
                )
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color("Gold"))
                    .overlay {
                        Image("Phone")
                    }
                    .padding()
                    .scaleEffect(show ? 1 : 0.01, anchor: .bottom)
                    .opacity(show ? 1 : 0)
                    .animation(.spring(), value: show)
                
                Button {
                    show.toggle()
                } label: {
                    Image(systemName: show ? "person.2.fill" : "person.2")
                        .foregroundStyle(Color("Gold"))
                        .font(.largeTitle)
                }
                .tint(Color("Accent"))

            }
        }
        .font(.title)
    }
}

#Preview {
    Spring_Intro()
}
