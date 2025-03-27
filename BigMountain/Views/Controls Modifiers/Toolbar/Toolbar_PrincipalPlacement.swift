//
//  Toolbar_PrincipalPlacement.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/3/25.
//

import SwiftUI

struct Toolbar_PrincipalPlacement: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Detail") {
                    Text("nice")
                }
            }
            .font(.title)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(spacing: 0) {
                        Text("My List")
                            .bold()
                        Button(action: {}) {
                            Text("Scroll to Top")
                            Image(systemName: "chevron.up")
                        }
                    }
                }
            }
            .tint(.green)
        }
    }
}

#Preview {
    Toolbar_PrincipalPlacement()
}
