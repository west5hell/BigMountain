//
//  TabView_PageTabViewStyle.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/3/25.
//

import SwiftUI

struct TabView_PageTabViewStyle: View {
    var body: some View {
        TabView {
            VStack(spacing: 20) {
                HeaderView(
                    "TabView",
                    subtitle: "PageTabViewStyle",
                    desc: "The tab view can have a style applied to it which enables the ability to horizontally swipe through views that snap into place."
                )
                Text("PAGE")
                HStack {
                    Image(systemName: "1.circle")
                    Image(systemName: "arrow.right.circle")
                }
            }
            
            VStack {
                Text("PAGE")
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Image(systemName: "2.circle")
                    Image(systemName: "arrow.right.circle")
                }
            }
            
            VStack {
                Text("PAGE")
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Image(systemName: "3.circle")
                }
            }
        }
        .font(.title)
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    TabView_PageTabViewStyle()
}
