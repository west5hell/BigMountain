//
//  Image_FromAssetCatalog.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Image_FromAssetCatalog: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Image",
                subtitle: "From Asset Catalog",
                desc: "By default, your images retain their original size.",
                back: .red
            )
            
            Image("go-logo-white")
                .background(.gray)
            
            DescView(
                "You can change the size by adding the resizable modifier.",
                back: .red
            )
            
            Image("go-logo-white")
                .resizable()
                .background(.gray)
            
            DescView(
                "By default, resizable will allow the image to expand to fill all available space.",
                back: .red
            )
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
        .minimumScaleFactor(00.5)
    }
}

#Preview {
    Image_FromAssetCatalog()
}
