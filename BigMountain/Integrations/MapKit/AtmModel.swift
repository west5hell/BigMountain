//
//  AtmModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/5/25.
//

import MapKit
import SwiftData
import SwiftUI

@Model
class AtmModel {
    var location: String
    var latitude: Double
    var longitude: Double

    init(location: String, latitude: Double, longitude: Double) {
        self.location = location
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension AtmModel {
    var viewMapPosition: MapCameraPosition {
        if latitude == 0 && longitude == 0 {
            return MapCameraPosition.region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: 0.0,
                        longitude: -80.0
                    ),
                    span: MKCoordinateSpan(
                        latitudeDelta: 100,
                        longitudeDelta: 100
                    )
                )
            )
        } else {
            return MapCameraPosition.region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: latitude,
                        longitude: longitude
                    ),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.001,
                        longitudeDelta: 0.001
                    )
                )
            )
        }
    }
}
