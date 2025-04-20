//
//  Scope_WithAnimation_multipleViews.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/4/25.
//

import SwiftUI

struct Scope_WithAnimation_multipleViews: View {
    @State private var unlock = false
    @State private var open = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "With Animation",
                subtitle: "Multiple Views",
                desc: "Any value changed within the withAnimation closure will animate the view that uses that value in its modifiers. This value can exist anywhere in the view hierachy and affect many views."
            )
            .layoutPriority(1)
            
            Button {
                withAnimation {
                    unlock.toggle()
                }
            } label: {
                Image(systemName: unlock ? "lock.open" : "lock")
                    .offset(x: unlock ? 4.5 : 0)
                    .animation(.none, value: unlock)
            }

            
            GeometryReader { gp in
                ZStack {
                    VStack {
                        Text("Hello!")
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.pink)
                    }
                    .font(.system(size: 50))
                    
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(unlock ? .green : .red)
                            .offset(x: open ? -gp.size.width : 0)
                        Rectangle()
                            .fill(unlock ? .green : .red)
                            .offset(x: open ? gp.size.width : 0)
                    }
                    
                    if unlock && open == false {
                        Button("O P E N") {
                            withAnimation(.easeOut(duration: 0.7)) {
                                open = true
                            }
                        }
                    }
                }
            }
        }
        .font(.title)
    }
}

#Preview {
    Scope_WithAnimation_multipleViews()
}
