//
//  ScrollViewReader_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/3/25.
//

import SwiftUI

struct ScrollViewReader_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "ScrollViewReader",
                subtitle: "Introduction",
                desc:
                    "Use the ScrollViewReader to access the scrollTo function so you can programmatically scroll to a specific view."
            )

            ScrollViewReader { scrollView in
                Button("Scroll To Bottom") {
                    scrollView.scrollTo(50)
                }
                ScrollView {
                    ForEach(1..<51) { index in
                        getImage(for: index)
                            .font(.largeTitle)
                            .frame(height: 70)
                            .id(index)
                    }
                }
                Button("Scroll To Top") {
                    scrollView.scrollTo(1)
                }
            }
        }
        .font(.title)
    }

    func getImage(for index: Int) -> some View {
        if index == 1 || index == 50 {
            return Image(systemName: "\(index).square.fill")
                .foregroundStyle(Color.red)
        }
        return Image(systemName: "\(index).square")
            .foregroundStyle(Color.primary)
    }
}

#Preview("") {
    ScrollViewReader_Intro()
}
