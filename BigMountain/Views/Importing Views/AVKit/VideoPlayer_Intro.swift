//
//  VideoPlayer_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI
import AVKit

struct VideoPlayer_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "VideoPlayer",
                subtitle: "Introduction",
                desc: "You can now play videos with a SwiftUI VideoPlayer view."
            )
            
//            VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "", withExtension: "mov")!))
            
//            DescView("This is an example of playing a local video file called ''.")
            
            VideoPlayer(player: AVPlayer(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8")!)) {
                VStack {
                    Image("JOJO-Liu")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .opacity(0.5)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
            
            DescView("Note: The movie should be a file hosted on the Web. You won't be able to pulicly hosted videos from YouTyube, for example.")
        }
        .font(.title)
    }
}

#Preview {
    VideoPlayer_Intro()
}
