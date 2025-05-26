//
//  ConcurrencyView.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/5/25.
//

import SwiftData
import SwiftUI

struct ConcurrencyView: View {
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
