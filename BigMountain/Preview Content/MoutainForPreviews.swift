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
                elevation: 14_409,
                image: UIImage(resource: .darkSouls3).pngData()!
            )
        )
        modelContext.insert(
            MountainModel(
                name: "Denali",
                country: "United States",
                elevation: 20_308,
                image: UIImage(resource: .witcher3).pngData()!
            )
        )
        modelContext.insert(
            MountainModel(
                name: "Mount Fuji",
                country: "Japan",
                elevation: 12_388,
                image: UIImage(resource: .noManSSky).pngData()!
            )
        )
        modelContext.insert(
            MountainModel(
                name: "Mount Kita",
                country: "Japan",
                elevation: 10_476,
                image: UIImage(resource: .lordsOfTheFallen).pngData()!
            )
        )
        modelContext.insert(
            MountainModel(
                name: "Mount Blanc",
                country: "Switzerland",
                elevation: 15_777,
                image: UIImage(resource: .skyrim).pngData()!
            )
        )
        modelContext.insert(
            MountainModel(
                name: "Matterhorn",
                country: "Switzerland",
                elevation: 14_692,
                image: UIImage(resource: .arches).pngData()!
            )
        )
    }
}
