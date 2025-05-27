//
//  SendableView.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/5/25.
//

import SwiftData
import SwiftUI

struct SendableView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var games: [GameModel]

    var body: some View {
        NavigationStack {
            List {
                Section("Total: \(games.count)") {
                    ForEach(games) { game in
                        GameRowView(game: game)
                    }
                }
            }
            .headerProminence(.increased)
            .navigationTitle("Games")
            .toolbar {
                HStack {
                    Button("", systemImage: "plus") {
                        let container = modelContext.container
                        Task.detached {
                            let bgActor = GameModel.BackgroundActor(
                                modelContainer: container
                            )

                            for i in 1...600 {
                                await bgActor.insert(name: "Game \(i)")
                            }
                        }
                    }

                    Button("", systemImage: "trash") {
                        do {
                            try modelContext.delete(model: GameModel.self)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }

                    Button("", systemImage: "5.square") {
                        let container = modelContext.container

                        let ids = games.filter {
                            $0.name.contains("5")
                        }.map {
                            $0.id
                        }
                        
                        Task.detached(priority: .userInitiated) {
                            let bgActor = GameModel.BackgroundActor(modelContainer: container)
                            await bgActor.delete(ids: ids)
                        }
                    }
                    .tint(.red)
                }
            }
        }
    }
}

#Preview {
    SendableView()
}
