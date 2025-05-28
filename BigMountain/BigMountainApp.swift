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
            let container = try ModelContainer(
                for: MountainModel.self,
                migrationPlan: MountainModelMigrationPlan.self
            )
            return container
        } catch {
            fatalError(
                "Could not create ModelContainer with migration plan: \(error.localizedDescription)"
            )
        }
    }
}
