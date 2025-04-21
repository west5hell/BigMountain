//
//  SpringObject_Presets_Customization.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct SpringObject_Presets_Customization: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Circle()
                    .overlay {
                        Text("bouncy")
                            .foregroundStyle(.white)
                    }
                    .animation(.bouncy(duration: 0.5, extraBounce: 0.0), value: change)
                Circle()
                    .overlay {
                        Text("long")
                            .foregroundStyle(.white)
                    }
                    .animation(.bouncy(duration: 2), value: change)
                Circle()
                    .overlay {
                        Text("extra")
                            .foregroundStyle(.white)
                    }
                    .animation(.bouncy(extraBounce: 0.5), value: change)
                Circle()
                    .overlay {
                        Text("+, +")
                            .foregroundStyle(.white)
                    }
                    .animation(.bouncy(duration: 0.8, extraBounce: 0.4), value: change)
            }
            .foregroundStyle(.gold)
            .frame(height: 100)
            .frame(maxWidth: .infinity, alignment: change ? .trailing : .leading)
            
            Button("Change") {
                change.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .font(.title)
    }
}

#Preview {
    SpringObject_Presets_Customization()
}
