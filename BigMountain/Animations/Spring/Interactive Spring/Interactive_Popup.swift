//
//  Interactive_Popup.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Interactive_Popup: View {
    @State private var showPopup = false
    @State private var animate = true
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                center: .center,
                startRadius: 10,
                endRadius: 400
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Interactive Spring",
                    subtitle: "Show Popup",
                    desc: "The popup will bounce when shown and disappear with no animation."
                )
                
                Spacer()
                Button("Show Popup") {
                    animate.toggle()
                    showPopup = true
                }
            }
            .font(.title)
            .blur(radius: showPopup ? 2 : 0)
            .animation(.easeOut, value: showPopup)
            
            ZStack {
                Color.black
                    .opacity(0.4)
                    .ignoresSafeArea()
                    .animation(.none, value: showPopup)
                
                VStack {
                    Circle()
                        .fill(Color("Gold"))
                        .frame(width: 70, height: 70)
                        .overlay {
                            Image(systemName: "questionmark.circle")
                                .font(.system(size: 50))
                                .foregroundStyle(.white)
                        }
                        .offset(y: 40)
                        .zIndex(1)
                    VStack {
                        Color("Gold")
                            .frame(height: 40)
                        Spacer()
                        Text("Animate the appearance of this popup!")
                        Spacer()
                        Button("Close") {
                            showPopup = false
                        }
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color("Gold"))
                    }
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .frame(height: 300)
                .background(.clear)
                .padding(.horizontal, 25)
                .scaleEffect(
                    x: showPopup ? 1 : 0.8,
                    y: showPopup ? 1 : 1.3
                )
                .animation(.spring(response: 0.2, dampingFraction: 0.5), value: animate)
            }
            .opacity(showPopup ? 1 : 0)
        }
        .tint(Color("Accent"))
    }
}

#Preview {
    Interactive_Popup()
}
