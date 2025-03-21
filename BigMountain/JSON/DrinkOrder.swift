//
//  DrinkOrder.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/3/25.
//

import SwiftUI

struct DrinkOrder: Codable {
    var drink = ""
    var milk: String?
    var sugarCubes: Int = 0
    
//    enum Keys: CodingKey {
//        case drink
//        case milk
//        case sugarCubes
//    }
    
    init() {}
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.drink = try container.decode(String.self, forKey: .drink)
        self.milk = try container.decodeIfPresent(String.self, forKey: .milk)
        
        self.sugarCubes = try container.decodeIfPresent(Int.self, forKey: .sugarCubes) ?? 0
    }
}

var jsonDrinkOrder1 = """
{
    "drink": "Latte", "milk": "Whole", "sugarCubes": 2
}
"""

var jsonDrinkOrder2 = """
{
        "drink": "Latte", "milk": null
}
"""

@Observable
class Json_DecodeIfPresentOO {
    var drinkOrder: DrinkOrder = DrinkOrder()
    var jsonError: Error?
    
    func fetch() {
        let jsonData = jsonDrinkOrder2.data(using: .utf8)!
        
        do {
            drinkOrder = try JSONDecoder().decode(DrinkOrder.self, from: jsonData)
        } catch {
            jsonError = error
        }
    }
    
    
}
