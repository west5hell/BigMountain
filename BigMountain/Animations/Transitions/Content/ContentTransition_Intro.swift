//
//  ContentTransition_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct ContentTransition_Intro: View {
    @State private var selection = 1
    
    var body: some View {
        VStack(spacing: 24) {
            Label("Interpolate", systemImage: "figure.run")
                .font(selection == 1 ? .largeTitle : .body)
                .frame(maxWidth: .infinity, alignment: selection == 1 ? .center : .leading)
                .padding(selection == 1 ? 64 : 8)
                .background(
                    Color.green.opacity(0.5),
                    in: RoundedRectangle(cornerRadius: 8)
                )
                .onTapGesture {
                    selection = 1
                }
                .contentTransition(.interpolate)
            Label("Opacity", systemImage: "figure.badminton")
                .font(selection == 2 ? .largeTitle : .body)
                .frame(maxWidth: .infinity, alignment: selection == 2 ? .center : .leading)
                .padding(selection == 2 ? 64 : 8)
                .background(
                    Color.green.opacity(0.5),
                    in: RoundedRectangle(cornerRadius: 8)
                )
                .onTapGesture {
                    selection = 2
                }
                .contentTransition(.opacity)
            Label("Identity", systemImage: "figure.badminton")
                .font(selection == 3 ? .largeTitle : .body)
                .frame(maxWidth: .infinity, alignment: selection == 3 ? .center : .leading)
                .padding(selection == 3 ? 64 : 8)
                .background(
                    Color.green.opacity(0.5),
                    in: RoundedRectangle(cornerRadius: 8)
                )
                .onTapGesture {
                    selection = 3
                }
                .contentTransition(.identity)
        }
        .animation(.default, value: selection)
        .padding()
    }
}

#Preview {
    ContentTransition_Intro()
}
