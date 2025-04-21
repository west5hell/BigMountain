//
//  Value_ShowHideExample.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Value_ShowHideExample: View {
    @State private var showCard = false
    @State private var animateOnChange = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Value",
                subtitle: "Show & Hide Example",
                desc: "Here is an example of using the value parameter to turn off every other animation. You want to animate showing a card but then no animation when hiding it."
            )
            
            Button {
                showCard.toggle()
                animateOnChange.toggle()
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
            .animation(.default, value: animateOnChange)
        }
        .font(.title)
    }
}

#Preview {
    Value_ShowHideExample()
}
