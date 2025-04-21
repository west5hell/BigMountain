//
//  SpringObject_Presets.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct SpringObject_Presets: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Circle()
                    .overlay {
                        Text("bouncy")
                            .foregroundStyle(.white)
                    }
                    .animation(.spring(.bouncy), value: change)
                Circle()
                    .overlay {
                        Text("smooth")
                            .foregroundStyle(.white)
                    }
                    .animation(.spring(.smooth), value: change)
                Circle()
                    .overlay {
                        Text("snappy")
                            .foregroundStyle(.white)
                    }
                    .animation(.spring(.snappy), value: change)
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
    SpringObject_Presets()
}
