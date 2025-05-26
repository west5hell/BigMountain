//
//  PlanetOO.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/5/25.
//

import SwiftUI
import SwiftData

@Observable
class PlanetOO {
    let modelContext: ModelContext
    var planets: [PlanetModel] = []
    var errorMessage: String?
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func fetch() {
        let sort = [SortDescriptor(\PlanetModel.position)]
        let fetchDescriptor = FetchDescriptor<PlanetModel>(sortBy: sort)
        
        do {
            planets = try modelContext.fetch(fetchDescriptor)
        } catch {
            errorMessage = "Failed getting planets: \(error.localizedDescription)"
        }
    }
    
    func delete(indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(planets[index])
        }
        fetch()
    }
    
    func insertPlanet(name: String) {
        let planet = PlanetModel(
            name: name,
            position: planets.count + 1,
            orbitalPeriod: 0
        )
        modelContext.insert(planet)
        
        // Update planets property either way:
        // 1. append
        planets.append(planet)
        // 2. fetch
//        fetch()
    }
    
    func save() {
        do {
            try modelContext.save()
        } catch {
            errorMessage = "Failed saving: \(error.localizedDescription)"
        }
    }
}
