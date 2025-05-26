//
//  DependencyInjection.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/5/25.
//

import SwiftUI
import SwiftData

@Observable
class DependencyInjection {
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
}

//@Observable
//class NoDependencyInjection {
//    private let modelContext: ModelContext
//    
//    init() async {
//        let container = try! ModelContainer(
//            for: PlanetModel.self,
//            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
//        )
//        self.modelContext = await container.mainContext
//    }
//}
