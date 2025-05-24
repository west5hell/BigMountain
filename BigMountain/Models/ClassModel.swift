//
//  ClassModel.swift
//  Famine
//
//  Created by Pongt Chia on 23/5/25.
//

import SwiftUI
import SwiftData

@Model
class ClassModel {
    var subject: String
    var image: Data?
    
    @Relationship(
        inverse: \StudentModel.classes
    )
    var students: [StudentModel] = []
    
    init(
        subject: String,
        image: Data?,
        students: [StudentModel] = []
    ) {
        self.subject = subject
        self.image = image
        self.students = students
    }
}

extension ClassModel {
    var viewImage: Image {
        if let image, let uiImage = UIImage(data: image) {
            return Image(uiImage: uiImage)
        } else {
            return Image(uiImage: UIImage(systemName: "photo")!)
        }
    }
    
    var viewSortedStudents: [StudentModel] {
        students.sorted {
            $0.name < $1.name
        }
    }
}
