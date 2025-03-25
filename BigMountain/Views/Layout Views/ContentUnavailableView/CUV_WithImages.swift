//
//  CUV_WithImages.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/3/25.
//

import SwiftUI

struct CUV_WithImages: View {
    var body: some View {
        VStack {
            ContentUnavailableView("With Image Asset", image: "刘宝瑞")
            
            ContentUnavailableView("With SF Font", systemImage: "paintbrush")
            
            ContentUnavailableView {
                Label("With Label", systemImage: "paintbrush")
            }
        }
    }
}

#Preview {
    CUV_WithImages()
}
