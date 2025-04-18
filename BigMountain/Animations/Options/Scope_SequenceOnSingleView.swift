//
//  Scope_SequenceOnSingleView.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Scope_SequenceOnSingleView: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Scope",
                subtitle: "Sequence on Single View",
                desc: "Earlier, you learned how to use delay to sequence animations. You can also sequence multiple animations on single view."
            )
            
            Button("Change") {
                change.toggle()
            }
            
            Spacer()
            
            Image(systemName: "heart.fill")
                .foregroundStyle(.yellow)
                .font(.system(size: 150))
                .scaleEffect(change ? 2 : 1)
                .animation(.easeInOut(duration: 1), value: change)
                .scaleEffect(change ? 0.75 : 1)
                .animation(.easeIn.delay(1), value: change)
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Scope_SequenceOnSingleView()
}
