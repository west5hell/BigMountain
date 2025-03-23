//
//  ScrollViewReader_Animating.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/3/25.
//

import SwiftUI

struct ScrollViewReader_Animating: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView()
            
            ScrollViewReader { scrollViewProxy in
                Button("Animate Scrolling To Bottom") {
                    withAnimation {
                        scrollViewProxy.scrollTo(50)
                    } completion: {
                        
                    }
                }
                
                ScrollView(showsIndicators: true) {
                    ForEach(1..<51) { index in
                        getImage(for: index)
                            .font(.largeTitle)
                            .frame(height: 70)
                            .id(index)
                    }
                }
                
                Button("Animate Scrolling To Top") {
                    withAnimation {
                        scrollViewProxy.scrollTo(1)
                    } completion: {
                        
                    }
                }
            }
        }
        .font(.title)
    }
    
    func getImage(for index: Int) -> some View {
        if index == 1 || index == 50 {
            return Image(systemName: "\(index).square.fill")
                .foregroundStyle(Color.red)
        }
        return Image(systemName: "\(index).square")
            .foregroundStyle(Color.primary)
    }
}

#Preview {
    ScrollViewReader_Animating()
}
