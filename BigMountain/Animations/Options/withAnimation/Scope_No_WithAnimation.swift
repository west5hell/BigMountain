//
//  Scope_No_WithAnimation.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/4/25.
//

import SwiftUI

struct Scope_No_WithAnimation: View {
    @State private var expandMoreInfo = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "With Animation",
                subtitle: "Sequencing with Parent/Child",
                desc: "Sometimes, withAnimation is the only solution when you want to animate a child view independently of a parent view."
            )
            .layoutPriority(1)
            
            Text("What you want is for the view to slide up THEN the child views to appear. Look what happens when you try to accomplish without withAnimation.")
            
            GeometryReader { gp in
                VStack(spacing: 15) {
                    HStack {
                        Image(systemName: "info.circle")
                            .padding(.horizontal)
                        Text("Login Help")
                        Spacer()
                    }
                    .padding(.top)
                    
                    VStack(spacing: 10) {
                        Image(systemName: "slider.horizontal.3")
                            .font(.largeTitle)
                        Text("Appear after parent is done animating out.")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .opacity(expandMoreInfo ? 1 : 0)
                    .animation(.default.delay(0.5), value: expandMoreInfo)
                }
                .padding(.trailing, 12)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.yellow)
                        .shadow(radius: 8)
                )
                .foregroundStyle(.black)
                .offset(
                    x: expandMoreInfo ? 15 : (gp.frame(in: .global).width - 65),
                    y: expandMoreInfo ? 15 : (gp.frame(in: .global).height - 65)
                )
                .animation(.easeInOut, value: expandMoreInfo)
                .onTapGesture {
                    expandMoreInfo.toggle()
                }
            }
        }
        .font(.title)
    }
}

#Preview {
    Scope_No_WithAnimation()
}
