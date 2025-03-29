//
//  ButtonStyle_Default.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/3/25.
//

import SwiftUI

struct ButtonStyle_Default: View {
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Text("DefaultButtonStyle")
                    
                Button("DefaultButtonStyle", action: {})
                    .buttonStyle(DefaultButtonStyle())
                
                Text("PlainButtonStyle")
                Button("PlainButtonStyle", action: {})
                    .buttonStyle(PlainButtonStyle())
                
                Text("BorderlessButtonStyle")
                Button("BorderlessButtonStyle", action: {})
                    .buttonStyle(BorderlessButtonStyle())
            }
        }
        .font(.title)
    }
}

#Preview {
    ButtonStyle_Default()
}
