//
//  GroupBoxStyle_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/3/25.
//

import SwiftUI

struct GroupBoxStyle_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView()
            
            Text("No style")
            
            GroupBox {
                Text("SwiftUI4ever")
            } label: {
                Text("Username")
            }
            
            Divider()
            
            Text("Custom GroupBox Style")
            
            GroupBox {
                Text("SwiftUI4ever")
            } label: {
                Text("Username")
            }
            .groupBoxStyle(CenteredGroupBoxStyle())

        }
        .font(.title)
    }
}

#Preview {
    GroupBoxStyle_Intro()
}

struct CenteredGroupBoxStyle: GroupBoxStyle {
    var backColor = Color.clear
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 5) {
            configuration.label
                .font(Font.body.lowercaseSmallCaps().weight(.bold))
                .foregroundStyle(.secondary)
            configuration.content
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            Rectangle().fill(backColor.opacity(0.2))
        )
    }
}
