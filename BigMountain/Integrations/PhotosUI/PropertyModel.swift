//
//  PropertyModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/5/25.
//

import SwiftData
import SwiftUI

@Model
class PropertyModel {
    var name: String
    var address: String
    var image: Data?

    init(name: String, address: String, image: Data? = nil) {
        self.name = name
        self.address = address
        self.image = image
    }
}

extension PropertyModel {
    var viewImage: UIImage {
        if let image {
            return UIImage(data: image) ?? UIImage(resource: .arches)
        } else {
            return UIImage(resource: .darkSouls3)
        }
    }
}
