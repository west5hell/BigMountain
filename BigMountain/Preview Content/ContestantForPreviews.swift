//
//  ContestantForPreviews.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/5/25.
//

import SwiftUI
import SwiftData

extension ContestantModel {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: ContestantModel.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        container.mainContext.autosaveEnabled = false
        
        let p1 = ContestEntryModel(productName: "Quilt")
        let p2 = ContestEntryModel(productName: "Sculpture")
        let miller = ContestantModel(name: "Mrs. Miller", entries: [p1, p2])
        container.mainContext.insert(miller)
        
        let p3 = ContestEntryModel(productName: "Painting")
        let p4 = ContestEntryModel(productName: "Glasswork")
        let smith = ContestantModel(name: "Mr. Smith", entries: [p3, p4])
        container.mainContext.insert(smith)
        
        try? container.mainContext.save()
        
        return container
    }
}
