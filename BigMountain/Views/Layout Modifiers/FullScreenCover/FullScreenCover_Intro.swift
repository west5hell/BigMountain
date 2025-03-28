//
//  FullScreenCover_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/3/25.
//

import SwiftUI

struct FullScreenCover_Intro: View {
    @State private var showDetailView = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "FullScreenCover",
                subtitle: "Introduction",
                desc: "Use fullScreenCover modifier to present another view as a full screen (push-out view).",
                back: .blue,
                textColor: .white
            )
            
            Spacer()
            
            Button {
                showDetailView = true
            } label: {
                Text("Show Details")
            }
            
            Spacer()
        }
        .font(.title)
        .fullScreenCover(isPresented: $showDetailView) {
            FullScreenCoverDetailView()
        }
    }
}

#Preview {
    FullScreenCover_Intro()
}

struct FullScreenCoverDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "macwindow.on.rectangle")
            
            HeaderView(
                "FullScreenCover",
                subtitle: "Detail View",
                desc: "Use @Environment(\\.dismiss) to dismiss the view.",
                back: .blue,
                textColor: .white
            )
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Text("Dismiss")
            }
            
            Spacer()
        }
        .font(.title)
    }
}
