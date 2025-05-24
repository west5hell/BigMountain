//
//  Relationships_OutlineGroup.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/5/25.
//

import SwiftUI
import SwiftData

struct Relationships_OutlineGroup: View {
    @Query(
        filter: #Predicate<FamilyModel> {
            $0.parent == nil
        }
    ) private var familyMembers: [FamilyModel]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                OutlineGroup(familyMembers, children: \FamilyModel.children) { familyMember in
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
                .padding()
            }
            .navigationTitle("Outline Group")
        }
        .font(.title)
        .foregroundStyle(.primary)
    }
}

#Preview {
    Relationships_OutlineGroup()
        .modelContainer(FamilyModel.preview)
}
