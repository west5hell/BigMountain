//
//  WelcomeBackView.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct WelcomeBackView: View {
    @Binding private var showMenus: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome Back,")
                .fontWeight(.thin)
                .padding(.top)
            Text("Jaqueline")
                .fontWeight(.bold)
                .font(.largeTitle)
            Image("JOJO-Liu")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
            
            Spacer()
            
            Button {
                showMenus.toggle()
            } label: {
                Text("See Details")
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(ButtonStyleThinOutline())
            .padding()
        }
        .frame(width: 300, height: 600)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("Secondary4"))
                .shadow(radius: 8)
        )
        .scaleEffect(showMenus ? 0.7 : 1)
        .blur(radius: showMenus ? 5 : 0)
        .animation(showMenus ? .easeInOut(duration: 1) : .timingCurve(0.5, 0, 0.5, 1.5, duration: 1), value: showMenus)
    }
}
