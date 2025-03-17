//
//  DogsOO.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/3/25.
//

import SwiftUI

@Observable
class DogsOO {
    var data: [DogsDO] = []
    
    func fetch() {
#if DEBUG
        data = [
            DogsDO(name: "Saint Bernard"),
            DogsDO(name: "English Mastiff"),
            DogsDO(name: "Newfoundland")
        ]
#else
        data = [
            DogsDO(name: "Dachshund"),
            DogsDO(name: "Boston Terrier"),
            DogsDO(name: "Pug")
        ]
#endif
    }
}
