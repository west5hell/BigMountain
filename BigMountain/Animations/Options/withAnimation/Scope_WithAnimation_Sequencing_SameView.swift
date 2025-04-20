//
//  Scope_WithAnimation_Sequencing_SameView.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/4/25.
//

import SwiftUI

struct Scope_WithAnimation_Sequencing_SameView: View {
    @State private var expandMoreInfo = false
    @State private var showInfo = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "With Animation",
                subtitle: "Sequencing with Parent/Child",
                desc: "This solution works correctly when using withAnimation to animate the parent and the child views. Notice you need a second state variable for the second animation."
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
                    .opacity(showInfo ? 1 : 0)
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
                    withAnimation {
                        expandMoreInfo.toggle()
                    }
                    
                    withAnimation(.default.delay(0.5)) {
                        showInfo.toggle()
                    }
                }
            }
        }
        .font(.title)
    }
}

#Preview {
    Scope_WithAnimation_Sequencing_SameView()
}
