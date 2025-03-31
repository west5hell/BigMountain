//
//  Redacted_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI

struct Redacted_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Redacted",
                subtitle: "Introduction",
                desc: "Use the redacted modifier to show placeholder views instead of actual content."
            )
            
            Text("Text Redacted Text Redacted Text Redacted")
                .redacted(reason: .placeholder)
            
            Text("Text not Redacted")
            
            DescView("Images can also be redacted")
            
            HStack {
                Text("Redacted")
                Image("JOJO-Liu")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .redacted(reason: .placeholder)
            }
            HStack {
                Text("Original")
                Image("JOJO-Liu")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
        }
        .font(.title)
    }
}

#Preview {
    Redacted_Intro()
}
