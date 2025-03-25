//
//  Scrollview_Disabled.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/3/25.
//

import SwiftUI

struct Scrollview_Disabled: View {
    @State private var diableScroll = false
    
    var items = [Color.green, Color.blue, Color.purple, Color.pink, Color.yellow, Color.orange]
    
    var body: some View {
        ScrollView {
            ForEach(items, id: \.self) { item in
                RoundedRectangle(cornerRadius: 15)
                    .fill(item)
                    .frame(height: 200)
                    .padding(.horizontal)
            }
        }
        .scrollDisabled(diableScroll)
        .scrollIndicators(.visible)
        .safeAreaInset(edge: .bottom, content: {
            Toggle("Disable Scrolling", isOn: $diableScroll)
                .padding()
                .background(.regularMaterial)
        })
        .font(.title)
    }
}

#Preview {
    Scrollview_Disabled()
}
