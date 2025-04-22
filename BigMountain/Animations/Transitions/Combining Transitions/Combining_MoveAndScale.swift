//
//  Combining_MoveAndScale.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/4/25.
//

import SwiftUI

struct Combining_MoveAndScale: View {
    @State private var change = false
    
    var body: some View {
        TransitionBaseView(
            subtitle: "Combining Move & Scale",
            desc: "Here is an example of combining move and scale"
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
                            .move(
                                edge: .leading
                            ).combined(
                                with: .scale(
                                    scale: 0.1,
                                    anchor: .bottomLeading
                                )
                            )
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
    Combining_MoveAndScale()
}
