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
}
