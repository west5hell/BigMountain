//
//  OO_FetchOO.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/5/25.
//

import SwiftUI
import SwiftData

@Observable
class OO_FetchOO {
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
}
