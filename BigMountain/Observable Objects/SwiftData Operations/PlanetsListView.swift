//
//  PlanetsListView.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/5/25.
//

import SwiftUI
import SwiftData

struct PlanetsListView: View {
    @State private var oo: PlanetOO
    @State private var insert = false
    @State private var selectedPlanet: PlanetModel?
    
    init(modelContext: ModelContext) {
        self.oo = PlanetOO(modelContext: modelContext)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(oo.planets) { planet in
                    PlanetRowView(planet: planet)
                        .onTapGesture {
                            selectedPlanet = planet
                        }
                }
                .onDelete(perform: oo.delete(indexSet:))
            }
            
            .navigationTitle("Planets")
            .refreshable {
                oo.fetch()
            }
            .toolbar {
                Button("", systemImage: "plus") {
                    insert = true
                }
            }
        }
        .task {
            oo.fetch()
        }
        .sheet(isPresented: $insert) {
            InsertPlanetView(oo: oo)
                .presentationDetents([.height(200)])
        }
        .sheet(item: $selectedPlanet) { planet in
            UpdatePlanetView(oo: oo, planet: planet)
                .presentationDetents([.height(200)])
        }
    }
}

#Preview {
    PlanetsListView(modelContext: PlanetModel.preview.mainContext)
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

struct InsertPlanetView: View {
    let oo: PlanetOO
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("New Planet")
                .font(.largeTitle.weight(.bold))
            
            TextField("enter planet name", text: $name)
                .textFieldStyle(.roundedBorder)
            
            Button("Save") {
                oo.insertPlanet(name: name)
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
    }
}

struct UpdatePlanetView: View {
    let oo: PlanetOO
    @Bindable var planet: PlanetModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Update Planet")
                .font(.largeTitle.weight(.bold))
            
            TextField("planet name", text: $planet.name)
                .textFieldStyle(.roundedBorder)
            
            Button("Save") {
                oo.save()
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
    }
}
