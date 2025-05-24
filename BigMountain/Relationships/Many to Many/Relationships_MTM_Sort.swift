//
//  Relationships_MTM_Sort.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/5/25.
//

import SwiftUI
import SwiftData

struct Relationships_MTM_Sort: View {
    @Query(sort: \StudentModel.name) private var students: [StudentModel]
    
    var body: some View {
        List {
            Section("Students with Classes Sorted") {
                ForEach(students) { student in
                    VStack(alignment: .leading) {
                        Text(student.name)
                        ForEach(student.viewSortedClasse, id: \ClassModel.subject) { classModel in
                            Text("- \(classModel.subject)")
                        }
                    }
                }
            }
        }
        .headerProminence(.increased)
    }
}

#Preview {
    Relationships_MTM_Sort()
        .modelContainer(ClassModel.preview)
}
