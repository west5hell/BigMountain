//
//  Image_ScaledMetricImage.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Image_ScaledMetricImage: View {
    @ScaledMetric var size: CGFloat = 32
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Image",
                subtitle: "Scaled Metric",
                desc: "Use the ScaledMetric property wrapper to adjust the size of an image in relation to the dynamic text size.",
                back: .red,
                textColor: .primary
            )
            
            HStack {
                Image("swiftui-96x96_2x")
                    .resizable()
                    .frame(width: size, height: size)
                
                Text("Grows with Text")
            }
        }
        .font(.title)
    }
}

#Preview {
    Image_ScaledMetricImage()
}
