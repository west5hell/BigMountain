//
//  ConcurrencyView.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/5/25.
//

import SwiftData
import SwiftUI

@ModelActor
actor GameDataManager {
    func insertGames(count: Int) {
        let newGames = (1...count).map {
            GameModel(name: "Game \($0)")
        }
        
        for game in newGames {
            modelContext.insert(game)
        }
        
        try? modelContext.save()
    }
}

struct ConcurrencyView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \GameModel.name) private var games: [GameModel]
    
    func insert(name: String) async {
//        modelContext.insert(GameModel(name: name))
        let backgroundContext = ModelContext(modelContext.container)
        
        await Task.detached {
            let newGames = (1...600).map {
                GameModel(name: "Game \($0)")
            }
            
            for game in newGames {
                backgroundContext.insert(game)
            }
            
            try? backgroundContext.save()
        }.value
    }

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
                        Task {
//                            for i in 1...600 {
//                                await insert(name: "Game \(i)")
//                            }
                            await insert(name: "")
//                            let manager = GameDataManager(modelContainer: modelContext.container)
//                            await manager.insertGames(count: 600)
                        }
                    }
                    
                    Button("", systemImage: "trash") {
                        do {
                            try modelContext.delete(model: GameModel.self)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
    
}

#Preview {
    ConcurrencyView()
        .modelContainer(GameModel.preview)
}

struct GameRowView: View {
    let game: GameModel

    var body: some View {
        Text(game.name)
            .font(.title.weight(.black).italic())
            .foregroundStyle(.white)
            .shadow(radius: 10)
            .padding(24)
            .padding(.bottom, 240)
            .listRowBackground(
                Image(uiImage: game.viewImage)
                    .resizable()
                    .scaledToFill()
            )
    }
}
