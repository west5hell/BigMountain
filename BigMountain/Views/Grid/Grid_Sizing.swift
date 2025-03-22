//
//  Grid_Sizing.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/3/25.
//

import SwiftUI

struct Grid_Sizing: View {
    var body: some View {
        Grid {
            GridRow {
                Color.blue.opacity(0.5)
                
                Color.orange.opacity(0.5)
                    .frame(width: 75)
                
                Color.red.opacity(0.5)
            }
            
            GridRow {
                Color.blue.opacity(0.5)
                Color.orange.opacity(0.5)
                Color.red.opacity(0.5)
                    .frame(height: 150)
            }
        }
    }
}

#Preview("Sizing") {
    Grid_Sizing()
}

struct Grid_UnsizedAxes: View {
    var body: some View {
        Grid {
            GridRow {
                Color.blue.opacity(0.5)
                
                Color.orange.opacity(0.5)
                    .frame(width: 75)
                
                Color.red.opacity(0.5)
            }
            
            GridRow {
                Color.blue.opacity(0.5)
                    .gridCellUnsizedAxes(.vertical)
                Color.orange.opacity(0.5)
                    .gridCellUnsizedAxes(.vertical)
                    .gridCellUnsizedAxes(.horizontal)
                Color.red.opacity(0.5)
                    .frame(height: 150)
            }
        }
    }
}

#Preview("Unsizing", body: {
    Grid_UnsizedAxes()
})
