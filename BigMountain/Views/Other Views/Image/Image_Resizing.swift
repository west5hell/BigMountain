//
//  Image_Resizing.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Image_Resizing:View {
    var body: some View {
        VStack(spacing: 5) {
            HeaderView(
                "Image",
                subtitle: "Resizing",
                desc: "With the resizable modifier, you can then adjust the frame to resize.",
                back: .red,
                textColor: .primary
            )
            
            Image("swiftui-96x96_2x")
                .resizable()
                .scaledToFit()
                
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

#Preview {
    Image_Resizing()
}
