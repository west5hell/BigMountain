//
//  List_ListStyle_Automatic.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct List_ListStyle_Automatic: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "List",
                subtitle: "List Style: Automatic",
                desc: "You can apply different styles to lists. Here is what a list looks like using the default style 'automatic'.",
                back: .green
            )
            List {
                Text("What would you like to learn?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .listRowSeparatorTint(.red)
                Label("Learn Geography", systemImage: "signpost.right.fill")
                    .badge(1)
                    .badgeProminence(.increased)
                Label("Learn Music", systemImage: "doc.richtext")
                Label("Learn Photography", systemImage: "camera.aperture")
                Label("Learn Art", systemImage: "paintpalette.fill")
                    .font(Font.system(.title3).weight(.bold))
                Label("Learn Physics", systemImage: "atom")
                Label("Learn 3D", systemImage: "cube.transparent")
                Label("Learn Hair Styling", systemImage: "comb.fill")
                    .swipeActions(allowsFullSwipe: false) {
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.uturn.backward.square")
                        }
                        .tint(.green)

                    }
            }
            .listStyle(.sidebar)
            .tint(.green)
            .safeAreaInset(edge: .bottom) {
                VStack {
                    Divider()
                    Text("Bottom")
                        .foregroundStyle(.secondary)
                }
                .background(.bar)
            }
            .refreshable {
                
            }
        }
        .font(.title)
    }
}

#Preview {
    List_ListStyle_Automatic()
}
