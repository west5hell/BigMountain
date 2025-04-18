//
//  Delay_SequenceAnimation.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Delay_SequenceAnimation: View {
    @State private var show = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Delay",
                subtitle: "Sequence Animations",
                desc: "Use the delay to sequence animations"
            )
            
            Spacer()
            
            VStack {
                Group {
                    Image(systemName: "1.circle")
                        .opacity(show ? 1 : 0)
                        .animation(.easeIn.delay(0.5), value: show)
                    Image(systemName: "2.circle")
                        .opacity(show ? 1 : 0)
                        .animation(.easeIn.delay(0.9), value: show)
                    Image(systemName: "3.circle")
                        .opacity(show ? 1 : 0)
                        .animation(.easeIn.delay(1.3), value: show)
                }
                .font(.system(size: 100))
                
                Button("Go!", action: {})
                    .font(.system(size: 70))
                    .foregroundStyle(.white)
                    .padding(25)
                    .background(Circle().fill(.green))
                    .opacity(show ? 1 : 0)
                    .animation(.easeIn.delay(1.7), value: show)
            }
            .onAppear {
                show = true
            }
            Spacer()
            
        }
        .font(.title)
    }
}

#Preview {
    Delay_SequenceAnimation()
}
