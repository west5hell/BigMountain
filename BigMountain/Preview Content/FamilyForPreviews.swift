//
//  FamilyForPreviews.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/5/25.
//

import SwiftUI
import SwiftData

extension FamilyModel {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: FamilyModel.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        
        // Children
        let child1 = FamilyModel(name: "Billy Haverson")
        let child2 = FamilyModel(name: "Sarah Haverson")
        let child3 = FamilyModel(name: "Camille Devreau")
        let child4 = FamilyModel(name: "Gabriel Devreau")
        let child5 = FamilyModel(name: "Léo Devreau")
        
        // Grandchildren
        let grandchild1 = FamilyModel(name: "Billy Haverson Jr.")
        child1.children = [grandchild1]
        
        // Parents
        let parent1 = FamilyModel(name: "Fred Haverson")
        parent1.children = [child1, child2]
        
        let parent2 = FamilyModel(name: "Juliette Devreau")
        parent2.children = [child3, child4, child5]
        
        container.mainContext.insert(parent1)
        container.mainContext.insert(parent2)
        
        return container
    }
}
