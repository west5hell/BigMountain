//
//  Sheet_Detents.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Sheet_Detents: View {
    @State private var showSheet = false
    var body: some View {
        Button("Show Half Sheet") {
            showSheet.toggle()
        }
        .font(.title)
        .sheet(isPresented: $showSheet) {
            VStack(spacing: 16) {
                Text("Using a medium and large detent to present this sheet.")
                Image(systemName: "arrow.up")
                Text("Slide up to go from medium to large detent.")
            }
            .padding()
//            .presentationDetents([.medium, .large])
            .presentationDetents([.fraction(0.75), .height(200)])
        }
    }
}

#Preview {
    Sheet_Detents()
}
