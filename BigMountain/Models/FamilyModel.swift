//
//  FamilyModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/5/25.
//

import SwiftUI
import SwiftData

@Model
class FamilyModel {
    var name: String
    
    @Relationship(inverse: \FamilyModel.children)
    var parent: FamilyModel?
    
    var children: [FamilyModel]?
    
    init(name: String) {
        self.name = name
    }
}
