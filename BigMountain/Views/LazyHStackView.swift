//
//  LazyHStackView.swift
//  BigMountain
//
//  Created by Pongt Chia on 22/3/25.
//

import SwiftUI

struct LazyHStackView: View {
    var body: some View {
        VStack {
            LazyHStack(spacing: 40) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.red, width: 2)
            
            LazyVStack(spacing: 20) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .border(Color.green, width: 2)
        }
    }
}


#Preview {
    LazyHStackView()
}

struct LazyHStack_WithScrolling: View {
    @State private var whatAppeared = ""
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView()
            
            Spacer()
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(0 ..< 51) { item in
                        Image(systemName: "\(item).circle")
                            .onAppear {
                                whatAppeared = "\(item).circle"
                            }
                    }
                }
            }
            .font(.largeTitle)
            .padding()
            
            Text("\(whatAppeared)")
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview("Scrolling", body: {
    LazyHStack_WithScrolling()
})
