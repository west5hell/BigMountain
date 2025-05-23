//
//  ClassMockDataForPreviews.swift
//  Famine
//
//  Created by Pongt Chia on 23/5/25.
//

import SwiftUI
import SwiftData

extension ClassModel {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: ClassModel.self,
            configurations: ModelConfiguration(
                isStoredInMemoryOnly: true
            )
        )
        
        // Students
        let susan = StudentModel(
            name: "Susan",
            image: UIImage(
                resource: .arches
            ).pngData()!
        )
        let bob = StudentModel(
            name: "Bob",
            image: UIImage(
                resource: .arches
            ).pngData()!
        )
        let claudia = StudentModel(
            name: "Claudia",
            image: UIImage(
                resource: .arches
            ).pngData()!
        )
        let phillip = StudentModel(
            name: "Phillip",
            image: UIImage(
                resource: .arches
            ).pngData()!
        )
        let josie = StudentModel(
            name: "Josie",
            image: UIImage(
                resource: .arches
            ).pngData()!
        )
        let leo = StudentModel(
            name: "Leo",
            image: UIImage(
                resource: .arches
            ).pngData()!
        )
        let julie = StudentModel(
            name: "Julie",
            image: UIImage(
                resource: .arches
            ).pngData()!
        )
        
        // Classes
        let math = ClassModel(
            subject: "Math",
            image: UIImage(
                resource: .arches
            ).pngData()!
        )
        let biology = ClassModel(
            subject: "Biology",
            image: UIImage(
                resource: .arches
            ).pngData()!
        )
        let chemistry = ClassModel(
            subject: "Chemistry",
            image: UIImage(
                resource: .arches
            ).pngData()!
        )
        let art = ClassModel(
            subject: "Art",
            image: UIImage(
                resource: .arches
            ).pngData()!
        )
        
        container.mainContext
            .insert(
                math
            )
        math.students = [
            phillip,
            josie,
            leo,
            julie,
            susan
        ]
        
        container.mainContext
            .insert(
                biology
            )
        biology.students = [
            leo,
            phillip,
            josie,
            julie
        ]
        
        container.mainContext
            .insert(
                chemistry
            )
        chemistry.students = [
            julie,
            bob,
            phillip,
            claudia
        ]
        
        container.mainContext
            .insert(
                art
            )
        art.students = [
            susan,
            phillip,
            claudia,
            josie
        ]
        
        return container
    }
}
