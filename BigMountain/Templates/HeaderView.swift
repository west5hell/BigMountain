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

    init(
        _ title: String = "Title",
        subtitle: String = "Subtitle",
        desc: String = "Use this to…",
    ) {
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
    }

    var body: some View {
        VStack(spacing: 15) {
            if title != "" {
                Text(title)
                    .font(.largeTitle)
            }

            Text(subtitle)
                .foregroundStyle(.gray)

            DescView(desc)
        }
    }
}

//#Preview {
//    HeaderView()
//}
