//
//  Transition_Slide.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/4/25.
//

import SwiftUI

struct Transition_Slide: View {
    @State private var change = false
    @State private var showLogin = false
    @State private var username = ""
    @State private var password = ""
    
    let xOffset: CGFloat = -200
    let showLoginDuration: Double = 0.7
    let delay = 0.5
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Transition",
                    subtitle: "Slide",
                    desc: ""
                )
                
                Spacer()
                
                if showLogin {
                    VStack(spacing: 30) {
                        Image(systemName: "lock.shield")
                            .font(.system(size: 70))
                            .padding()
                            .foregroundStyle(Color("Gold"))
                        TextField("Username", text: $username)
                            .textFieldStyle(.roundedBorder)
                        SecureField("Password", text: $password)
                            .textFieldStyle(.roundedBorder)
                        Button("Login") {
                            
                        }
                        .foregroundStyle(Color("Accent2"))
                    }
                    .padding(.horizontal)
                    .transition(.slide)
                }
                
                Spacer()
                Spacer()
            }
            .animation(.easeOut(duration: showLoginDuration), value: showLogin)
            .font(.title)
            .tint(Color("Accent2"))
            .onAppear {
                showLogin = true
            }
        }
    }
}

#Preview {
    Transition_Slide()
}
