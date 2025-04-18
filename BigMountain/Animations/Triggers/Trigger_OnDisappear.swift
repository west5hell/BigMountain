//
//  Trigger_OnDisappear.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Trigger_OnDisappear: View {
    @State private var showTip = true
    @State private var showTipButton = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Triggers",
                subtitle: "On Disappear",
                desc: "When you make a view go away, you can trigger an animation on how it disappears."
            )
            Spacer()
            
            if showTip {
                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                        Spacer()
                        Text("Tip of the Day")
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    Spacer()
                    Button("Got It") {
                        showTip.toggle()
                    }
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(.green)
                        .shadow(radius: 3)
                )
                .padding(.horizontal)
                .frame(height: 200)
                .onDisappear {
                    showTipButton = true
                }
            }
            
            if showTipButton {
                HStack {
                    Button {
                        showTipButton = false
                        showTip = true
                    } label: {
                        Image(systemName: "info.circle")
                    }
                    .padding(.leading, 24)
                    Spacer()

                }
            }
        }
        .animation(.default, value: showTipButton)
        .font(.title)
    }
}

#Preview {
    Trigger_OnDisappear()
}
