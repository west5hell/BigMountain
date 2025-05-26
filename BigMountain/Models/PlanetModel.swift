//
//  PlanetModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/5/25.
//

import SwiftUI
import SwiftData

@Model
class PlanetModel {
    var name: String
    var position = 0
    var orbitalPeriod = 0
    var image: Data
    
    init(
        name: String,
        position: Int = 0,
        orbitalPeriod: Int = 0,
        image: Data = UIImage(resource: .earth).pngData()!
    ) {
        self.name = name
        self.position = position
        self.orbitalPeriod = orbitalPeriod
        self.image = image
    }
}

extension PlanetModel {
    var viewImage: UIImage {
        if let image = UIImage(data: image) {
            return image
        } else {
            return UIImage(resource: .earth)
        }
    }
    
    var viewPosition: String {
        "\(position).circle"
    }
    
    var viewOrbitalPeriod: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let days = formatter.string(from: NSNumber(value: orbitalPeriod)) ?? "\(orbitalPeriod)"
        return "Orbital Period: \(days) days"
    }
}

extension PlanetModel {
    @MainActor
    static var modelContext: ModelContext = {
#if DEBUG
        return PlanetModel.preview.mainContext
#else
        return try! ModelContainer(for: PlanetModel.self).mainContext
#endif
    }()
}
