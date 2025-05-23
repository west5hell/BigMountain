//
//  Relationships_MTM_Display.swift
//  Famine
//
//  Created by Pongt Chia on 23/5/25.
//

import SwiftUI
import SwiftData

struct Relationships_MTM_Display: View {
    @Query(
        sort: \StudentModel.name
    ) private var students: [StudentModel]
    
    var body: some View {
        NavigationStack {
            List(
                students
            ) { student in
                NavigationLink {
                    ClassView(
                        student: student
                    )
                } label: {
                    StudentRowView(
                        student: student
                    )
                }
            }
            .navigationTitle(
                "Students"
            )
        }
    }
}

#Preview {
    Relationships_MTM_Display()
        .modelContainer(
            ClassModel.preview
        )
}

struct StudentRowView: View {
    let student: StudentModel
    
    var body: some View {
        Label {
            VStack(
                alignment: .leading
            ) {
                Text(
                    student.name
                )
                .font(
                    .title2.width(
                        .condensed
                    ).bold()
                )
            }
        } icon: {
            student.viewImage
                .resizable()
                .scaledToFit()
                .frame(
                    width: 50
                )
                .clipShape(
                    .rect(
                        cornerRadius: 8
                    )
                )
        }
        
    }
}

struct ClassView: View {
    let student: StudentModel
    
    let columns = [
        GridItem(
            .flexible()
        ),
        GridItem(
            .flexible()
        )
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns
            ) {
                ForEach(
                    student.classes,
                    id: \.subject
                ) { classModel in
                    NavigationLink {
                        StudentsInClassView(
                            classModel: classModel
                        )
                    } label: {
                        classModel.viewImage
                            .resizable()
                            .aspectRatio(
                                contentMode: .fit
                            )
                            .overlay(
                                alignment: .bottom
                            ) {
                                Text(
                                    classModel.subject
                                )
                                .foregroundStyle(
                                    .white
                                )
                                .padding(
                                    4
                                )
                                .background(
                                    .secondary,
                                    in: .rect(
                                        cornerRadius: 4
                                    )
                                )
                            }
                            .background(
                                .black
                            )
                            .clipShape(
                                .rect(
                                    cornerRadius: 16
                                )
                            )
                    }
                }
            }
            .padding()
        }
        .navigationTitle(
            "Classes for \(student.name)"
        )
    }
}

struct StudentsInClassView: View {
    let classModel: ClassModel
    
    var body: some View {
        List(
            classModel.students
        ) { student in
            StudentRowView(
                student: student
            )
        }
        .navigationTitle(
            "Students In \(classModel.subject)"
        )
    }
}
