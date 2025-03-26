//
//  Sheet_Identifiable.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct DetailInfo: Identifiable {
    var id = UUID()
    let image: Image
}

struct Sheet_Identifiable: View {
    @State private var details: DetailInfo? = nil
    
    var body: some View {
        Button("Show Details") {
            details = DetailInfo(image: Image(systemName: "star.circle"))
        }
        .font(.largeTitle)
        .sheet(item: $details) { detailInfo in
            DetailSheet(details: detailInfo)
        }
    }
}

#Preview {
    Sheet_Identifiable()
}

struct DetailSheet: View {
    @Environment(\.dismiss) var dismiss
    let details: DetailInfo
    
    var body: some View {
        VStack(spacing: 20) {
            details.image
                .font(.largeTitle)
                .foregroundStyle(.red)
            
            HeaderView(
                "Sheet",
                subtitle: "Presenting with Identifiable",
                desc: "By changing the State property to a non nil value, you can trigger the Sheet to show.",
                back: .red,
                textColor: .white
            )
            
            Spacer()
            Button("Dismiss") {
                dismiss()
            }
            .tint(.red)
        }
        .font(.title)
        .padding(.top, 40)
        .interactiveDismissDisabled()   // Swipe Down Disabled
    }
}
