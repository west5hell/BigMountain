//
//  OO_Fetch.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/5/25.
//

import SwiftUI
import SwiftData

struct OO_Fetch: View {
    @State private var oo: OO_FetchOO
    
    init(modelContext: ModelContext) {
        self.oo = OO_FetchOO(modelContext: modelContext)
    }
    
    var body: some View {
        NavigationStack {
            List(oo.planets) { planet in
                PlanetRowView(planet: planet)
            }
            .navigationTitle("Planets")
        }
        .task {
            oo.fetch()
        }
    }
}

#Preview {
    OO_Fetch(modelContext: PlanetModel.preview.mainContext)
}

struct PlanetRowView: View {
    let planet: PlanetModel
    
    var body: some View {
        HStack(alignment: .top) {
            Image(uiImage: planet.viewImage)
                .resizable()
                .scaledToFit()
                .frame(height: 60)
                .clipShape(.rect(cornerRadius: 8))
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(planet.name)
                    Spacer()
                    Image(systemName: planet.viewPosition)
                }
                .font(.title)
                Text(planet.viewOrbitalPeriod)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
