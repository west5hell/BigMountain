//
//  BookViewModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 30/5/25.
//

import SwiftUI

@Observable
class BookViewModel {
    var books = [BookModel]()

    func fetch() {
        books = [
            BookModel(name: "SwiftUI Views"),
            BookModel(name: "SwiftUI Animations"),
            BookModel(name: "Data in SwiftUI"),
            BookModel(name: "Combine Reference"),
        ]
    }

}
