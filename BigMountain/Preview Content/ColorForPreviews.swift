//
//  ColorForPreviews.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/5/25.
//

import SwiftData
import SwiftUI

extension ColorModel {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: ColorModel.self,
            configurations: ModelConfiguration(
                isStoredInMemoryOnly: true,
                cloudKitDatabase: .none
            )
        )

        container.mainContext.insert(ColorModel(name: "Bronze"))
        container.mainContext.insert(ColorModel(name: "Copper"))
        container.mainContext.insert(ColorModel(name: "Silver"))
        container.mainContext.insert(ColorModel(name: "Black"))
        container.mainContext.insert(ColorModel(name: "White"))

        return container
    }
}
