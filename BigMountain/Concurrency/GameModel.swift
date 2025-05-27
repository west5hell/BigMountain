//
//  GameModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/5/25.
//

import SwiftData
import SwiftUI

@Model
class GameModel {
    var name: String
    @Attribute(.externalStorage)
    var image: Data

    init(
        name: String,
        image: Data = UIImage(resource: .arches).pngData()!
    ) {
        self.name = name
        self.image = image
    }
}

extension GameModel {
    var viewImage: UIImage {
        if let image = UIImage(data: image) {
            return image
        } else {
            return UIImage(resource: .arches)
        }
    }
}

extension GameModel {
    @ModelActor
    actor BackgroundActor {
        func insert(name: String) {
            modelContext.insert(GameModel(name: name))
            save()
        }

        func delete(ids: [PersistentIdentifier]) {
            for id in ids {
//                let descriptor = FetchDescriptor<GameModel>(
//                    predicate: #Predicate<GameModel> {
//                        $0.persistentModelID == id
//                    }
//                )
//                
//                do {
//                    let games = try modelContext.fetch(descriptor)
//                    if let game = games.first {
//                        game.image = Data()
//                        modelContext.delete(game)
//                    }
//                } catch {
//                    print("Fetch error: \(error.localizedDescription)")
//                }
                
                guard let game = self[id, as: GameModel.self] else {
                    return
                }
                modelContext.delete(game)
            }
            save()
        }

        func save() {
            do {
                try modelContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        
        func returnNewGameModelId() -> PersistentIdentifier {
            let newGame = GameModel(name: "No Man's Sky", image: UIImage(resource: .noManSSky).pngData()!)
            modelContext.insert(newGame)
            save()
            return newGame.id
        }
    }
}
