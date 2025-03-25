//
//  Grid_Alignment.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/3/25.
//

import SwiftUI

struct Grid_Alignment: View {
    var body: some View {
        Grid(alignment: .top) {
            GridRow {
                Text("Top")
                
                Color.blue.opacity(0.5)
            }
            GridRow(alignment: .bottom) {
                Text("Bottom")
                VStack(alignment: .trailing) {
                    Text("Top")
                    Text("Trailing")
                }
                .gridCellAnchor(.topTrailing)
                
                Color.blue.opacity(0.5)
            }
        }
        .padding()
        .font(.title)
    }
}

#Preview {
    Grid_Alignment()
}
