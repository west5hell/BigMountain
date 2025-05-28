//
//  MountainModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/5/25.
//

import SwiftData
import SwiftUI

//@Model
//class MountainModel {
//    var name: String
//    var country: String
//    var image: Data? = nil
//
//    init(name: String, country: String, image: Data? = nil) {
//        self.name = name
//        self.country = country
//        self.image = image
//    }
//}

enum MountainModelSchemaV1: VersionedSchema {

    static var versionIdentifier: Schema.Version = Schema.Version(1, 0, 0)

    static var models: [any PersistentModel.Type] {
        [MountainModel.self]
    }

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
}

typealias MountainModel = MountainModelSchemaV1.MountainModel

extension MountainModel {
    var viewImage: UIImage {
        if let image, let image = UIImage(data: image) {
            return image
        } else {
            return UIImage(resource: .earth)
        }
    }
}

enum MountainModelSchemaV2: VersionedSchema {
    static var versionIdentifier = Schema.Version(2, 0, 0)

    static var models: [any PersistentModel.Type] {
        [MountainModel.self]
    }

    @Model
    class MountainModel {
        var name: String
        var country: String
        var elevation: Int = 0
        var image: Data? = nil

        init(name: String, country: String, elevation: Int, image: Data? = nil)
        {
            self.name = name
            self.country = country
            self.elevation = elevation
            self.image = image
        }
    }
}
