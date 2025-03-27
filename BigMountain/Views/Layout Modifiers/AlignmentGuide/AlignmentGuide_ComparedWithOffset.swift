//
//  AlignmentGuide_ComparedWithOffset.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/3/25.
//

import SwiftUI

struct AlignmentGuide_ComparedWithOffset: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "AlignmentGuide",
                subtitle: "Compared with Offset",
                desc: "Use the alignmentGuide modifier to position views in relation to a guide. Guides can be vertical or horizontal",
                back: .red
            )
            .layoutPriority(1)
            
            Text("Using alignment guide")
            
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
            .border(.red, width: 2)
            
            Text("Using offset")
            HStack {
                Image(systemName: "1.circle")
                    .offset(y: -20)
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                    .offset(y: 20)
            }
            .border(.red, width: 2)
            
            DescView(
                "Using alignment guides will move the frame of the view. Offset only moves the content (frame stays).",
                back: .red
            )
        }
        .font(.title)
    }
}

#Preview {
    AlignmentGuide_ComparedWithOffset()
}
