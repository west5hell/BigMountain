//
//  MapKitView.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/5/25.
//

import MapKit
import SwiftData
import SwiftUI

struct MapKitView: View {
    @Query private var atmLocations: [AtmModel]

    var body: some View {
        NavigationStack {
            List(atmLocations) { atm in
                NavigationLink {
                    AtmLocationView(atm: atm)
                } label: {
                    Text(atm.location)
                        .font(.title)
                }
            }
            .navigationTitle("ATM Locations")
        }
    }
}

#Preview {
    MapKitView()
        .modelContainer(AtmModel.preview)
}

struct AtmLocationView: View {
    @Bindable var atm: AtmModel

    var body: some View {
        MapReader { mapProxy in
            Map(initialPosition: atm.viewMapPosition)
                .onTapGesture { position in
                    findLocationOnMap(mapProxy: mapProxy, position: position)
                }
        }
        .navigationTitle("ATM Location")
        .overlay(alignment: .bottom) {
            VStack {
                Text("Tap map to select a location")
                HStack {
                    TextField(
                        "selected location",
                        text: $atm.location,
                        axis: .vertical
                    )
                    .textFieldStyle(.roundedBorder)
                }
            }
            .font(.title)
            .padding()
            .background(.thinMaterial)
        }
    }

    func findLocationOnMap(mapProxy: MapProxy, position: CGPoint) {
        if let coordinate = mapProxy.convert(position, from: .local) {
            let location = CLLocation(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude
            )

            CLGeocoder().reverseGeocodeLocation(location) { placemarks, _ in
                if let placemark = placemarks?.first {
                    atm.location = placemark.name ?? "Unknown location"
                }
                atm.latitude = coordinate.latitude
                atm.longitude = coordinate.longitude
            }
        }
    }
}
