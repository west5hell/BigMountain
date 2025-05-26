//
//  HybridApproachOO.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/5/25.
//

import SwiftUI
import SwiftData

@MainActor
@Observable
class HybridApproachOO {
    func delete(planet: PlanetModel) {
        PlanetModel.modelContainer.mainContext.delete(planet)
    }
    
    func insertPlanet(name: String, position: Int) {
        let planet = PlanetModel(
            name: name,
            position: position,
            orbitalPeriod: 0
        )
        PlanetModel.modelContainer.mainContext.insert(planet)
    }
}
