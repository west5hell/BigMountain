//
//  PreviewData.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/3/25.
//

import Foundation

struct PreviewData {
    static let booksData = [
        BooksDO(name: "SwiftUI Views Mastery"),
        BooksDO(name: "SwiftUI Animations Mastery"),
        BooksDO(name: "Combine Mastery in SwiftUI"),
        BooksDO(name: "SwiftData Mastery in SwiftUI"),
        BooksDO(name: "Core Data Mastery in SwiftUI"),
        BooksDO(name: "SwiftUI Essentials")
    ]
}

class MockBookListOO: BooksOO {
    override func fetch() {
        data = [
            BooksDO(name: "SwiftUI Views Mastery"),
            BooksDO(name: "SwiftUI Animations Mastery"),
            BooksDO(name: "Combine Mastery in SwiftUI"),
            BooksDO(name: "SwiftData Mastery in SwiftUI"),
            BooksDO(name: "Core Data Mastery in SwiftUI"),
            BooksDO(name: "SwiftUI Essentials")
        ]
    }
}
