//
//  Navigation_BackButtonHidden.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct Navigation_BackButtonHidden: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Go To Detail", destination: {
                BackButtonHiddenDetail()
            })
                .font(.title)
                .navigationTitle("Navigation Views")
        }
    }
}

#Preview {
    Navigation_BackButtonHidden()
}

struct BackButtonHiddenDetail: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Go Back") {
            dismiss()
        }
        .font(.title)
        .navigationTitle("Detail View")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Label("Back", systemImage: "arrow.left.circle")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
