//
//  Maps_Zoom.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI
import MapKit

struct Maps_Zoom: View {
    @State private var zoom: CGFloat = 15
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.7608, longitude: -111.8910),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
    )
        
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(
                "MapKit",
                subtitle: "Zoom",
                desc: "Zoom in and out of a map using the span parameter."
            )
            
            // iOS 18+ 使用 `position` 绑定
            Map(position: $position)
            
            Slider(value: $zoom, in: 0.01...50) {
                Text("Zoom Level")
            } minimumValueLabel: {
                Image(systemName: "plus.magnifyingglass")
            } maximumValueLabel: {
                Image(systemName: "minus.magnifyingglass")
            }
            .padding()
            .tint(.green)
            .onChange(of: zoom) { oldValue, newValue in
                updateMapRegion(zoom: newValue)
            }
        }
        .font(.title)
    }
    private func updateMapRegion(zoom: CGFloat) {
        let newSpan = MKCoordinateSpan(
            latitudeDelta: CLLocationDegrees(zoom),
            longitudeDelta: CLLocationDegrees(zoom)
        )
        let newRegion = MKCoordinateRegion(
            center: position.region?.center ?? CLLocationCoordinate2D(latitude: 40.7608, longitude: -111.8910),
            span: newSpan
        )
        position = .region(newRegion)
    }
}

#Preview {
    Maps_Zoom()
}
