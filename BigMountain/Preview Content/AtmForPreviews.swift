//
//  AtmForPreviews.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/5/25.
//

import SwiftData
import SwiftUI

extension AtmModel {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: AtmModel.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        // New York City locations
        container.mainContext.insert(
            AtmModel(
                location: "Chase Bank, 270 Park Ave",
                latitude: 40.755653,
                longitude: -73.975418
            )
        )
        container.mainContext.insert(
            AtmModel(
                location: "Bank of America, 100 W 33rd St",
                latitude: 40.748817,
                longitude: -73.988129
            )
        )
        container.mainContext.insert(
            AtmModel(
                location: "Citibank, 399 Park Ave",
                latitude: 40.759512,
                longitude: -73.972064
            )
        )
        container.mainContext.insert(
            AtmModel(
                location: "Wells Fargo, 150 E 42nd St",
                latitude: 40.751726,
                longitude: -73.975487
            )
        )
        container.mainContext.insert(
            AtmModel(
                location: "HSBC Bank, 452 Fifth Ave",
                latitude: 40.752920,
                longitude: -73.981930
            )
        )
        container.mainContext.insert(
            AtmModel(
                location: "Capital One Bank, 277 Park Ave",
                latitude: 40.755070,
                longitude: -73.974982
            )
        )
        container.mainContext.insert(
            AtmModel(
                location: "TD Bank, 2 Wall St",
                latitude: 40.707107,
                longitude: -74.010665
            )
        )
        container.mainContext.insert(
            AtmModel(
                location: "Santander Bank, 250 Park Ave",
                latitude: 40.755201,
                longitude: -73.975602
            )
        )
        container.mainContext.insert(
            AtmModel(
                location: "PNC Bank, 340 Madison Ave",
                latitude: 40.753690,
                longitude: -73.978790
            )
        )
        container.mainContext.insert(
            AtmModel(
                location: "M&T Bank, 350 Park Ave",
                latitude: 40.758046,
                longitude: -73.972311
            )
        )
        return container
    }
}
