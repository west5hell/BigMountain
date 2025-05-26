//
//  GameForPreviews.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/5/25.
//

import SwiftData
import SwiftUI

extension GameModel {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: GameModel.self,
            configurations: ModelConfiguration(
                isStoredInMemoryOnly: true
            )
        )

        container.mainContext.insert(
            GameModel(
                name: "Dark Souls 3",
                image: UIImage(resource: .darkSouls3).pngData()!
            )
        )
        container.mainContext.insert(
            GameModel(
                name: "Witcher 3",
                image: UIImage(resource: .witcher3).pngData()!
            )
        )
        container.mainContext.insert(
            GameModel(
                name: "Skyrim",
                image: UIImage(resource: .skyrim).pngData()!
            )
        )
        container.mainContext.insert(
            GameModel(
                name: "Lords of the Fallen",
                image: UIImage(resource: .lordsOfTheFallen).pngData()!
            )
        )
        container.mainContext.insert(
            GameModel(
                name: "No Man's Sky",
                image: UIImage(resource: .noManSSky).pngData()!
            )
        )

        return container
    }
}
