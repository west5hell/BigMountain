//
//  Scrollview_Horizontal.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/3/25.
//

import SwiftUI

struct Scrollview_Horizontal: View {
    var items = [Color.green, Color.blue, Color.purple, Color.pink, Color.yellow, Color.orange]
    
    var body: some View {
        GeometryReader { gr in
            VStack {
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack {
                        ForEach(items, id: \.self) { item in
                            RoundedRectangle(cornerRadius: 15)
                                .fill(item)
                                .frame(width: gr.size.width - 60)
                        }
                    }
                }
                .padding(.trailing)
                .safeAreaInset(edge: .leading) {
                    VStack(spacing: 10) {
                        Text("Scroll")
                            .font(.body)
                        Image(systemName: "arrow.left.circle")
                    }
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal)
                    .background(.regularMaterial)
                }
                .frame(height: 200)
                
                Spacer()
            }
        }
        .font(.title)
    }
}

#Preview {
    Scrollview_Horizontal()
}
