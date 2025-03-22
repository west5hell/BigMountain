//
//  Grid_Comparison.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/3/25.
//

import SwiftUI

struct Grid_Comparison: View {
    var body: some View {
        VStack {
            HStack {
                Text("Column 1")
                Color.blue
                    .opacity(0.5)
                    .overlay(Text("Column 2"))
                    .frame(height: 50)
            }
            HStack {
                Text("Column 1")
            }
            HStack {
                Text("Column 1")
                Image(systemName: "arrow.left")
            }
        }
        .font(.title)
    }
}

#Preview {
    Grid_Comparison()
}
