//
//  HybridApproach.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/5/25.
//

import SwiftUI
import SwiftData

struct HybridApproach: View {
    @Query(sort: \PlanetModel.position) private var planets: [PlanetModel]
    @State private var oo = HybridApproachOO()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(planets) { planet in
                    PlanetRowView(planet: planet)
                }
                .onDelete { indexSet in
                    indexSet.forEach {
                        oo.delete(planet: planets[$0])
                    }
                }
            }
            .navigationTitle("Hybrid")
            .toolbar {
                Button("", systemImage: "plus") {
                    oo.insertPlanet(name: "Planet X", position: planets.count + 1)
                }
            }
        }
    }
}

#Preview {
    HybridApproach()
        .modelContainer(PlanetModel.preview)
}
