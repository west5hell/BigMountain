//
//  Grid_ColumnCount.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/3/25.
//

import SwiftUI

struct Grid_ColumnCount: View {
    var body: some View {
        Grid {
            GridRow {
                ForEach(1..<3) { number in
                    Image(systemName: "\(number).square")
                }
            }
            GridRow {
                ForEach(1..<5) { number in
                    Image(systemName: "\(number).square")
                }
            }
            GridRow {
                ForEach(1..<8) { number in
                    Image(systemName: "\(number).square")
                }
            }
        }
        .font(.title)
    }
}

#Preview {
    Grid_ColumnCount()
}
