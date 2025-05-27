//
//  MountainModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/5/25.
//

import SwiftData
import SwiftUI

@Model
class MountainModel {
    var name: String
    var country: String
    var image: Data? = nil

    init(name: String, country: String, image: Data? = nil) {
        self.name = name
        self.country = country
        self.image = image
    }
}

extension MountainModel {
    var viewImage: UIImage {
        if let image, let image = UIImage(data: image) {
            return image
        } else {
            return UIImage(resource: .earth)
        }
    }
}
