//
//  TreeModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/5/25.
//

import SwiftUI
import SwiftData

@Model
class TreeModel {
    var leafColor: String
    var name: String
    
    init(leafColor: String, name: String) {
        self.leafColor = leafColor
        self.name = name
    }
}

extension TreeModel {
    var viewLeafColor: Color {
        switch leafColor {
        case "Light Green":
            return Color.green.opacity(0.4)
        case "Dark Green":
            return Color(red: 0.0, green: 0.4, blue: 0.0)
        case "Red":
            return Color.red
        case "Yellow":
            return Color.yellow
        case "Pink":
            return Color.pink
        case "Dark Purple":
            return Color(red: 0.3, green: 0.0, blue: 0.3)
        case "Orange":
            return Color.orange
        case "Gold":
            return Color(red: 0.9, green: 0.7, blue: 0.25)
        default:
            return Color.green
        }
    }
}

extension TreeModel {
    static func randomLeafColor() -> String {
        return ["Green", "Light Green", "Dark Green", "Red", "Yellow", "Pink", "Dark Purple", "Orange"].randomElement()!
    }
    
    static func randomTreeName() -> String {
        let first = ["Quercus", "Fagus", "Pinus", "Acer", "Cornus", "Rosa"].randomElement()!
        let second = ["Lilium", "Malus", "Kelloggii", "Contorta", "Lobatta", "Magnifica", "Concolor", "Latifolia"].randomElement()!
        return "\(first) \(second)"
    }
}
