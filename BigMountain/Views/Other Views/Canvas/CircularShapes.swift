//
//  CircularShapes.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/3/25.
//

import SwiftUI

struct CircularShapes: View {
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .padding()
                Circle()
                    .fill(Color.white)
                    .padding(40)
                Circle()
                    .fill(Color.red)
                    .padding(60)
                Circle()
                    .fill(Color.white)
                    .padding(80)
            }
            .frame(width: 200, height: 200)
            
            ZStack(alignment: .bottom) {
                Circle()
                    .fill(.secondary)
                    .frame(height: 250)
                Circle()
                    .fill(.secondary)
                    .frame(height: 200)
                Circle()
                    .fill(.secondary)
                    .frame(height: 150)
                Circle()
                    .fill(.secondary)
                    .frame(height: 100)
            }
        }
        .font(.title)
    }
}

#Preview {
    CircularShapes()
}
