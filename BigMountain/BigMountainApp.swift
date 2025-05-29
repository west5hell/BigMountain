//
//  BigMountainApp.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/3/25.
//

import SwiftData
import SwiftUI

@main
struct BigMountainApp: App {

    var body: some Scene {
        WindowGroup {
            URLSessionView()
                .modelContainer(container)
        }
    }

    @MainActor
    var container: ModelContainer {
        do {
            let noCloudSyncSchema = Schema([ColorModel.self])
            let noCloudSyncConfig = ModelConfiguration(
                schema: noCloudSyncSchema,
                cloudKitDatabase: .none
            )

            let cloudSyncSchema = Schema([CoffeeMakerModel.self])
            let cloudSyncConfig = ModelConfiguration(
                schema: cloudSyncSchema,
                cloudKitDatabase: .automatic
            )

            let container = try ModelContainer(
                for: CoffeeMakerModel.self,
                ColorModel.self,
                configurations: noCloudSyncConfig,
                cloudSyncConfig
            )

            return container
        } catch {
            fatalError(
                "Could not create ModelContainer: \(error.localizedDescription)"
            )
        }
    }
}
