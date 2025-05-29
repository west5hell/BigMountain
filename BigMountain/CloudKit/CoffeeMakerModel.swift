//
//  CoffeeMakerModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/5/25.
//

import SwiftData
import SwiftUI

@Model
class CoffeeMakerModel {
    var make: String = "None"
    var image: Data = UIImage(resource: .arches).pngData()!
    
    init(name: String, image: Data) {
        self.make = name
        self.image = image
    }
}

extension CoffeeMakerModel {
    var viewImage: UIImage {
        UIImage(data: image) ?? UIImage(resource: .arches)
    }
}
