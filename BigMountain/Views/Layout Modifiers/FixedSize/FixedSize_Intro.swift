//
//  FixedSize_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/3/25.
//

import SwiftUI

struct FixedSize_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Fixed Size",
                subtitle: "Introduction",
                desc: "The fixed size modifier allows content to expand past the bounds of its parent container."
            )
            Text("The text below stays within the bounds of the frame that is set.")
                .font(.body)
            
            ZStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image("taichi")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                Text("Welcome to SwiftUI!")
                    .italic()
                    .bold()
                    .font(Font.system(size: 40))
                    .shadow(color: .white, radius: 1, x: 1, y: 1)
                    .padding()
                    .frame(width: 200, height: 200, alignment: .leading)
                    .border(.yellow)
            }
            
            Text("If you add the fixedSize modifier, it will allow the text to go untruncated and extend to its ideal size.")
            ZStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image("taichi")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                Text("Welcome to SwiftUI!")
                    .italic()
                    .bold()
                    .font(Font.system(size: 40))
                    .shadow(color: .white, radius: 1, x: 1, y: 1)
                    .padding()
                    .fixedSize()
                    .frame(width: 200, height: 200, alignment: .leading)
                    .border(.yellow)
            }
        }
        .font(.title)
    }
}

#Preview {
    FixedSize_Intro()
}
