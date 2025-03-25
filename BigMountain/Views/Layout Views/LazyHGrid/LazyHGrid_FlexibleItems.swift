//
//  LazyHGrid_FlexibleItems.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/3/25.
//

import SwiftUI

struct LazyHGrid_FlexibleItems: View {
    var body: some View {
        VStack(spacing: 15) {
            HeaderView(
                "LazyHGrid",
                subtitle: "Flexible Height",
                desc: "Give items in a row a flexible height through the GridItem."
            )
            
            Text("Top Row Flex: 50 to 60")
            Text("Bottom Row Flex: 20 to 40")
            
            let rows = [
                GridItem(.flexible(minimum: 50, maximum: 60)),
                GridItem(.flexible(minimum: 20, maximum: 40))
            ]
            LazyHGrid(rows: rows) {
                ForEach(1..<11) { item in
                    Color.random()
                        .frame(width: 50)
                }
            }
            Spacer()
            Text("Top Row Flex: 10 to 20")
            Text("Bottom Row Flex: 20 to 40")
            
            let rows2 = [
                GridItem(.flexible(minimum: 10, maximum: 20)),
                GridItem(.flexible(minimum: 20, maximum: 40))
            ]
            LazyHGrid(rows: rows2) {
                ForEach(1..<11) { item in
                    Color.random()
                        .frame(width: 50)
                }
            }
        }
        .font(.title)
    }
}

#Preview {
    LazyHGrid_FlexibleItems()
}
