//
//  MountainModelSchemaV3.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/5/25.
//

import SwiftData
import SwiftUI

enum MountainModelSchemaV3: VersionedSchema {
    static var versionIdentifier: Schema.Version = Schema.Version(3, 0, 0)

    static var models: [any PersistentModel.Type] {
        [MountainModel.self, MountainCountryModel.self]
    }

    @Model
    class MountainModel {
        var name: String
        @Relationship(inverse: \MountainCountryModel.mountains)
        var country: MountainCountryModel?
        var elevation: Int = 0
        var image: Data? = nil

        init(
            name: String,
            country: MountainCountryModel? = nil,
            elevation: Int = 0,
            image: Data? = nil
        ) {
            self.name = name
            self.country = country
            self.elevation = elevation
            self.image = image
        }
    }

    @Model
    class MountainCountryModel {
        @Attribute(.unique)
        var name: String
        var mountains: [MountainModel] = []

        init(name: String, mountains: [MountainModel] = []) {
            self.name = name
            self.mountains = mountains
        }
    }
}
