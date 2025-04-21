//
//  TernaryCondition.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct TernaryCondition: View {
    @State private var showCard = false
    @State private var useAnimation = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Turn On or Off",
                subtitle: "Ternary Operator in Animation",
                desc: "You can use a ternary operator in the animation modifier to turn animations on or off."
            )
            
            Button {
                showCard.toggle()
                useAnimation = true
            } label: {
                Image(systemName: "creditcard")
                    .font(.largeTitle)
            }
            VStack {
                HStack {
                    Spacer()
                    Text("Get the Card")
                    Spacer()
                    Button {
                        useAnimation = false
                        showCard.toggle()
                    } label: {
                        Text("X")
                            .font(.body)
                            .padding(8)
                    }
                    .background(
                        Circle()
                            .stroke(.white)
                    )
                }
                .foregroundStyle(.white)
                Image("card")
                    .resizable()
                    .scaledToFit()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue)
            )
            .padding(.horizontal)
            .offset(x: showCard ? 0 : -400)
            .animation(useAnimation ? .default : .none, value: showCard)
        }
        .font(.title)
    }
}

#Preview {
    TernaryCondition()
}
