//
//  Maps_Location.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI
import MapKit

struct Maps_Location: View {
    @State private var position: MapCameraPosition = .automatic
    
    private let toronto = CLLocationCoordinate2D(latitude: 43.6532, longitude: -79.3832)
    private let london = CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1278)
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MapKit",
                subtitle: "Location",
                desc: "Use the latitude and longitude to set a location using the CLLocationCoordinate2D object."
            )
            
            HStack(spacing: 20) {
                Button("Go to Toronto") {
                    position = .item(MKMapItem(placemark: .init(coordinate: toronto)))
                }
                Button("Go to London") {
                    position = .item(MKMapItem(placemark: .init(coordinate: london)))
                }
            }
            
            Map(position: $position)
                
        }
        .font(.title)
    }
}

#Preview {
    Maps_Location()
}
