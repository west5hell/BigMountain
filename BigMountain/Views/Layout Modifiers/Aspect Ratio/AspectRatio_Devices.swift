//
//  AspectRatio_Devices.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/3/25.
//

import SwiftUI

struct AspectRatio_Devices: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Aspect Ratio",
                subtitle: "Resizing for Devices",
                desc: "You might have a situation where you want the size of some view to always be half the width of the device but still maintain the same aspect ratio.",
                back: .orange,
                textColor: .white
            )
            
//            GeometryReader { gr in
//                RoundedRectangle(cornerRadius: 15)
//                    .frame(width: gr.size.width/2)
//                    .aspectRatio(1.5, contentMode: .fit)
//                    .foregroundStyle(.purple)
//                    .overlay {
//                        Text("3:3 Aspect Ratio")
//                            .foregroundStyle(.white)
//                    }
//            }
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: geometry.size.width/2)
                    .aspectRatio(1.5, contentMode: .fit)
                    .foregroundStyle(.purple)
                    .overlay(
                        Text("2:3 Aspect Ratio")
                            .foregroundStyle(.white)
                    )
            }
        }
        .font(.title)
    }
}

#Preview {
    AspectRatio_Devices()
}
