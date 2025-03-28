//
//  Edges_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/3/25.
//

import SwiftUI

struct Edges_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Ignores Safe Area")
                .padding()
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .background(.orange)
            
            Text("Introduction")
                .font(.title)
                .foregroundStyle(.gray)
            
            Text("Extend the header color past the safe area at the top.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.orange)
                .font(.title)
            
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    Edges_Intro()
}

struct Edges_KeyboardRegion_After: View {
    @State private var text = ""
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Ignores Safe Area",
                       subtitle: "Regions",
                       desc: "The orange rectangle is now ignoring the keyboard region and will not be pushed up when the keyboard is shown",
                       back: .orange, textColor: .black)
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(Color.orange)
                    .border(Color.red, width: 2)
                    .padding(.bottom)
                    .ignoresSafeArea(SafeAreaRegions.keyboard)
                
                TextField("Opens Keyboard", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
        }
        .font(.title)
    }
}

#Preview("Keyboard", body: {
    Edges_KeyboardRegion_After()
})
