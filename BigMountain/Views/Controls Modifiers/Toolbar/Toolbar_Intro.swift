//
//  Toolbar_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/3/25.
//

import SwiftUI

struct Toolbar_Intro: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
            }
            .font(.title)
            .navigationTitle("Toolbar")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.horizontal.3")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "camera.filters")
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        
                    } label: {
                        Image(systemName: "aspectratio")
                        Text("Aspect Ratio")
                    }
                }
            }
            .tint(.green)
        }
    }
}

#Preview {
    Toolbar_Intro()
}
