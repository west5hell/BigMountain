//
//  CUV_Concept.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/3/25.
//

import SwiftUI

struct CUV_Concept: View {
    var body: some View {
        ContentUnavailableView(
            "Title",
            systemImage: "paintbrush",
            description: Text("Description (Optional")
        )
        .background(Color.pink)
    }
}

#Preview {
    CUV_Concept()
}
