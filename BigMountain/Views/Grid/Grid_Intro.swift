//
//  Grid_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/3/25.
//

import SwiftUI

struct Grid_Intro: View {
    var body: some View {
        Grid {
            GridRow {
                Text("Column 1")
                Color.blue
                    .opacity(0.5)
                    .overlay(Text("Column 2"))
                    .frame(height: 50)
            }
            GridRow {
                Text("Column 1")
            }
            GridRow {
                Text("Column 1")
                Image(systemName: "arrow.left")
            }
        }
        .font(.title)
    }
}

#Preview {
    Grid_Intro()
}
