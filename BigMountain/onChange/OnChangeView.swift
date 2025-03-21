//
//  OnChangeView.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/3/25.
//

import SwiftUI

struct OnChange_Intro: View {
    @State private var name = "Rabbit"
    @State private var icon = "hare.fill"
    @State private var color = Color.brown
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "onChange",
                subtitle: "Introduction",
                desc: "Allows you to run some code when a value changes.",
                back: .blue,
                textColor: .white
            )
            
            Button("Change Animal") {
                if name == "Rabbit" {
                    name = "Turtle"
                } else {
                    name = "Rabbit"
                }
            }
            
            Label(name, systemImage: icon)
                .padding()
                .background(color, in: RoundedRectangle(cornerRadius: 8))
        }
        .font(.title)
        .onChange(of: name) { oldValue, newValue in
            if newValue == "Turtle" {
                icon = "tortoise.fill"
                color = Color.green
            } else {
                icon = "hare.fill"
                color = Color.brown
            }
        }
    }
}

#Preview {
    OnChange_Intro()
}
