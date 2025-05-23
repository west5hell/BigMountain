//
//  StudentModel.swift
//  Famine
//
//  Created by Pongt Chia on 23/5/25.
//

import SwiftUI
import SwiftData

@Model
class StudentModel {
    var name: String
    var image: Data?
    
    var classes: [ClassModel] = []
    
    init(
        name: String,
        image: Data?
    ) {
        self.name = name
        self.image = image
    }
}

extension StudentModel {
    var viewImage: Image {
        if let image, let uiImage = UIImage(data: image) {
            return Image(uiImage: uiImage)
        } else {
            return Image(uiImage: UIImage(systemName: "photo")!)
        }
    }
}
