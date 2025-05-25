//
//  PlanetForPreviews.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/5/25.
//

import SwiftUI
import SwiftData

extension PlanetModel {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: PlanetModel.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        
        container.mainContext.insert(
            PlanetModel(
                name: "Mercury",
                position: 1,
                orbitalPeriod: 88,
                image: UIImage(
                    resource: .earth
                ).pngData()!
            )
        )
        container.mainContext.insert(
            PlanetModel(
                name: "Venus",
                position: 2,
                orbitalPeriod: 225,
                image: UIImage(
                    resource: .earth
                ).pngData()!
            )
        )
        container.mainContext.insert(
            PlanetModel(
                name: "Earth",
                position: 3,
                orbitalPeriod: 356,
                image: UIImage(
                    resource: .earth
                ).pngData()!
            )
        )
        container.mainContext.insert(
            PlanetModel(
                name: "Mars",
                position: 4,
                orbitalPeriod: 687,
                image: UIImage(
                    resource: .earth
                ).pngData()!
            )
        )
        container.mainContext.insert(
            PlanetModel(
                name: "Jupiter",
                position: 5,
                orbitalPeriod: 4272,
                image: UIImage(
                    resource: .earth
                ).pngData()!
            )
        )
        container.mainContext.insert(
            PlanetModel(
                name: "Saturn",
                position: 6,
                orbitalPeriod: 10324,
                image: UIImage(
                    resource: .earth
                ).pngData()!
            )
        )
        container.mainContext.insert(
            PlanetModel(
                name: "Uranus",
                position: 7,
                orbitalPeriod: 29904,
                image: UIImage(
                    resource: .earth
                ).pngData()!
            )
        )
        container.mainContext.insert(
            PlanetModel(
                name: "Neptune",
                position: 8,
                orbitalPeriod: 58740,
                image: UIImage(
                    resource: .earth
                ).pngData()!
            )
        )
        
        return container
    }
}
