//
//  VersioningView.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/5/25.
//

import SwiftData
import SwiftUI

struct VersioningView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \MountainModel.country) private var mountains: [MountainModel]

    var body: some View {
        NavigationStack {
            List(mountains) { mountain in
                MountainRowView(mountain: mountain)
            }
            .navigationTitle("Versioning")
            .toolbar {
                Button("", systemImage: "plus") {
                    MountainModel.addVersion1Data(modelContext: modelContext)
                }
            }
        }
    }
}

#Preview {
    VersioningView()
        .modelContainer(MountainModel.preview)
}

struct MountainRowView: View {
    let mountain: MountainModel

    var body: some View {
        HStack {
            Image(uiImage: mountain.viewImage)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)

            VStack(alignment: .leading, spacing: 8) {
                Text(mountain.name)
                    .font(.title.weight(.semibold))
                    .fontWidth(.compressed)

                Text(mountain.country)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
