//
//  MoutainForPreviews.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/5/25.
//

import SwiftData
import SwiftUI

extension MountainModel {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: MountainModel.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )

        addVersion1Data(modelContext: container.mainContext)

        return container
    }

    static func addVersion1Data(modelContext: ModelContext) {
        modelContext.insert(
            MountainModel(
                name: "Mount Rainier",
                country: "United States",
                image: UIImage(resource: .darkSouls3).pngData()!
            )
        )
        modelContext.insert(
            MountainModel(
                name: "Denali",
                country: "United States",
                image: UIImage(resource: .witcher3).pngData()!
            )
        )
        modelContext.insert(
            MountainModel(
                name: "Mount Fuji",
                country: "Japan",
                image: UIImage(resource: .noManSSky).pngData()!
            )
        )
        modelContext.insert(
            MountainModel(
                name: "Mount Kita",
                country: "Japan",
                image: UIImage(resource: .lordsOfTheFallen).pngData()!
            )
        )
        modelContext.insert(
            MountainModel(
                name: "Mount Blanc",
                country: "Switzerland",
                image: UIImage(resource: .skyrim).pngData()!
            )
        )
        modelContext.insert(
            MountainModel(
                name: "Matterhorn",
                country: "Switzerland",
                image: UIImage(resource: .arches).pngData()!
            )
        )
    }
}
