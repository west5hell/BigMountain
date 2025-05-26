//
//  Performance_Measure.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/5/25.
//

import SwiftUI
import SwiftData

struct Performance_Measure: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var trees: [TreeModel]
    
    var body: some View {
        NavigationStack {
            List(trees) { tree in
                TreeRowView(tree: tree)
            }
            .navigationTitle("Measuring")
            .toolbar {
                Button {
                    for _ in 1...50_000 {
                        let tree = TreeModel(
                            leafColor: TreeModel.randomLeafColor(),
                            name: TreeModel.randomTreeName()
                        )
                        modelContext.insert(tree)
                    }
                    try? modelContext.save()
                } label: {
                    Image(systemName: "plus.circle.fill")
                }

                Button {
                    if trees.count < 1 { return }
                    
                    for x in 0...trees.count - 1 {
                        trees[x].name += " * "
                    }
                    try? modelContext.save()
                } label: {
                    Image(systemName: "pencil.circle.fill")
                        .foregroundStyle(.orange)
                }
                
                Button {
                    try? modelContext.delete(model: TreeModel.self)
                    try? modelContext.save()
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .foregroundStyle(.red)
                }

            }
        }
    }
}

#Preview {
    Performance_Measure()
        .modelContainer(
            for: TreeModel.self,
            inMemory: true,
            isAutosaveEnabled: false
        )
}

struct TreeRowView: View {
    let tree: TreeModel
    
    var body: some View {
        Label {
            Text(tree.name)
        } icon: {
            Image(systemName: "leaf.fill")
                .foregroundStyle(tree.viewLeafColor)
        }

    }
}
