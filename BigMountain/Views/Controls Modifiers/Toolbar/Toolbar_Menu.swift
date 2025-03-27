//
//  Toolbar_Menu.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/3/25.
//

import SwiftUI

struct Toolbar_Menu: View {
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("Toolbar")
            .font(.title)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Button(action: {}) {
                            Text("Add color")
                            Image(systemName: "eyedropper.full")
                        }
                        Button(action: {}) {
                            Image(systemName: "circle.lefthalf.fill")
                            Text("Change contrast")
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.circle")
                    }

                }
            }
            .tint(.green)
        }
    }
}

#Preview {
    Toolbar_Menu()
}
