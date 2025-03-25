//
//  Grid_CellColumns.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/3/25.
//

import SwiftUI

struct Grid_CellColumns: View {
    var body: some View {
        Grid {
            GridRow {
                Color.green.opacity(0.5)
                    .gridCellColumns(3)
            }
            GridRow {
                Color.blue.opacity(0.5)
                Color.red.opacity(0.5)
                    .gridCellColumns(2)
            }
            GridRow {
                Color.blue.opacity(0.5)
                Color.orange.opacity(0.5)
                Color.red.opacity(0.5)
            }
            GridRow {
                Color.orange.opacity(0.5)
                    .gridCellColumns(2)
                Color.red.opacity(0.5)
            }
        }
    }
}

#Preview {
    Grid_CellColumns()
}
