//
//  Relationships_MTM_SortOption.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/5/25.
//

import SwiftUI
import SwiftData

struct Relationships_MTM_SortOption: View {
    @Query(sort: \ClassModel.subject) private var classes: [ClassModel]
    
    var body: some View {
        List {
            Section("Classes with Students Sorted") {
                ForEach(classes) { classModel in
                    VStack(alignment: .leading) {
                        Text(classModel.subject)
                            .font(.title2.weight(.bold))
                        ForEach(classModel.viewSortedStudents) { student in
                            Label(student.name, systemImage: "person.circle")
                        }
                    }
                }
            }
        }
        .tint(.secondary)
        .headerProminence(.increased)
    }
}

#Preview {
    Relationships_MTM_SortOption()
        .modelContainer(ClassModel.preview)
}
