//
//  LazyHGrid_ColumnSpacing.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/3/25.
//

import SwiftUI

struct LazyHGrid_ColumnSpacing: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "LazyHGrid",
                subtitle: "Column Spacing",
                desc: "Control the spacing between items in the LazyHGrid with the spacing modifier."
            )
            
            Text("Spacing: 0")
            
            let gridItems = [GridItem()]
            
            LazyHGrid(rows: gridItems, spacing: 0) {
                ForEach(1..<6) { item in
                    Image(systemName: "\(item).circle")
                }
                Image(systemName: "arrow.right.circle")
            }
            .font(.largeTitle)
            
            Text("Spacing: 20")
            
            LazyHGrid(rows: gridItems, spacing: 20) {
                ForEach(1..<6) { item in
                    Image(systemName: "\(item).circle")
                }
                Image(systemName: "arrow.right.circle")
            }
            .font(.largeTitle)
        }
        .font(.title)
    }
}

#Preview {
    LazyHGrid_ColumnSpacing()
}
