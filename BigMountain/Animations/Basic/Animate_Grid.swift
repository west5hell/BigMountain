//
//  Animate_Grid.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/4/25.
//

import SwiftUI

struct Animate_Grid: View {
    @State private var change = false
    var body: some View {
        VStack(spacing: 20) {
            Grid {
                GridRow {
                    if change == false {
                        Color.red.opacity(0.7)
                        Color.green.opacity(0.7)
                    }
                    Color.blue.opacity(0.7)
                        .gridCellColumns(change ? 3 : 1)
                }
                
                GridRow {
                    Color.blue.opacity(0.7)
                        .gridCellColumns(change ? 3 : 1)
                    
                    if change == false {
                        Color.red.opacity(0.7)
                        Color.green.opacity(0.7)
                    }
                }
            }
            .animation(.default, value: change)
            
            Button("Change") {
                change.toggle()
            }
        }
        .font(.title)
    }
}

#Preview {
    Animate_Grid()
}
