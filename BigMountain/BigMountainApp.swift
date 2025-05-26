//
//  BigMountainApp.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/3/25.
//

import SwiftUI
import SwiftData

@main
struct BigMountainApp: App {
    
    var body: some Scene {
        WindowGroup {
            PerformanceView()
                .modelContainer(for: TreeModel.self)
        }
    }
}
