//
//  Interpolating_InitialVelocity_Negative.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Interpolating_InitialVelocity_Negative: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            SpringBackgroundView()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Interpolating Spring",
                    subtitle: "Negative Initial Velocity",
                    desc: "Providing a negative value for initial velocity can create a cool effect where the view 'backs up' before taking off."
                )
                
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("Gold"))
                        .shadow(radius: 10)
                        .overlay {
                            VStack {
                                Text("Make Bigger!")
                                Image("Phone")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                            }
                        }
                        .aspectRatio(CGSize(width: 1, height: 1.5), contentMode: .fit)
                        .padding()
                        .scaleEffect(show ? 2 : 1, anchor: .leading)
                        .zIndex(1)
                        .animation(
                            .interpolatingSpring(
                                stiffness: 100,
                                damping: 10,
                                initialVelocity: -10
                            ),
                            value: show
                        )
                        .onTapGesture {
                            show.toggle()
                        }
                    
                    Text("Notice the rectangle gets smaller first before it gets bigger.")
                }
                .foregroundStyle(.white)
            }
            .font(.title)
        }
    }
}

#Preview {
    Interpolating_InitialVelocity_Negative()
}
