//
//  Grid_Spacing.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/3/25.
//

import SwiftUI

struct Grid_Spacing: View {
    var body: some View {
        Grid(horizontalSpacing: 24, verticalSpacing: 24) {
            GridRow {
                Color.green.opacity(0.5)
                Color.green.opacity(0.5)
                Color.green.opacity(0.5)
            }
            GridRow {
                Color.blue.opacity(0.5)
                Color.orange.opacity(0.5)
                Color.red.opacity(0.5)
            }
            GridRow {
                Color.blue.opacity(0.5)
                Color.orange.opacity(0.5)
                Color.red.opacity(0.5)
            }
            GridRow {
                Color.orange.opacity(0.5)
                Color.orange.opacity(0.5)
                Color.red.opacity(0.5)
            }
        }
        .padding()
    }
}

#Preview {
    Grid_Spacing()
}
