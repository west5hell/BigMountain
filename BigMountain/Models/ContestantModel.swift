//
//  ContestantModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/5/25.
//

import SwiftUI
import SwiftData

@Model
class ContestantModel {
    var name: String
    
    @Relationship(
        minimumModelCount: 1,
        maximumModelCount: 2,
        inverse: \ContestEntryModel.contestant
    )
    var entries: [ContestEntryModel] = []
    
    init(name: String, entries: [ContestEntryModel] = []) {
        self.name = name
        self.entries = entries
    }
}
