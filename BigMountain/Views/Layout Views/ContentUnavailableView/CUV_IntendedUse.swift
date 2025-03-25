//
//  CUV_IntendedUse.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/3/25.
//

import SwiftUI

struct CUV_IntendedUse: View {
    @State private var tags: [String] = []
    
    var body: some View {
        if tags.isEmpty {
            ContentUnavailableView {
                Label("No Tags", systemImage: "tag.fill")
            } description: {
                Text("You don't have any tags yet. \nAdd a new tag today to get started!")
            } actions: {
                Button {
                    tags.append("Switzerland")
                } label: {
                    Text("Add Tag")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
            }

        } else {
            List(tags, id: \.self) { tag in
                Text(tag)
            }
        }
    }
}

#Preview {
    CUV_IntendedUse()
}
