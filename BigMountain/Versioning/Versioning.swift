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
        [
            MountainModelSchemaV1.self, MountainModelSchemaV2.self,
            MountainModelSchemaV3.self,
        ]
    }

    static let migrateV1toV2 = MigrationStage.lightweight(
        fromVersion: MountainModelSchemaV1.self,
        toVersion: MountainModelSchemaV2.self
    )

    static var mountainToCountryDictionary: [String: String] = [:]

    static let migrateV2toV3 = MigrationStage.custom(
        fromVersion: MountainModelSchemaV2.self,
        toVersion: MountainModelSchemaV3.self
    ) { context in
        // willMigrate: before migration
        guard
            let mountains = try? context.fetch(
                FetchDescriptor<MountainModelSchemaV2.MountainModel>()
            )
        else {
            return
        }

        mountainToCountryDictionary = mountains.reduce(
            into: [:],
            { partialResult, mountain in
                partialResult[mountain.name] = mountain.country
            }
        )
    } didMigrate: { context in
        // after migration
        let uniqueCountries = Set(mountainToCountryDictionary.values)

        for country in uniqueCountries {
            context.insert(
                MountainModelSchemaV3.MountainCountryModel(name: country)
            )
        }

        try? context.save()

        guard
            let mountains = try? context.fetch(
                FetchDescriptor<MountainModelSchemaV3.MountainModel>()
            )
        else {
            return
        }

        guard
            let countries = try? context.fetch(
                FetchDescriptor<MountainModelSchemaV3.MountainCountryModel>()
            )
        else {
            return
        }

        for mtnToCountry in mountainToCountryDictionary {
            guard
                let mtnModel = mountains.first(where: {
                    $0.name == mtnToCountry.key
                })
            else { return }
            
            guard
                let countryModel = countries.first(where: {
                    $0.name == mtnToCountry.value
                })
            else { return }
            
            mtnModel.country = countryModel
            try? context.save()
        }
    }

    static var stages: [MigrationStage] {
        [migrateV1toV2, migrateV2toV3]
    }
}
