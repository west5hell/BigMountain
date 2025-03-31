//
//  Maps_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI
import MapKit

struct Maps_Intro: View {
    @State private var mapCoordinate = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.7608, longitude: -111.8910),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(
                "MapKit",
                subtitle: "Introduction",
                desc: "You can use the Map view to show maps in your apps. You bind its starting place to a State variable."
            )
            
            Map(initialPosition: .region(mapCoordinate))
        }
        .font(.title)
    }
}

#Preview {
    Maps_Intro()
}
