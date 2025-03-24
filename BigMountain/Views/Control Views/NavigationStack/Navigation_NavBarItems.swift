//
//  Navigation_NavBarItems.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct Navigation_NavBarItems: View {
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("Navigation Bar Buttons")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "bell.fill")
                            .padding(.horizontal)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Actions", action: {})
                }
            }
            .tint(.pink)
        }
    }
}

#Preview {
    Navigation_NavBarItems()
}
