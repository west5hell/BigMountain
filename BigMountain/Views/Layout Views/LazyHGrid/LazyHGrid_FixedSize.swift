//
//  LazyHGrid_FixedSize.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/3/25.
//

import SwiftUI

struct LazyHGrid_FixedSize: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "LazyHGrid",
                subtitle: "Fixed Height",
                desc: "Give items in the LazyHGrid a fixed height using the GridItem. This will effectively change the height for the entire row."
            )
            
            Text("Fixed Heights: 50, 50, 20, 200")
            
            let rows = [
                GridItem(GridItem.Size.fixed(50)),
                GridItem(.fixed(50)),
                GridItem(.fixed(20)),
                GridItem(.fixed(200))
            ]
            
            LazyHGrid(rows: rows) {
                ForEach(1..<11) { item in
                    Image(systemName: "\(item).circle")
                        .foregroundStyle(Color.random())
                }
                Image(systemName: "arrow.right.circle")
            }
            .font(.largeTitle)
        }
        .font(.title)
    }
}

#Preview {
    LazyHGrid_FixedSize()
}
