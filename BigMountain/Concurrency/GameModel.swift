//
//  GameModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/5/25.
//

import SwiftData
import SwiftUI

@Model
class GameModel {
    var name: String
    @Attribute(.externalStorage)
    var image: Data

    init(
        name: String,
        image: Data = UIImage(resource: .earth).pngData()!
    ) {
        self.name = name
        self.image = image
    }
}

extension GameModel {
    var viewImage: UIImage {
        if let image = UIImage(data: image) {
            return image
        } else {
            return UIImage(resource: .arches)
        }
    }
}
