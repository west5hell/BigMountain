//
//  SpringObject_Customization.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct SpringObject_Customization: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Circle()
                    .overlay {
                        Text("tight")
                            .foregroundStyle(.white)
                    }
                    .animation(.spring(AppAnimations.tightSpring), value: change)
                Circle()
                    .overlay {
                        Text("heavy")
                            .foregroundStyle(.white)
                    }
                    .animation(.spring(AppAnimations.heavySpring), value: change)
                Circle()
                    .overlay {
                        Text("loose")
                            .foregroundStyle(.white)
                    }
                    .animation(.spring(AppAnimations.looseSpring), value: change)
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
    SpringObject_Customization()
}
