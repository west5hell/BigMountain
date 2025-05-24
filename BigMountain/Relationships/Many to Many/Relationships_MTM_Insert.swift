//
//  Relationships_MTM_Insert.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/5/25.
//

import SwiftUI
import SwiftData

struct Relationships_MTM_Insert: View {
    @Query(sort: \StudentModel.name) private var students: [StudentModel]
    @State private var addNewStudent = false
    
    var body: some View {
        List {
            Section {
                ForEach(students) { student in
                    StudentWithClassesRowView(student: student)
                }
            } header: {
                HStack {
                    Text("Students")
                    Spacer()
                    Button("", systemImage: "plus.circle") {
                        addNewStudent.toggle()
                    }
                }
            }

        }
        .headerProminence(.increased)
        .sheet(isPresented: $addNewStudent) {
            NewStudentView()
        }
    }
}

#Preview {
    Relationships_MTM_Insert()
        .modelContainer(ClassModel.preview)
}

struct StudentWithClassesRowView: View {
    var student: StudentModel
    
    var body: some View {
        HStack {
            student.viewImage
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .clipShape(.rect(cornerRadius: 8))
            VStack(alignment: .leading) {
                Text(student.name)
                    .font(.title3.weight(.semibold))
                Text(student.viewSortedClassSubjects, format: .list(type: .and))
            }
        }
    }
}

struct NewStudentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var allClasses: [ClassModel]
    @State private var name = ""
    @State private var allSubjects = false
    
    var body: some View {
        Form {
            Section("New Student") {
                TextField("student name", text: $name)
                Toggle("Enroll in all subjects", isOn: $allSubjects)
                Button("Save") {
                    if name.isEmpty { return }
                    let studentImage = UIImage(resource: .arches).pngData()!
                    let student = StudentModel(name: name, image: studentImage)
                    if allSubjects {
                        student.classes = allClasses
                    }
                    modelContext.insert(student)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
            }
        }
        .headerProminence(.increased)
    }
}
