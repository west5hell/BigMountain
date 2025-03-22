//
//  LazyHGrid_Rows.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/3/25.
//

import SwiftUI

struct LazyHGrid_Rows: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "LazyHGrid",
                subtitle: "Rows",
                desc: "You can specify the number of rows with an array of GridItems."
            )
            
            Text("Two Rows (2 GridItems):")
            
            let twoRows = [GridItem(), GridItem()]
            
            LazyHGrid(rows: twoRows) {
                ForEach(1..<11) { item in
                    Image(systemName: "\(item).circle")
                }
                Image(systemName: "arrow.right.circle")
            }
            .font(.largeTitle)
            
            let fourRows = [GridItem(), GridItem(), GridItem(), GridItem()]
            
            LazyHGrid(rows: fourRows) {
                ForEach(1..<11) { item in
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
    LazyHGrid_Rows()
}
