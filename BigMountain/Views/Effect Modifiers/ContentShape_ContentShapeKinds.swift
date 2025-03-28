//
//  ContentShape_ContentShapeKinds.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/3/25.
//

import SwiftUI

struct ContentShape_ContentShapeKinds: View {
    @State private var likes = 0
    
    var body: some View {
        VStack(spacing: 20) {
            TwoCircles()
                .opacity(0.5)
                .shadow(color: .black, radius: 3)
            
            TwoCircles()
                .compositingGroup()
                .opacity(0.5)
                .shadow(color: .black, radius: 3)
            
            VStack(spacing: 20) {
                Image(systemName: likes > 0 ? "heart.fill" : "heart")
                    .foregroundStyle(likes > 0 ? .red : .gray)
                    .frame(width: 100, height: 100)
                Text("Hit me! (Likes: \(likes))")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.red, lineWidth: 1)
            )
            .contentShape(RoundedRectangle(cornerRadius: 20))
            .onTapGesture {
                self.likes += 1
            }
            
            HStack {
                Image(systemName: "trash.circle")
                    .font(.system(size: 70))
                    .contentShape(.contextMenuPreview, Circle())
                    .contextMenu {
                        Button("Menu 1", action: {})
                        Button("Menu 2", action: {})
                    }
                
                Image(systemName: "trash.circle")
                    .font(.system(size: 70))
                    .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: 10))
                    .contextMenu {
                        Button("Menu 1", action: {})
                        Button("Menu 2", action: {})
                    }
            }
        }
        .font(.title)
    }
}

#Preview {
    ContentShape_ContentShapeKinds()
}

struct TwoCircles: View {
    var body: some View {
        HStack(spacing: -60) {
            Circle()
                .foregroundStyle(.red)
            Circle()
                .foregroundStyle(.green)
        }
        .frame(height: 160)
    }
}
