//
//  NavLink_IsDetailLink.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct NavLink_IsDetailLink: View {
    var body: some View {
        NavigationSplitView {
            VStack(spacing: 20) {
                NavigationLink("Navigate There ->") {
                    NavigationDestinationView()
                }
                
                NavigationLink("Navigate Here") {
                    NavigationDestinationView()
                }
                .isDetailLink(false)
            }
        } detail: {
            Text("Detail")
        }
        .font(.title)
    }
}

#Preview {
    NavLink_IsDetailLink()
}

struct NavigationDestinationView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Navigation Destination")
        }
        .navigationTitle("Destination")
        .font(.title)
    }
}
