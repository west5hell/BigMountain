//
//  ContestEntryModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/5/25.
//

import SwiftUI
import SwiftData

@Model
class ContestEntryModel {
    var productName: String
    
    var contestant: ContestantModel?
    
    init(productName: String, contestant: ContestantModel? = nil) {
        self.productName = productName
        self.contestant = contestant
    }
}
