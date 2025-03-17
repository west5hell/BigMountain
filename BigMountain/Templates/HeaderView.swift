//
//  HeaderView.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/3/25.
//

import SwiftUI

struct HeaderView: View {
    var title = "Title"
    var subtitle = "Subtitle"
    var desc = "Use this to…"
    var back = Color.orange
    var textColor = Color.black
    
    init(
        _ title: String = "Title",
        subtitle: String = "Subtitle",
        desc: String = "Use this to…",
        back: Color = Color.orange,
        textColor: Color = Color.black
    ) {
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
        self.back = back
        self.textColor = textColor
    }
    
    var body: some View {
        VStack(spacing: 15) {
            if title != "" {
                Text(title)
                    .font(.largeTitle)
            }
            
            Text(subtitle)
                .foregroundStyle(.gray)
            
            DescView(desc, back: back, textColor: textColor)
        }
    }
}

//#Preview {
//    HeaderView()
//}
