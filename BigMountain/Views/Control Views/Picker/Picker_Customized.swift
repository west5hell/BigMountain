//
//  Picker_Customized.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct Picker_Customized: View {
    @State private var favoriteState = 1
    @State private var youTUberName = "Mark"
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Picker")
                .font(.largeTitle)
            Text("With Modifiers")
                .foregroundStyle(.gray)
            Text("Your Favorite State:")
            Picker("Select State", selection: $favoriteState) {
                Text("California").tag(0)
                Text("Utah").tag(1)
                Text("Vermont").tag(2)
            }
            .pickerStyle(.wheel)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
            )
            .padding()
            
            Text("Who do you want to watch today?")
            Picker("Select person", selection: $youTUberName) {
                Text("Paul").tag("Paul")
                Text("Chris").tag("Chris")
                Text("Mark").tag("Mark")
                Text("Scott").tag("Scott")
                Text("Meng").tag("Meng")
            }
            .pickerStyle(.wheel)
            .padding(.horizontal)
            .border(.blue, width: 2)
            .padding()
        }
        .font(.title)
    }
}

#Preview {
    Picker_Customized()
}
