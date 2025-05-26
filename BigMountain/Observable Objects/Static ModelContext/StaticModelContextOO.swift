//
//  StaticModelContextOO.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/5/25.
//

import SwiftUI
import SwiftData

@MainActor
@Observable
class StaticModelContextOO {
    var planets: [PlanetModel] = []
    
//    @MainActor
    func fetch() {
        planets = try! PlanetModel.modelContext.fetch(
            FetchDescriptor<PlanetModel>(
                sortBy: [SortDescriptor(
                    \.position
                )]
            )
        )
    }
    
//    @MainActor
    func delete(indexSet: IndexSet) {
        for index in indexSet {
            PlanetModel.modelContext.delete(planets[index])
        }
        fetch()
    }
    
//    @MainActor
    func insertPlanet(name: String) {
        let planet = PlanetModel(
            name: name,
            position: planets.count + 1,
            orbitalPeriod: 0
        )
        PlanetModel.modelContext.insert(planet)
        fetch()
    }
}
