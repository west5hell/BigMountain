//
//  Trigger_Button.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Trigger_Button: View {
    @State private var showButtons = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 20) {
                HeaderView(
                    "Triggers",
                    subtitle: "Buttons",
                    desc: "You've seen this example a lot now. The tap of a button triggers the start of the animation."
                )
                Spacer()
            }
            
            Group {
                Button {
                    showButtons.toggle()
                } label: {
                    Image(systemName: "bag.badge.plus")
                        .padding(24)
                        .rotationEffect(.degrees(showButtons ? 0 : -90))
                }
                .background {
                    Circle()
                        .fill(.green)
                        .shadow(radius: 8, x: 4, y: 4)
                }
                .opacity(showButtons ? 1 : 0)
                .offset(x: 0, y: showButtons ? -150 : 0)

                Button {
                    showButtons.toggle()
                } label: {
                    Image(systemName: "gauge.badge.plus")
                        .padding(24)
                        .rotationEffect(.degrees(showButtons ? 0 : 90))
                }
                .background(
                    Circle()
                        .fill(.green)
                        .shadow(radius: 8, x: 4, y: 4)
                )
                .offset(x: showButtons ? -110 : 0, y: showButtons ? -110 : 0)
                .opacity(showButtons ? 1 : 0)
                
                Button {
                    showButtons.toggle()
                } label: {
                    Image(systemName: "calendar.badge.plus")
                        .padding(24)
                        .rotationEffect(.degrees(showButtons ? 0 : 90))
                }
                .background(
                    Circle()
                        .fill(.green)
                        .shadow(radius: 8, x: 4, y: 4)
                )
                .offset(x: showButtons ? -150 : 0, y: 0)
                .opacity(showButtons ? 1 : 0)
                
                Button {
                    showButtons.toggle()
                } label: {
                    Image(systemName: "plus")
                        .padding(24)
                        .rotationEffect(.degrees(showButtons ? 45 : 0))
                }
                .background(
                    Circle()
                        .fill(.green)
                        .shadow(radius: 8, x: 4, y: 4)
                )
            }
            .padding(.trailing, 20)
            .tint(.white)
            .animation(.default, value: showButtons)
        }
        .font(.title)
    }
}

#Preview {
    Trigger_Button()
}
