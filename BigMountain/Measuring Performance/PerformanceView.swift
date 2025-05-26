//
//  PerformanceView.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/5/25.
//

import SwiftUI
import SwiftData

extension Duration {
    var seconds: String {
        self.formatted(
            .units(
                allowed: [.seconds],
                width: .abbreviated,
                fractionalPart: .init(
                    lengthLimits: 1...3
                )
            )
        )
    }
}

struct PerformanceView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var trees: [TreeModel]
    @State private var measurement: String = "None: 0"
    
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
                    try? modelContext.saveAndMeasure()
                } label: {
                    Image(systemName: "plus.circle.fill")
                }

                Button {
                    if trees.count < 1 { return }
                    
                    for x in 0...trees.count - 1 {
                        trees[x].name += " * "
                    }
//                    try? modelContext.save()
                    try? modelContext.saveAndMeasure()
                } label: {
                    Image(systemName: "pencil.circle.fill")
                        .foregroundStyle(.orange)
                }
                
                Button {
                    try? modelContext.delete(model: TreeModel.self)
//                    try? modelContext.save()
                    try? modelContext.saveAndMeasure()
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .foregroundStyle(.red)
                }

            }
        }
    }
}

#Preview {
    PerformanceView()
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

extension ModelContext {
    func saveAndMeasure() throws {
#if DEBUG
        var action = ""
        
        if changedModelsArray.count > 0 {
            action = "Update for \(changedModelsArray.count) rows |"
        }
        
        if insertedModelsArray.count > 0 {
            action += "Insert for \(insertedModelsArray.count) rows |"
        }
        
        if deletedModelsArray.count > 0 {
            action += "Delete for \(deletedModelsArray.count) rows |"
        }
        
        let duration = try ContinuousClock().measure {
            try save()
        }
        print("---------------------------------------------------------------")
        print("SwiftData: Total execution time: \(duration.seconds) | \(action)")
        print("---------------------------------------------------------------")
#else
        try save()
#endif
    }
}
