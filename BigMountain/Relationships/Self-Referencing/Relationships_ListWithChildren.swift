//
//  Relationships_ListWithChildren.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/5/25.
//

import SwiftUI
import SwiftData

struct Relationships_ListWithChildren: View {
    @Query(
        filter: #Predicate<FamilyModel> {
            $0.parent == nil
        }
    ) private var familyMember: [FamilyModel]
    
    var body: some View {
        NavigationStack {
            List(familyMember, children: \FamilyModel.children) { familyMember in
                VStack(alignment: .leading) {
                    Text(familyMember.name)
                    
                    if let parent = familyMember.parent?.name {
                        Text(parent)
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(4)
            }
            .navigationTitle("List View")
        }
        .font(.title)
    }
}

#Preview {
    Relationships_ListWithChildren()
        .modelContainer(FamilyModel.preview)
}
