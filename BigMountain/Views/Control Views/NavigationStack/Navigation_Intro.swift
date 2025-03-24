//
//  Navigation_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct Navigation_Intro: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green.opacity(0.25)
                    .ignoresSafeArea()
                
                Color.gray.opacity(0.25)
            }
            .navigationTitle("Background Color")
        }
        .font(.title)
    }
}

#Preview {
    Navigation_Intro()
}
