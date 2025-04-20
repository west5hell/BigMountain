//
//  Scope_WithAnimation_Sequencing.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/4/25.
//

import SwiftUI

struct Scope_WithAnimation_Sequencing: View {
    @State private var show1 = false
    @State private var show2 = false
    @State private var show3 = false
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView(
                "With Animation",
                subtitle: "Sequencing",
                desc: "Here is a way to use withAnimation to sequence animations. It's similar to what you learned with earlier with the delay modifier."
            )
            
            Button("Change") {
                withAnimation(.default) {
                    show1.toggle()
                }
                withAnimation(.default.delay(0.4)) {
                    show2.toggle()
                }
                withAnimation(.default.delay(0.8)) {
                    show3.toggle()
                }
            }
            
            Spacer()
            
            VStack(spacing: 20) {
                Image(systemName: "1.circle")
                    .opacity(show1 ? 1 : 0)
                Image(systemName: "2.circle")
                    .opacity(show2 ? 1 : 0)
                Image(systemName: "3.circle")
                    .opacity(show3 ? 1 : 0)
            }
            .font(.system(size: 80))
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Scope_WithAnimation_Sequencing()
}
