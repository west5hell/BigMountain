//
//  AlignmentGuide_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/3/25.
//

import SwiftUI

struct AlignmentGuide_Intro: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView(
                "AlignmentGuide",
                subtitle: "Introduction",
                desc: "Use the alignmentGuide modifier to position views in relation to a guide. Guides can be vertical or horizontal.",
                back: .red
            )
            
            Text("Use Vertical Guides in HStacks")
            
            ZStack {
                HStack {
                    Image(systemName: "1.circle")
                        .alignmentGuide(VerticalAlignment.center) { _ in
                            20
                        }
                    Image(systemName: "2.circle")
                        .alignmentGuide(VerticalAlignment.center) { _ in
                            0
                        }
                    Image(systemName: "3.circle")
                        .alignmentGuide(VerticalAlignment.center) { _ in
                            -20
                        }
                }
                Divider()
                    .background(.red)
            }
            
            Text("Use Horizontal Guides in VStacks")
            
            ZStack {
                VStack(spacing: 10) {
                    Image(systemName: "1.circle")
                        .alignmentGuide(HorizontalAlignment.center) { _ in
                            20
                        }
                    Image(systemName: "2.circle")
                        .alignmentGuide(HorizontalAlignment.center) { _ in
                            0
                        }
                    Image(systemName: "3.circle")
                        .alignmentGuide(HorizontalAlignment.center) { _ in
                            -20
                        }
                }
                HStack {
                    Divider()
                        .background(.red)
                }
            }
        }
        .font(.title)
    }
}

#Preview {
    AlignmentGuide_Intro()
}
