//
//  CUV_Paging.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/3/25.
//

import SwiftUI

struct CUV_Paging: View {
    var body: some View {
        TabView {
            ContentUnavailableView(
                "Look",
                image: "look",
                description: Text("Look through all the pictures in the book")
            )
            
            ContentUnavailableView(
                "Learn",
                image: "learn",
                description: Text("Learn what is possible.")
            )
            
            ContentUnavailableView(
                "Remeber",
                image: "remember",
                description: Text("You can remeber pictures 60k faster than code.")
            )
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    CUV_Paging()
}
