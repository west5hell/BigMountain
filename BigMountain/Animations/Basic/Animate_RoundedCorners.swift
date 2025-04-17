//
//  Animate_RoundedCorners.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/4/25.
//

import SwiftUI

struct Animate_RoundedCorners: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Properties",
                subtitle: "Corner Radius",
                desc: "You provide a value to set the corner radius of a view. The change of this property can be animated."
            )
            
            Button("Change") {
                change.toggle()
            }
            
            RoundedRectangle(cornerRadius: change ? 0 : 70)
                .foregroundStyle(.blue)
                .padding()
                .animation(.default, value: change)
            
            Text("You can also animate the cornerRadius modifier")
                .foregroundStyle(.white)
                .padding(25)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: change ? 0 : 70))
                .animation(.bouncy, value: change)
        }
        .font(.title)
    }
}

#Preview {
    Animate_RoundedCorners()
}
