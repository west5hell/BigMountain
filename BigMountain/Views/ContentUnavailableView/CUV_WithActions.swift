//
//  CUV_WithActions.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/3/25.
//

import SwiftUI

struct CUV_WithActions: View {
    var body: some View {
        ContentUnavailableView {
            Label("Are you sure?", systemImage: "questionmark.circle.fill")
        } description: {
            Text("This action will permanently delete the item.")
        } actions: {
            HStack(spacing: 24) {
                Button("Cancel", role: .cancel, action: {})
                Button("Delete", role: .destructive, action: {})
                    .buttonStyle(.borderedProminent)
            }
            .fixedSize()
            .controlSize(.regular)
        }
    }
}

#Preview {
    CUV_WithActions()
}
