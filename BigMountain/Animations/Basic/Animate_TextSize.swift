//
//  Animate_TextSize.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/4/25.
//

import SwiftUI

struct Animate_TextSize: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Animatable Properties",
                subtitle: "Text Size",
                desc: "You can also animate text size."
            )
            
            Button("Change") {
                change.toggle()
            }
            
            Spacer()
            
            Text("Hello!")
                .font(.system(size: change ? 150 : 20))
                .animation(.default, value: change)
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Animate_TextSize()
}
