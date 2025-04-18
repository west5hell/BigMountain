//
//  Trigger_OnAppear.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Trigger_OnAppear: View {
    @State private var expand = false
    
    var body: some View {
        ZStack {
            Image(systemName: "sun.max.fill")
                .padding()
                .foregroundStyle(.white)
                .background(
                    Circle()
                        .fill(.green)
                        .scaleEffect(expand ? 20 : 1)
                        .ignoresSafeArea()
                )
                .onAppear {
                    expand.toggle()
                }
                .animation(.easeIn, value: expand)
            
            VStack(spacing: 20) {
                HeaderView(
                    "Triggers",
                    subtitle: "On Appear",
                    desc: "You can have animation start as a view appears."
                )
                Spacer()
            }
        }
        .font(.title)
    }
}

#Preview {
    Trigger_OnAppear()
}
