//
//  CloudKitView.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/5/25.
//

import SwiftData
import SwiftUI

struct CloudKitView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var coffeeMakers: [CoffeeMakerModel]

    var body: some View {
        NavigationStack {
            List {
                ForEach(coffeeMakers) { coffeeMaker in
                    HStack {
                        Image(uiImage: coffeeMaker.viewImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 60)
                            .clipShape(.rect(cornerRadius: 8))
                        Text(coffeeMaker.make)
                            .font(.title.weight(.bold).width(.condensed))
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        modelContext.delete(coffeeMakers[index])
                    }
                }
            }
            .navigationTitle("Coffee Makers")
            .toolbar {
                Button("", systemImage: "plus", action: addRandomCoffeeMachine)
            }
        }
    }

    func addRandomCoffeeMachine() {
        let model = [
            "Coffee Extra", "Star Coffee", "Lava Flow", "Java Espresso",
            "Mr. Joe", "Samuri Coffee", "Kur8",
        ]
        .randomElement()!
        modelContext.insert(
            CoffeeMakerModel(
                name: model,
                image: UIImage(resource: .arches).pngData()!
            )
        )
    }
}

#Preview {
    CloudKitView()
}
