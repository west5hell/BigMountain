//
//  Combining_ThreeEffects.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/4/25.
//

import SwiftUI

struct Combining_ThreeEffects: View {
    @State private var change = false
    
    var body: some View {
        TransitionBaseView(
            subtitle: "Combining Three Effects",
            desc: "You can combine more than 2 effects. Also notice that order does matter. This is like the previous example but the first two effects have been switched."
        ) {
            Spacer()
            
            HStack(alignment: .bottom) {
                Button {
                    change.toggle()
                } label: {
                    Image(systemName: "macwindow")
                }
                if change {
                    Image("Phone")
                        .transition(
                            .scale(scale: 0.1, anchor: .bottomLeading)
                            .combined(with: .move(edge: .leading))
                            .combined(with: .opacity)
                        )
                }
                Spacer()
            }
            .animation(.default, value: change)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        }
        .font(.title)
        .tint(Color("Accent2"))
    }
}

#Preview {
    Combining_ThreeEffects()
}
