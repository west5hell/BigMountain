//
//  Versioning.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/5/25.
//

import SwiftData
import SwiftUI

enum MountainModelMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [MountainModelSchemaV1.self, MountainModelSchemaV2.self]
    }

    static let migrateV1toV2 = MigrationStage.lightweight(
        fromVersion: MountainModelSchemaV1.self,
        toVersion: MountainModelSchemaV2.self
    )

    static var stages: [MigrationStage] {
        [migrateV1toV2]
    }
}
