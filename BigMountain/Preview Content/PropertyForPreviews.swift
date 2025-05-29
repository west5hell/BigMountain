//
//  PropertyForPreviews.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/5/25.
//

import SwiftData
import SwiftUI

extension PropertyModel {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: PropertyModel.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        container.mainContext.insert(
            PropertyModel(
                name: "Beautiful Town Home",
                address: "123 Main St",
                image: UIImage(resource: .arches).pngData()
            )
        )
        container.mainContext.insert(
            PropertyModel(
                name: "Cozy Cottage",
                address: "456 Oak Rd",
                image: UIImage(resource: .arches).pngData()
            )
        )
        container.mainContext.insert(
            PropertyModel(
                name: "Modern Condo",
                address: "789 Pine Ave",
                image: UIImage(resource: .arches).pngData()
            )
        )
        container.mainContext.insert(
            PropertyModel(
                name: "Charming Villa",
                address: "321 Elm St",
                image: UIImage(resource: .arches).pngData()
            )
        )
        container.mainContext.insert(
            PropertyModel(
                name: "Luxury Penthouse",
                address: "654 Maple Dr",
                image: UIImage(resource: .arches).pngData()
            )
        )
        container.mainContext.insert(
            PropertyModel(
                name: "Rustic Cabin",
                address: "987 Cedar Ln",
                image: UIImage(resource: .arches).pngData()
            )
        )
        container.mainContext.insert(
            PropertyModel(
                name: "Spacious Farmhouse",
                address: "147 Spruce Pkwy",
                image: UIImage(resource: .arches).pngData()
            )
        )
        container.mainContext.insert(
            PropertyModel(
                name: "Classic Colonial",
                address: "258 Birch Blvd",
                image: UIImage(resource: .arches).pngData()
            )
        )
        container.mainContext.insert(
            PropertyModel(
                name: "Sleek Studio",
                address: "369 Willow Way",
                image: UIImage(resource: .arches).pngData()
            )
        )
        container.mainContext.insert(
            PropertyModel(name: "Elegant Estate", address: "159 Poplar Pl")
        )
        return container
    }
}
