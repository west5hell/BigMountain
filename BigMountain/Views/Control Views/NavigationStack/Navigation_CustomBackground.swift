//
//  Navigation_CustomBackground.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct Navigation_CustomBackground: View {
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                    .background(
                        LinearGradient(
                            colors: [.green, .blue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .opacity(0.5)
                        .shadow(.drop(radius: 2, y: 2)),
                        ignoresSafeAreaEdges: .top
                    )
                
                Spacer()
                
                NavigationLink("Next Page") {
                    Text("New Page")
                }
            }
            .navigationTitle("Custom Background")
        }
    }
}

#Preview {
    Navigation_CustomBackground()
}
