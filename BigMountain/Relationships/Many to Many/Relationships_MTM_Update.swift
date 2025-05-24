//
//  Relationships_MTM_Update.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/5/25.
//

import SwiftUI
import SwiftData

struct Relationships_MTM_Update: View {
    @Query(
        filter: #Predicate<StudentModel> {
            $0.name == "Bob"
        }) private var students: [StudentModel]
    @Query(
        sort: \ClassModel.subject
    ) private var classes: [ClassModel]
    
    var bob: StudentModel { students[0] }
    
    func hasClass(subject: String) -> Bool {
        bob.classes.contains { $0.subject == subject }
    }
    
    var body: some View {
        List {
            Section("Select Bob's Classes") {
                ForEach(classes) { classModel in
                    Label(classModel.subject, systemImage: hasClass(subject: classModel.subject) ? "checkmark" : "")
                        .onTapGesture {
                            withAnimation {
                                if hasClass(subject: classModel.subject) {
                                    bob.classes.removeAll { $0.subject == classModel.subject }
                                } else {
                                    bob.classes.append(classModel)
                                }
                            }
                        }
                }
            }
            
            Section("Bob's Classes") {
                ForEach(bob.viewSortedClasse) { classModel in
                    Text(classModel.subject)
                }
            }
        }
        .headerProminence(.increased)
    }
}

#Preview {
    Relationships_MTM_Update()
        .modelContainer(ClassModel.preview)
}
