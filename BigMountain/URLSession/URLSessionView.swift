//
//  URLSessionView.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/5/25.
//

import SwiftData
import SwiftUI

struct URLSessionView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var friends: [FriendModel]
    @State private var showProgress = false

    var body: some View {
        NavigationStack {
            List {
                Section("Total: \(friends.count)") {
                    ForEach(friends) { friend in
                        Text(friend.viewName, format: .name(style: .medium))
                            .font(.title)
                    }
                }
            }
            .overlay(content: {
                if showProgress {
                    ProgressView("Importing")
                        .padding()
                        .background(
                            .regularMaterial,
                            in: .rect(cornerRadius: 8)
                        )
                }
            })
            .headerProminence(.increased)
            .navigationTitle("People")
            .toolbar {
                Button("", systemImage: "person.crop.circle.fill.badge.plus") {
                    showProgress = true
                    let container = modelContext.container

                    let result = Task.detached {
                        let bgActor = FriendModel.BackgroundActor(
                            modelContainer: container
                        )

                        do {
                            try await bgActor.importFriends()
                            return false
                        } catch {
                            print("Error: \(error.localizedDescription)")
                            return false
                        }
                    }
                    
                    Task {
                        showProgress = await result.value
                    }
                }
            }
        }
    }
}

#Preview {
    URLSessionView()
}
