//
//  StaticModelContext.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/5/25.
//

import SwiftUI
import SwiftData

struct StaticModelContext: View {
    @State private var oo = StaticModelContextOO()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(oo.planets, id: \.id) { planet in
                    PlanetRowView(planet: planet)
                }
                .onDelete { indexSet in
                    oo.delete(indexSet: indexSet)
                }
            }
            .navigationTitle("Planets")
            .toolbar {
                HStack {
                    Button("", systemImage: "plus") {
                        oo.insertPlanet(name: "Planet X")
                    }
                    Button("", systemImage: "arrow.down.to.line") {
                        Task {
                            oo.fetch()
                        }
                    }
                }
            }
        }
//        .task {
//            oo.fetch()
//        }
    }
}

#Preview {
    StaticModelContext()
}
