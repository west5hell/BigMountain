//
//  Relationships_SelfReference_Delete.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/5/25.
//

import SwiftUI
import SwiftData

struct Relationships_SelfReference_Delete: View {
    @Environment(\.modelContext) private var modelContext
    @Query(
        filter: #Predicate<FamilyModel> {
            $0.parent == nil
        },
        sort: \FamilyModel.name,
        animation: .default
    ) private var familyMembers: [FamilyModel]
    
    var body: some View {
        NavigationStack {
            List(familyMembers, children: \FamilyModel.children) { familyMember in
                VStack(alignment: .leading) {
                    LabeledContent(familyMember.name) {
                        Button("", systemImage: "trash") {
                            deleteFamilyMember(familyMember: familyMember)
                        }
                        .font(.body)
                        .foregroundStyle(.red)
                    }
                    
                    if let parent = familyMember.parent?.name {
                        Text(parent)
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(4)
                .buttonStyle(.plain)
            }
            .navigationTitle("List View")
        }
        .font(.title2)
    }
    
    func deleteFamilyMember(familyMember: FamilyModel) {
        familyMember.children?.forEach { child in
            deleteFamilyMember(familyMember: child)
        }
        
        modelContext.delete(familyMember)
    }
}

#Preview {
    Relationships_SelfReference_Delete()
        .modelContainer(FamilyModel.preview)
}
