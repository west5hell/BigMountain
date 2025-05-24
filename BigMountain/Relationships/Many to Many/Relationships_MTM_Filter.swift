//
//  Relationships_MTM_Filter.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/5/25.
//

import SwiftUI
import SwiftData

struct Relationships_MTM_Filter: View {
    @Query(
        filter: #Predicate<StudentModel> {
            $0.classes.count > 2
        }) private var students: [StudentModel]
    
    var body: some View {
        List {
            Section("Students In More Than 2 Classes") {
                ForEach(students) { student in
                    LabeledContent(student.name, value: "\(student.classes.count)")
                        .font(.title3)
                }
            }
        }
        .headerProminence(.increased)
    }
}

#Preview {
    Relationships_MTM_Filter()
        .modelContainer(ClassModel.preview)
}
