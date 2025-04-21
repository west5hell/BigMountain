//
//  Exercise_AnimationOptions.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Exercise_AnimationOptions: View {
    @State private var showLogin = false
    @State private var userName = ""
    @State private var password = ""
    
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
                Text("Exercise")
                    .foregroundStyle(Color("Gold"))
                    .font(.system(size: 70).bold())
                Text("Show Login")
                    .foregroundStyle(.gray)
                Spacer()
                VStack(spacing: 30) {
                    Image(systemName: "lock.shield")
                        .font(.system(size: 70))
                        .padding()
                        .foregroundStyle(Color("Gold"))
                        .scaleEffect(showLogin ? 1 : 4)
                        .animation(.easeIn(duration: 0.5).delay(0.5), value: showLogin)
                    TextField("Username", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : -200)
                        .animation(.easeOut(duration: 0.5).delay(0.5), value: showLogin)
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : -200)
                        .animation(.easeOut(duration: 0.5).delay(0.5), value: showLogin)
                    Button("Login") {
                        
                    }
                    .foregroundStyle(Color("Accent"))
                    .opacity(showLogin ? 1 : 0)
                    .offset(x: showLogin ? 0 : -200)
                    .animation(.easeOut(duration: 0.5).delay(0.5), value: showLogin)
                }
                .padding(.horizontal)
                .onAppear {
                    showLogin = true
                }
                
                Spacer()
                Spacer()
            }
        }
        .font(.title)
    }
}

#Preview {
    Exercise_AnimationOptions()
}
