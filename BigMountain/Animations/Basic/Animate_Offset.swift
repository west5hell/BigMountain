//
//  Animate_Offset.swift
//  BigMountain
//
//  Created by Pongt Chia on 16/4/25.
//

import SwiftUI

struct Animate_Offset: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Properties",
                subtitle: "Offset",
                desc: "Animate the location of a view using X and Y coordinates."
            )
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.blue)
                .frame(width: 100, height: 100)
                .offset(x: change ? 140 : -140, y: 0)
                .animation(.default, value: change)
            
            DescView(
                "Offset also uses a CGSize object. A width with positive value moves right, negative values move left. For height, positive values move up, nagative values move down."
            )
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.blue)
                .frame(width: 100, height: 100)
                .offset(
                    change ? CGSize(width: 140, height: 0) : CGSize(width: -140, height: 0)
                )
                .animation(.default, value: change)
            
            Button("Change") {
                change.toggle()
            }
        }
        .font(.title)
    }
}

#Preview {
    Animate_Offset()
}
