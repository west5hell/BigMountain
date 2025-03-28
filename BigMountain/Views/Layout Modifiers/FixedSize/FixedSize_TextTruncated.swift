//
//  FixedSize_TextTruncated.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/3/25.
//

import SwiftUI

struct FixedSize_TextTruncated: View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView(
                "Fixed Size", subtitle: "Prevent Text Truncating",
                desc: "Use the fixedSize modifier to prevent text from truncating when layoutPriority won't work.",
                back: .yellow
            )
            
            Form {
                Section {
                    Text("Sometimes you get text that truncates like this:")
                    
                    Text("Joe Gatto, who starred in truTV’s “Impractical Jokers” from 2011 to 2021, has voluntarily begun in-patient care at a treatment facility following recent allegations against him of sexual assault and harassment. He has also canceled all upcoming dates on his current comedy tour.")
                        .listRowBackground(Color.pink)
                        .layoutPriority(1)
                    
                    Text("Joe Gatto, who starred in truTV’s “Impractical Jokers” from 2011 to 2021, has voluntarily begun in-patient care at a treatment facility following recent allegations against him of sexual assault and harassment. He has also canceled all upcoming dates on his current comedy tour.")
                        .listRowBackground(Color.green)
                        .fixedSize(horizontal: false, vertical: true)
                } header: {
                    Text("Text in a Form")
                        .font(.largeTitle)
                }
            }
        }
        .font(.title2)
    }
}

#Preview {
    FixedSize_TextTruncated()
}
