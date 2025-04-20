//
//  WithAnimation_Sequencing_Completion.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/4/25.
//

import SwiftUI

struct WithAnimation_Sequencing_Completion: View {
    @State private var expandMoreInfo = false
    @State private var showInfo = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "With Animation",
                subtitle: "Sequencing Using Completion",
                desc: "You can also trigger the next animation using a completion on the withAnimation function."
            )
            
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
                    } completion: {
                        showInfo.toggle()
                    }
                }
            }
        }
        .font(.title)
    }
}

#Preview {
    WithAnimation_Sequencing_Completion()
}
