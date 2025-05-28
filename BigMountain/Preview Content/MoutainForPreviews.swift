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

        addVersion3Data(modelContext: container.mainContext)

        return container
    }

    static func addVersion3Data(modelContext: ModelContext) {
        let ranier = MountainModel(
            name: "Mount Rainier",
            elevation: 14_409,
            image: UIImage(resource: .darkSouls3).pngData()!
        )
        let denali = MountainModel(
            name: "Denali",
            elevation: 20_308,
            image: UIImage(resource: .witcher3).pngData()!
        )
        let fuji = MountainModel(
            name: "Mount Fuji",
            elevation: 12_388,
            image: UIImage(resource: .noManSSky).pngData()!
        )
        let kita = MountainModel(
            name: "Mount Kita",
            elevation: 10_476,
            image: UIImage(resource: .skyrim).pngData()!
        )
        let blanc = MountainModel(
            name: "Mount Blanc",
            elevation: 15_777,
            image: UIImage(resource: .lordsOfTheFallen).pngData()!
        )
        let matterhorn = MountainModel(
            name: "Matterhorn",
            elevation: 14_692,
            image: UIImage(resource: .arches).pngData()!
        )

        // Countries
        let usa = MountainCountryModel(name: "United States")
        let japan = MountainCountryModel(name: "Japan")
        let switzerland = MountainCountryModel(name: "Switzerland")

        modelContext.insert(usa)
        usa.mountains = [ranier, denali]
        modelContext.insert(japan)
        japan.mountains = [fuji, kita]
        modelContext.insert(switzerland)
        switzerland.mountains = [blanc, matterhorn]
    }
}
