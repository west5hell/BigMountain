//
//  BigMountainApp.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/3/25.
//

import SwiftUI
import SwiftData

@main
struct BigMountainApp: App {
    let container: ModelContainer
    
    init() {
        #if DEBUG
        self.container = PlanetModel.preview
        #else
        self.container = try! ModelContainer(for: PlanetModel.self)
        #endif
    }
    var body: some Scene {
        WindowGroup {
            OO_InjectionExample(modelContext: container.mainContext)
                .modelContainer(container)
//            Theoretically, you shouldn’t even need the
//            modelContainer modifier if you are not using @Query or
//            @Environment(\.modelContext).
        }
    }
}
