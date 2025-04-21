//
//  Spring_Dampen.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Spring_Dampen: View {
    @State private var show = false
    @State private var dampingFraction = 0.825  // This is the default damping fraction.
    
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
                    subtitle: "Dampen",
                    desc: "Spring animations have a dampen property that dampens or make your spring less strong or intense."
                )
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color("Gold"))
                    .overlay {
                        Image("Phone")
                    }
                    .padding()
                    .scaleEffect(show ? 1 : 0.01, anchor: .bottom)
                    .opacity(show ? 1 : 0)
                    .animation(.spring(dampingFraction: dampingFraction), value: show)
                
                Button {
                    show.toggle()
                } label: {
                    Image(systemName: show ? "person.2.fill" : "person.2")
                        .foregroundStyle(Color("Gold"))
                        .font(.largeTitle)
                }
                .tint(Color("Accent"))
                
                HStack {
                    Image(systemName: "0.circle.fill")
                    Slider(value: $dampingFraction)
                    Image(systemName: "1.circle.fill")
                }
                .foregroundStyle(Color("Gold"))
                .padding()

            }
        }
        .font(.title)
    }
}

#Preview {
    Spring_Dampen()
}
